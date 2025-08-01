import 'dart:async';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.white,
          child: Center(
            child: Image.asset(
              'assets/images/Option_Brasil_PDF.pdf.png',
              width: 222.0,
              fit: BoxFit.contain,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'escolhaMotorista': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'detalhesCorridaCliente': (data) async => ParameterData(
        allParams: {
          'motoristaId': getParameter<String>(data, 'motoristaId'),
        },
      ),
  'chamarCarro-1': ParameterData.none(),
  'perfil': ParameterData.none(),
  'profile_ChangePassword': ParameterData.none(),
  'login': ParameterData.none(),
  'Carteira': ParameterData.none(),
  'Principal': ParameterData.none(),
  'fotoCNH': ParameterData.none(),
  'fotoCRLV': ParameterData.none(),
  'SucessoPagamento': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'euSou': ParameterData.none(),
  'Corridas': ParameterData.none(),
  'fotoPerfil': ParameterData.none(),
  'categoria': ParameterData.none(),
  'meusDados': ParameterData.none(),
  'minhaOferta': ParameterData.none(),
  'inicioCliente': ParameterData.none(),
  'bemvindo': ParameterData.none(),
  'fotoCarro': ParameterData.none(),
  'detalhesCorridaMotorista': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'escolhaMotoristaDescontinuado': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'perfilDetalhes': (data) async => ParameterData(
        allParams: {
          'deQuemEh': getParameter<DocumentReference>(data, 'deQuemEh'),
        },
      ),
  'meuCarro': ParameterData.none(),
  'dadosVeiculo': ParameterData.none(),
  'alterarVeiculo': ParameterData.none(),
  'contabancaria': ParameterData.none(),
  'solicitarSaque': ParameterData.none(),
  'adicionarCreditos': (data) async => ParameterData(
        allParams: {
          'valorEsperado': getParameter<double>(data, 'valorEsperado'),
        },
      ),
  'Pix': (data) async => ParameterData(
        allParams: {
          'valor': getParameter<double>(data, 'valor'),
          'id': getParameter<String>(data, 'id'),
        },
      ),
  'conversas': ParameterData.none(),
  'chatAberto': (data) async => ParameterData(
        allParams: {
          'comQuem': getParameter<DocumentReference>(data, 'comQuem'),
          'conversa': getParameter<DocumentReference>(data, 'conversa'),
        },
      ),
  'cartaoCredito': (data) async => ParameterData(
        allParams: {
          'valor': getParameter<double>(data, 'valor'),
          'ipEndereco': getParameter<String>(data, 'ipEndereco'),
        },
      ),
  'meusSaques': ParameterData.none(),
  'criarNotificacao': ParameterData.none(),
  'inicioGestor': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
