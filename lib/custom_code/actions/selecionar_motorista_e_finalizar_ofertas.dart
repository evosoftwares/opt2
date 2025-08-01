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

import 'dart:convert';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';

LatLng? _parseLatLngString(String? latLngString) {
  if (latLngString == null || latLngString.trim().isEmpty) return null;
  try {
    final parts = latLngString.trim().split(',');
    if (parts.length == 2) {
      final lat = double.tryParse(parts[0].trim());
      final lng = double.tryParse(parts[1].trim());
      if (lat != null && lng != null) {
        return LatLng(lat, lng);
      }
    }
  } catch (e) {
    print('Erro severo ao converter a string de LatLng "$latLngString": $e');
    return null;
  }
  return null;
}

Future selecionarMotoristaEFinalizarOfertas(
  int viagemId,
  String motoristaSelecionadoId,
  String googleMapsApiKey,
) async {
  final supabase = Supabase.instance.client;
  final firestore = FirebaseFirestore.instance;

  // --- ETAPA 1: BUSCAR TODOS OS DADOS NECESSÁRIOS PRIMEIRO ---
  LatLng? motoristaLatLng;
  LatLng? origemViagemLatLng;
  LatLng? destinoViagemLatLng;
  num? precoOfertado;
  List<String> todosMotoristasIds = [];

  try {
    final ofertasResponse = await supabase
        .from('ofertas')
        .select('motoristaid, precoofertado')
        .eq('viagemid', viagemId);

    todosMotoristasIds = (ofertasResponse as List)
        .map((oferta) => oferta['motoristaid'] as String)
        .toList();

    // Encontra o preço ofertado pelo motorista selecionado
    final ofertaSelecionada = (ofertasResponse as List).firstWhere(
      // <-- CORREÇÃO 1: Cast para List
      (oferta) => oferta['motoristaid'] == motoristaSelecionadoId,
      orElse: () => {'precoofertado': null},
    );
    precoOfertado = ofertaSelecionada['precoofertado'] as num?;

    // Busca dados da viagem e localização do motorista em paralelo
    final responses = await Future.wait<dynamic>([
      // <-- CORREÇÃO 2: Adicionar <dynamic>
      supabase.rpc(
        'obter_localizacoes_por_ids',
        params: {
          'ids_dos_motoristas': [motoristaSelecionadoId]
        },
      ),
      supabase
          .from('viagens')
          .select('origem, destino')
          .eq('viagemid', viagemId)
          .single(),
    ]);

    final driverLocationResponse = responses[0] as List;
    if (driverLocationResponse.isNotEmpty) {
      final locData = driverLocationResponse[0];
      motoristaLatLng = LatLng(locData['latitude'], locData['longitude']);
    }

    final viagemData = responses[1] as Map<String, dynamic>;
    origemViagemLatLng = _parseLatLngString(viagemData['origem']);
    destinoViagemLatLng = _parseLatLngString(viagemData['destino']);
  } catch (e) {
    print("[DEBUG] ETAPA 1 - ERRO CRÍTICO ao buscar dados: $e");
    return;
  }

  // O restante do código permanece o mesmo...

  // --- ETAPA 2: REALIZAR CÁLCULOS DEMORADOS (API EXTERNA) ---
  DateTime? horarioPartida;
  DateTime? horarioChegada;
  if (motoristaLatLng != null &&
      origemViagemLatLng != null &&
      destinoViagemLatLng != null) {
    try {
      Future<int> getDuration(LatLng origin, LatLng destination) async {
        final url = Uri.parse(
            'https://maps.googleapis.com/maps/api/directions/json?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=$googleMapsApiKey');
        final response = await http.get(url);
        if (response.statusCode == 200) {
          final decodedResponse = json.decode(response.body);
          if (decodedResponse['status'] == 'OK' &&
              decodedResponse['routes'].isNotEmpty) {
            return decodedResponse['routes'][0]['legs'][0]['duration']['value'];
          }
        }
        return 0;
      }

      final durations = await Future.wait([
        getDuration(motoristaLatLng, origemViagemLatLng),
        getDuration(origemViagemLatLng, destinoViagemLatLng),
      ]);

      final etaMotoristaSegundos = durations[0];
      final duracaoViagemSegundos = durations[1];

      final agora = DateTime.now();
      horarioPartida = agora.add(Duration(seconds: etaMotoristaSegundos));
      horarioChegada =
          horarioPartida.add(Duration(seconds: duracaoViagemSegundos));
    } catch (e) {
      print("[DEBUG] ETAPA 2 - ERRO na API do Google Directions: $e");
    }
  }

  // --- ETAPA 3: EXECUTAR TODAS AS ESCRITAS NO BANCO DE DADOS DE UMA VEZ ---
  try {
    final batch = firestore.batch();
    final motoristasRejeitadosIds =
        todosMotoristasIds.where((id) => id != motoristaSelecionadoId).toList();

    for (final driverId in motoristasRejeitadosIds) {
      final userDocRef = firestore.collection('users').doc(driverId);
      batch.update(userDocRef, {'idViagem': null, 'aceitou': false});
    }

    if (motoristaSelecionadoId.isNotEmpty) {
      final selectedUserDocRef =
          firestore.collection('users').doc(motoristaSelecionadoId);
      batch.update(selectedUserDocRef, {'aceitou': false});
    }

    final updatePayload = {
      'motoristaReference': motoristaSelecionadoId,
      'status': 'Aceito',
      'horarioOrigem': horarioPartida?.toIso8601String(),
      'horarioChegada': horarioChegada?.toIso8601String(),
      'precosugerido': precoOfertado,
    };
    updatePayload.removeWhere((key, value) => value == null);

    final supabaseViagemUpdate =
        supabase.from('viagens').update(updatePayload).eq('viagemid', viagemId);

    final supabaseOfertasDelete = supabase
        .from('ofertas')
        .delete()
        .eq('viagemid', viagemId)
        .filter('motoristaid', 'in', motoristasRejeitadosIds);

    await Future.wait([
      batch.commit(),
      supabaseViagemUpdate,
      if (motoristasRejeitadosIds.isNotEmpty) supabaseOfertasDelete,
    ]);

    print('[DEBUG] SUCESSO! Operações finalizadas para a viagem $viagemId.');
  } catch (e) {
    print('[DEBUG] ETAPA 3 - ERRO FINAL ao escrever nos bancos de dados: $e');
  }
}
