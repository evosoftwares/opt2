import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

int strToInt(String arg1) {
  // string to integer
  return int.parse(arg1);
}

List<String> addtoList(
  List<String> list,
  String newItem,
) {
  // add to list
  list.add(newItem);
  return list;
}

DateTime secondsToDate(int seconds) {
  // secods to date
  return DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
}

double distanciaOrigemDestino(
  LatLng origemLocation,
  LatLng destinoLocation,
) {
  // Pega os valores que vem do parametro que enviamos no action
  final double origemLat = origemLocation.latitude;
  final double origemLng = origemLocation.longitude;
  final double destinoLat = destinoLocation.latitude;
  final double destinoLng = destinoLocation.longitude;

  // Constante do radio da terra pra Km
  const double R = 6371.0;

  // Converte graus para radianos e calcula diferenças, NÃO ALTERA AQUI MANO PLMDD
  final double dLat = (origemLat - destinoLat) * (math.pi / 180.0);
  final double dLng = (origemLng - destinoLng) * (math.pi / 180.0);
  final double lat1Rad = origemLat * (math.pi / 180.0);
  final double lat2Rad = destinoLat * (math.pi / 180.0);

  // Fórmula de Haversine BY GOOGLE(Igual a do MAPS)
  final double a = math.sin(dLat / 2.0) * math.sin(dLat / 2.0) +
      math.cos(lat1Rad) *
          math.cos(lat2Rad) *
          math.sin(dLng / 2.0) *
          math.sin(dLng / 2.0);
  final double c = 2.0 * math.atan2(math.sqrt(a), math.sqrt(1.0 - a));

  // Calcula a distância final
  final double distance = R * c;

  return distance;
}

String formatarLatLngParaString(String latLngString) {
  try {
    final String resultado = latLngString
        .replaceAll('LatLng(lat: ', '')
        .replaceAll(', lng: ', ', ') // Substitui o separador ", lng: " por ", "
        .replaceAll(')', ''); // Remove o parêntese final

    return resultado;
  } catch (e) {
    print('Erro ao formatar a string LatLng: $e');
    return '';
  }
}

double calcularValorCorrida(
  double distancia,
  double valorWidget,
) {
  double formatacaometros = distancia / 1000;
  double valorTemp = valorWidget * formatacaometros;
  double valorCorrida = (valorTemp * 100).roundToDouble() / 100;

  // Garante que o valor da corrida não seja menor que o valor mínimo
  return valorCorrida;
}

double calcularAlturaLista(int? numeroDeOfertas) {
  double alturaPorItem = 105.0;

  if (numeroDeOfertas == null || numeroDeOfertas == 0) {
    return 150.0;
  }

  return numeroDeOfertas * alturaPorItem;
}

dynamic calculaTempoCadastro(DateTime dataCriacao) {
  if (dataCriacao == null) {
    return jsonEncode({'value': 0.0, 'unit': 'invalid'});
  }

  final now = DateTime.now();
  final difference = now.difference(dataCriacao);

  String unit;
  double value;

  // Prioridade: Anos -> Meses -> Semanas -> Dias -> Horas -> Minutos
  if (difference.inDays >= 365) {
    unit = 'anos';
    value = (difference.inDays / 365.0);
  } else if (difference.inDays >= 30) {
    unit = 'meses';
    value = (difference.inDays / 30.0);
  } else if (difference.inDays >= 7) {
    unit = 'semanas';
    value = (difference.inDays / 7.0);
  } else if (difference.inDays >= 1) {
    unit = 'dias';
    value = difference.inDays.toDouble();
  } else if (difference.inHours >= 1) {
    unit = 'horas';
    value = difference.inHours.toDouble();
  } else {
    unit = 'minutos';
    value = difference.inMinutes.toDouble();
  }

  // Arredonda para uma casa decimal
  value = double.parse(value.toStringAsFixed(1));

  final result = {
    'value': value,
    'unit': unit,
  };

  return jsonEncode(result);
}

LatLng? strToLatLng(String? locationTexto) {
  if (locationTexto == null ||
      locationTexto.isEmpty ||
      !locationTexto.contains(',')) {
    return null;
  }

  List<String> parts = locationTexto.split(',');

  if (parts.length != 2) {
    return null;
  }

  try {
    double latitude = double.parse(parts[0].trim());
    double longitude = double.parse(parts[1].trim());

    return LatLng(latitude, longitude);
  } catch (e) {
    print('Erro ao converter string para LatLng: $e');
    return null;
  }
}

double garantirValorDouble(dynamic jsonBody) {
  // Se o corpo do JSON for nulo ou não for um mapa, retorna 0.0
  if (jsonBody == null || jsonBody is! Map<String, dynamic>) {
    return 0.0;
  }

  // Extrai o valor do campo 'value' do JSON
  final valor = jsonBody['value'];

  // Se o valor extraído for nulo, retorna 0.0
  if (valor == null) {
    return 0.0;
  }

  // Se o valor já for um double, retorna ele mesmo.
  if (valor is double) {
    return valor;
  }

  // Se for um inteiro, converte para double.
  if (valor is int) {
    return valor.toDouble();
  }

  // Se for uma String, tenta converter.
  if (valor is String) {
    return double.tryParse(valor) ?? 0.0;
  }

  // Para qualquer outro caso, retorna 0.0 como segurança.
  return 0.0;
}

String? limparStringNumerico(String? cpf) {
  if (cpf == null) {
    return null;
  }

  String cpfLimpo = cpf.replaceAll(RegExp(r'\D'), '');

  return cpfLimpo;
}

String mascaraValorDinheiroInitial(double valorASerAlterado) {
  String valorString = valorASerAlterado.toStringAsFixed(2);

  List<String> partes = valorString.split('.');
  String parteInteira = partes[0];
  String parteDecimal = partes.length > 1 ? partes[1] : '00';

  String parteInteiraFormatada = '';
  for (int i = 0; i < parteInteira.length; i++) {
    parteInteiraFormatada += parteInteira[i];
    if ((parteInteira.length - 1 - i) % 3 == 0 &&
        (parteInteira.length - 1 - i) != 0) {
      parteInteiraFormatada += '.';
    }
  }

  return '$parteInteiraFormatada,$parteDecimal';
}

dynamic converteDataEmJson(String dataa) {
  List<String> partes = dataa.split('/');
  String mes = partes[0];
  String ano = partes[1];

  final intMes = int.tryParse(mes);
  final intAno = int.tryParse(ano);

  if (intMes == null ||
      intMes < 1 ||
      intMes > 12 ||
      intAno == null ||
      intAno < 0 ||
      intAno > 3000) {
    return null;
  }

  return {
    'mes': mes,
    'ano': ano,
  };
}

dynamic separaNome(String nomeCompleto) {
  List<String> partesDoNome = nomeCompleto.trim().split(' ');

  String primeiroNome = '';
  String sobrenome = '';

  if (partesDoNome.isNotEmpty) {
    primeiroNome = partesDoNome[0];

    if (partesDoNome.length > 1) {
      sobrenome = partesDoNome.sublist(1).join(' ');
    }
  }

  Map<String, String> resultado = {
    'primeiroNome': primeiroNome,
    'sobrenome': sobrenome,
  };

  return resultado;
}

String? verificaBandeiraCartao(String numeroCartao) {
  // Remove quaisquer caracteres não numéricos do número do cartão.
  String numeroLimpo = numeroCartao.replaceAll(RegExp(r'[^0-9]'), '');

  // Se o número limpo estiver vazio, não podemos identificar a bandeira.
  if (numeroLimpo.isEmpty) {
    return 'Desconhecida'; // Ou retorne null se preferir: return null;
  }

  // Expressões regulares para identificar as bandeiras de cartão.
  // Visa: Começa com 4, tem 13 ou 16 dígitos.
  if (RegExp(r'^4[0-9]{12}(?:[0-9]{3})?$').hasMatch(numeroLimpo)) {
    return 'visa';
  }

  // Mastercard: Começa com 51-55 ou 2221-2720, tem 16 dígitos.
  // ADICIONADO: O prefixo 503143 para Mastercard.
  if (RegExp(
          r'^(?:5[1-5][0-9]{2}|222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720|503143)[0-9]{10,13}$') // Ajustado o comprimento final para 16 dígitos no total
      .hasMatch(numeroLimpo)) {
    return 'mastercard';
  }

  // American Express: Começa com 34 ou 37, tem 15 dígitos.
  if (RegExp(r'^3[47][0-9]{13}$').hasMatch(numeroLimpo)) {
    return 'american express';
  }
  // Elo: Vários prefixos. Esta é uma lista comum, mas pode não ser exaustiva.
  // Exemplos: 401178, 401179, 431274, 438935, 451416, 457393, 457631, 457632, 504175, 506699 ... 650XXX, etc.
  // A regex abaixo tenta cobrir uma gama de prefixos conhecidos da Elo.
  if (RegExp(r'^(40117[8-9]|431274|438935|451416|457393|457631|457632|504175|506699|5067[0-6][0-9]|50677[0-8]|509[0-9]{3}|627780|636297|636368|65003[1-3]|65003[5-9]|65004[0-9]|65005[0-1]|6504[0-3][0-9]|65048[5-9]|65049[0-9]|6505[0-2][0-9]|65053[0-8]|65054[1-9]|6505[5-8][0-9]|65059[0-8]|65070[0-9]|65071[0-8]|65072[0-7]|6509[0-1][0-9]|650920|65165[2-9]|6516[6-7][0-9]|65500[0-9]|65501[0-9]|65502[1-9]|6550[3-4][0-9]|65505[0-8])\d{8,15}$')
          .hasMatch(numeroLimpo) ||
      RegExp(r'^(506699|5067[0-7][0-9]|509\d{3}|65003[1-35-9]|65004\d|65005[01]|6504[0-3]\d|65048[5-9]|65049\d|6505[0-2]\d|65053[0-8]|65054[1-9]|6505[5-8]\d|65059[0-8]|65070\d|65071[0-8]|65072[0-7]|6509[01]\d|650920|65165[2-9]|6516[67]\d|65500\d|65501\d|65502[1-9]|6550[34]\d|65505[0-8])\d{10,13}$')
          .hasMatch(numeroLimpo) ||
      RegExp(r'^(401178|401179|431274|438935|451416|457393|457631|457632|504175|627780|636297|636368)\d{10,13}$')
          .hasMatch(numeroLimpo)) {
    return 'elo';
  }
  // Hipercard: Geralmente começa com 606282, 384100, 384140, 384160.
  if (RegExp(r'^(606282|384100|384140|384160)\d{10,13}$')
      .hasMatch(numeroLimpo)) {
    return 'hipercard';
  }

  return 'Desconhecida';
}

DocumentReference convertStringEmReference(String userIdString) {
  if (userIdString == null || userIdString.isEmpty) {
    // Retorna uma referência inválida para evitar erros se a string for nula/vazia
    return FirebaseFirestore.instance.collection('users').doc('invalid-id');
  }

  return FirebaseFirestore.instance.collection('users').doc(userIdString);
}

String formatarDataParaUTC(DateTime? dataHora) {
  if (dataHora == null) {
    return '--:--';
  }
  // Converte a data para UTC antes de formatar.
  final dataEmUTC = dataHora.toUtc();
  // Formata a data UTC para o formato Hora:Minuto.
  final formato = DateFormat('Hm');
  return formato.format(dataEmUTC);
}

dynamic converteLatLngSeparado(String latLngString) {
  try {
    String cleanedString = latLngString
        .replaceAll('LatLng(lat: ', '')
        .replaceAll(', lng: ', ',')
        .replaceAll(')', '')
        .trim();

    List<String> parts = cleanedString.split(',');

    if (parts.length != 2) {
      return {};
    }

    double latitude = double.parse(parts[0].trim());
    double longitude = double.parse(parts[1].trim());

    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  } catch (e) {
    print('Erro ao analisar a string LatLng: $e');
    return {};
  }
}

String? getCityFromGeocodingResponse(dynamic geocodingResponseJson) {
  if (geocodingResponseJson == null) {
    return null;
  }

  try {
    // geocodingResponseJson já é um objeto JSON dinâmico (Map ou List)
    // Então, não precisamos de `json.decode` aqui.

    if (geocodingResponseJson['results'] != null &&
        geocodingResponseJson['results'].isNotEmpty) {
      // Acessamos o primeiro resultado, que geralmente é o mais relevante
      final firstResult = geocodingResponseJson['results'][0];

      if (firstResult['address_components'] != null &&
          firstResult['address_components'] is List) {
        for (var component in firstResult['address_components']) {
          if (component['types'] != null &&
              component['types'] is List &&
              component['types'].contains('administrative_area_level_2')) {
            return component['long_name'];
          }
        }
      }
    }
  } catch (e) {
    print('Erro ao extrair a cidade do JSON: $e');
    return null;
  }

  return null;
}

double mediaDasAvaliacoes(List<double>? avaliacoes) {
// Importa a biblioteca de matemática, embora não seja estritamente necessária aqui, é uma boa prática.

// A função recebe uma lista de números (doubles) chamada 'avaliacoes'.
  // 1. VERIFICAÇÃO INICIAL:
  // Primeiro, verifica se a lista que a função recebeu está nula ou vazia.
  // Se estiver, retorna 0.0 para evitar qualquer erro de cálculo.
  if (avaliacoes == null || avaliacoes.isEmpty) {
    return 0.0;
  }

  // 2. CÁLCULO DA SOMA:
  // Cria uma variável para guardar a soma de todas as avaliações.
  double soma = 0.0;

  // Usa um laço "for-each" para passar por cada 'nota' dentro da lista 'avaliacoes'.
  for (var nota in avaliacoes) {
    // Adiciona o valor de cada nota à variável 'soma'.
    soma = soma + nota;
  }

  // 3. CÁLCULO DA MÉDIA E RETORNO:
  // Divide a soma total pelo número de itens na lista para obter a média.
  // E retorna o resultado final.
  return soma / avaliacoes.length;
}
