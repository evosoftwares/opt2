// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geolocator/geolocator.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:permission_handler/permission_handler.dart';

String? _supabaseUrl;
String? _supabaseAnonKey;
String? _motoristaFirebaseUid;

@pragma('vm:entry-point')
Future<bool> onStart(ServiceInstance service) async {
  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  service.on('startParams').listen((data) async {
    if (data == null) {
      service.stopSelf();
      return;
    }

    _supabaseUrl = data['supabaseUrl'];
    _supabaseAnonKey = data['supabaseAnonKey'];
    _motoristaFirebaseUid = data['userId'];

    if (_supabaseUrl == null ||
        _supabaseAnonKey == null ||
        _motoristaFirebaseUid == null) {
      service.stopSelf();
      return;
    }

    try {
      await Supabase.initialize(
        url: _supabaseUrl!,
        anonKey: _supabaseAnonKey!,
      );

      final SupabaseClient client = Supabase.instance.client;
      const Duration updateInterval = Duration(seconds: 10);

      Timer.periodic(updateInterval, (timer) async {
        try {
          final hasPermission = await Geolocator.checkPermission();
          if (hasPermission == LocationPermission.denied ||
              hasPermission == LocationPermission.deniedForever) {
            timer.cancel();
            service.stopSelf();
            return;
          }

          Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
            timeLimit: const Duration(seconds: 5),
          );

          await client.from('LocalizacaoMotorista').upsert({
            'user_id': _motoristaFirebaseUid,
            'localizacao': 'POINT(${position.longitude} ${position.latitude})',
            'timestamp': DateTime.now().toIso8601String(),
          }, onConflict: 'user_id');
        } catch (e) {
          print('ERRO no loop do serviço de localização: $e');
        }
      });
    } catch (e) {
      print('ERRO na inicialização do serviço de localização: $e');
      service.stopSelf();
    }
  });

  return true;
}

Future<void> initializeService() async {
  final service = FlutterBackgroundService();
  await service.configure(
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onStart,
      onBackground: onStart,
    ),
    androidConfiguration: AndroidConfiguration(
      isForegroundMode: true,
      autoStart: true,
      onStart: onStart,
      foregroundServiceTypes: [
        AndroidForegroundType.location,
      ],
    ),
  );
}

Future<bool> locEmTempoReal(BuildContext context) async {
  // ETAPA 1: Checagem de permissões (sem alteração)
  var locationStatus = await Permission.location.request();
  if (locationStatus.isDenied || locationStatus.isPermanentlyDenied) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text(
              'A permissão de localização é necessária para o rastreamento.')),
    );
    if (locationStatus.isPermanentlyDenied) {
      await openAppSettings();
    }
    return false;
  }

  var backgroundStatus = await Permission.locationAlways.request();
  if (!backgroundStatus.isGranted) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
            "Para rastreamento contínuo, habilite a permissão 'Permitir o tempo todo' nas configurações."),
        duration: Duration(seconds: 8),
      ),
    );
    await openAppSettings();
    return false;
  }

  // ETAPA 2: Lógica de Reset (código alterado)
  final service = FlutterBackgroundService();
  bool isRunning = await service.isRunning();

  // Se o serviço já estiver rodando, pare-o primeiro para garantir um início limpo.
  if (isRunning) {
    await stopBackgroundLocationService();
    // Pequena pausa para garantir que o serviço do SO seja encerrado.
    await Future.delayed(const Duration(milliseconds: 500));
  }

  // ETAPA 3: Iniciar o serviço do zero (código movido e ajustado)
  await initializeService();

  final currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Erro: Usuário não autenticado.')),
    );
    return false;
  }

  final String supabaseUrl = FFAppState().supabaseUrl;
  final String supabaseAnonKey = FFAppState().supabaseAnnonkey;

  service.invoke('startParams', {
    'supabaseUrl': supabaseUrl,
    'supabaseAnonKey': supabaseAnonKey,
    'userId': currentUser.uid,
  });

  // Aguarda um instante para o 'invoke' ser processado antes da verificação final.
  await Future.delayed(const Duration(milliseconds: 200));

  isRunning = await service.isRunning();
  if (isRunning) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Rastreamento de localização iniciado.')),
    );
    return true;
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text('Erro ao iniciar o serviço de rastreamento.')),
    );
    return false;
  }
}

Future<void> stopBackgroundLocationService() async {
  final service = FlutterBackgroundService();
  service.invoke('stopService');
}
