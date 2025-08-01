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

import 'dart:math' show pow, sin, cos, atan2, sqrt, pi;

/// Calcula a distância em quilômetros entre dois pontos geográficos (LatLng)
/// usando a fórmula de Haversine.
double _calculateDistance(LatLng start, LatLng end) {
  const R = 6371; // Raio da Terra em quilômetros.

  // Converte graus para radianos para uso em funções trigonométricas.
  final toRadians = (double degrees) => degrees * pi / 180;

  final lat1Rad = toRadians(start.latitude);
  final lon1Rad = toRadians(start.longitude);
  final lat2Rad = toRadians(end.latitude);
  final lon2Rad = toRadians(end.longitude);

  final dLat = lat2Rad - lat1Rad;
  final dLon = lon2Rad - lon1Rad;

  final a = pow(sin(dLat / 2), 2) +
      cos(lat1Rad) * cos(lat2Rad) * pow(sin(dLon / 2), 2);
  final c = 2 * atan2(sqrt(a), sqrt(1 - a));
  final distance = R * c;

  return distance;
}

/// Busca motoristas (UsersRecord) dentro de um raio de distância especificado
/// a partir da localização de um usuário.
///
/// A função otimiza a busca de localizações fazendo uma única chamada RPC
/// ao Supabase para obter as coordenadas de todos os motoristas de uma vez.
Future<List<UsersRecord>> buscarMotoristasProximos(
  List<UsersRecord> places,
  LatLng userGeo,
  double maxDistance,
) async {
  // Retorna imediatamente se a lista de motoristas fornecida estiver vazia.
  if (places.isEmpty) {
    return [];
  }

  final supabase = SupaFlow.client;
  // Extrai os UIDs de todos os motoristas para a consulta.
  final List<String> motoristaIds = places.map((p) => p.uid).toList();

  try {
    // Invoca a função RPC 'obter_localizacoes_por_ids' para buscar as
    // localizações de múltiplos motoristas em uma única requisição.
    final List<dynamic> localizacoesData = await supabase.rpc(
      'obter_localizacoes_por_ids',
      params: {'ids_dos_motoristas': motoristaIds},
    );

    // Mapeia as localizações recebidas por user_id para otimizar a busca.
    final Map<String, LatLng> mapaDeLocalizacoes = {};
    for (var locData in localizacoesData) {
      // Garante que os dados de localização não são nulos antes de processar.
      if (locData['user_id'] != null &&
          locData['latitude'] != null &&
          locData['longitude'] != null) {
        final userId = locData['user_id'] as String;
        final latitude = locData['latitude'] as double;
        final longitude = locData['longitude'] as double;
        mapaDeLocalizacoes[userId] = LatLng(latitude, longitude);
      }
    }

    // Estrutura para armazenar os motoristas que estão dentro do raio e suas distâncias.
    List<Map<String, dynamic>> placesWithDistance = [];

    for (final place in places) {
      final LatLng? motoristaLocation = mapaDeLocalizacoes[place.uid];

      // Prossegue apenas se a localização do motorista foi encontrada no mapa.
      if (motoristaLocation != null) {
        final distanceKm = _calculateDistance(userGeo, motoristaLocation);

        // Adiciona o motorista à lista se ele estiver dentro da distância máxima.
        if (distanceKm <= maxDistance) {
          placesWithDistance.add({
            'place': place,
            'distance': distanceKm,
          });
        }
      }
      // Motoristas sem localização encontrada no mapa são ignorados.
    }

    // Ordena a lista de motoristas pela distância, do mais próximo ao mais distante.
    placesWithDistance.sort(
        (a, b) => (a['distance'] as double).compareTo(b['distance'] as double));

    // Extrai e retorna a lista final de 'UsersRecord' ordenados.
    final resultPlaces =
        placesWithDistance.map((item) => item['place'] as UsersRecord).toList();

    return resultPlaces;
  } catch (e) {
    // Em caso de falha na chamada RPC ou no processamento, loga o erro.
    // Para um ambiente de produção, considere usar um serviço de logging mais robusto.
    print(
        'ERRO_BUSCAR_RPC: Erro ao chamar a função RPC ou processar dados: $e');
    // Retorna uma lista vazia para garantir que a aplicação não quebre.
    return [];
  }
}
