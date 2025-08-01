import 'dart:convert';
import '../cloud_functions/cloud_functions.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GoogleMatrixCall {
  static Future<ApiCallResponse> call({
    String? origem = '',
    String? destino = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Google Matrix',
      apiUrl:
          'https://maps.googleapis.com/maps/api/distancematrix/json?destinations=${destino}&origins=${origem}&units=imperial   &key=AIzaSyCoZBZ6RHxpq0EeKa4-UCkwSQrymtRacms',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'origem': origem,
        'destino': destino,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? strKM(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.rows[:].elements[:].distance.text''',
      ));
  static int? intKM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.rows[:].elements[:].distance.value''',
      ));
  static String? strMIN(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.rows[:].elements[:].duration.text''',
      ));
  static int? intMIN(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.rows[:].elements[:].duration.value''',
      ));
}

class TriggerSendMailCall {
  static Future<ApiCallResponse> call({
    String? subject = '',
    String? body = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'TriggerSendMail',
      apiUrl:
          'https://evosoftwares2.app.n8n.cloud/webhook-test/e25b425e-9782-4c51-bd75-dcb0e47f1630',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'subject': subject,
        'body': body,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DistanciaOrigemEDestinoCall {
  static Future<ApiCallResponse> call({
    String? destination = '',
    String? key = 'AIzaSyB02pY9d0TwSf34DHLE3-h9-fD3lp4F0KQ',
    String? origin = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Distancia origem e destino',
      apiUrl: 'https://maps.googleapis.com/maps/api/directions/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'origin': origin,
        'destination': destination,
        'key': key,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? distanciaCaminho(dynamic response) => getJsonField(
        response,
        r'''$.routes[:].legs''',
        true,
      ) as List?;
}

class ObterQRCodeCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ObterQRCodeCall',
        'variables': {
          'id': id,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic linkPix(dynamic response) => getJsonField(
        response,
        r'''$.payload''',
      );
  static dynamic imagem(dynamic response) => getJsonField(
        response,
        r'''$.encodedImage''',
      );
}

class ChecaStatusCobrancaCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ChecaStatusCobrancaCall',
        'variables': {
          'id': id,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic statusPagamento(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

class CriarClienteAsaasCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? cpfCnpj = '',
    String? email = '',
    String? phone = '',
    String? postalCode = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CriarClienteAsaasCall',
        'variables': {
          'name': name,
          'cpfCnpj': cpfCnpj,
          'email': email,
          'phone': phone,
          'postalCode': postalCode,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic idCerto(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
}

class CriarCobrancaAsaasCall {
  static Future<ApiCallResponse> call({
    String? customer = '',
    String? billingType = '',
    double? value,
    String? dueDate = '',
    String? description = '',
    String? holderName = '',
    String? number = '',
    String? expiryMonth = '',
    String? expiryYear = '',
    String? ccv = '',
    String? name = '',
    String? email = '',
    String? cpfCnpj = '',
    String? postalCode = '',
    String? adressNumber = '',
    String? phone = '',
    String? remoteIp = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CriarCobrancaAsaasCall',
        'variables': {
          'customer': customer,
          'billingType': billingType,
          'value': value,
          'dueDate': dueDate,
          'description': description,
          'holderName': holderName,
          'number': number,
          'expiryMonth': expiryMonth,
          'expiryYear': expiryYear,
          'ccv': ccv,
          'name': name,
          'email': email,
          'cpfCnpj': cpfCnpj,
          'postalCode': postalCode,
          'adressNumber': adressNumber,
          'phone': phone,
          'remoteIp': remoteIp,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic idPagamento(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
}

class SaqueCall {
  static Future<ApiCallResponse> call({
    double? value,
    String? operationType = '',
    String? pixAddresKey = '',
    String? pixAdressKeyType = '',
    String? description = 'Saque do Option',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SaqueCall',
        'variables': {
          'value': value,
          'operationType': operationType,
          'pixAddresKey': pixAddresKey,
          'pixAdressKeyType': pixAdressKeyType,
          'description': description,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class IniciarSaqueAsaasCall {
  static Future<ApiCallResponse> call({
    String? idInterno = '',
    double? valor,
    dynamic dadosBancariosJson,
  }) async {
    final dadosBancarios = _serializeJson(dadosBancariosJson);
    final ffApiRequestBody = '''
{
  "valor": ${valor},
  "idInterno": "${escapeStringForJson(idInterno)}",
  "dadosBancarios": ${dadosBancarios}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'iniciarSaqueAsaas',
      apiUrl:
          'https://southamerica-east1-opt2-n5y3g4.cloudfunctions.net/iniciarSaque',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GoogleConvertGeocodeCall {
  static Future<ApiCallResponse> call({
    String? lat = '',
    String? lng = '',
    String? apiKey = 'AIzaSyB02pY9d0TwSf34DHLE3-h9-fD3lp4F0KQ',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'google convert geocode',
      apiUrl:
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${lng}&key=${apiKey}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
