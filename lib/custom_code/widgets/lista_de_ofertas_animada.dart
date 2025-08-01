// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:intl/intl.dart';

// #region Funções Auxiliares de Top-Level
// Estas funções são definidas fora de qualquer classe para serem reutilizáveis.

/// Converte uma string de coordenadas no formato 'lat: X, lng: Y' para um objeto LatLng.
///
/// Retorna [null] se a string for nula, vazia ou tiver um formato inválido.
/// Útil para tratar dados de localização armazenados como texto no banco de dados.
/// Converte uma string de coordenadas para um objeto LatLng.
/// Funciona com os formatos 'lat: X, lng: Y' E 'latitude,longitude'.
LatLng? _parseLatLngString(String? latLngString) {
  if (latLngString == null || latLngString.trim().isEmpty) return null;

  // Tenta o formato 'lat: X, lng: Y'
  if (latLngString.contains('lat:')) {
    try {
      final latString = latLngString.split('lat: ')[1].split(',')[0];
      final lngString = latLngString.split('lng: ')[1].split(')')[0];
      return LatLng(double.parse(latString), double.parse(lngString));
    } catch (e) {
      print('Erro ao converter formato "lat: lng:": $e');
      return null;
    }
  }
  // Tenta o formato 'latitude,longitude'
  else if (latLngString.contains(',')) {
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
      print('Erro ao converter formato "lat,lng": $e');
      return null;
    }
  }

  // Se nenhum formato for reconhecido
  print('Formato de LatLng não reconhecido: "$latLngString"');
  return null;
}

/// Busca e consolida o perfil de um motorista a partir de múltiplas fontes de dados.
///
/// - **Firestore**: Obtém dados estáticos como nome, foto e avaliações.
/// - **Supabase**: Obtém a localização em tempo real do motorista.
///
/// @param motoristaId O UID do motorista.
/// @param passageiroLocation A localização do passageiro, para calcular a distância.
/// @return Um [Map] com os dados do perfil ou um mapa vazio em caso de erro.
Future<Map<String, dynamic>> _getMotoristaProfile(
    String motoristaId, LatLng? passageiroLocation) async {
  if (motoristaId.isEmpty) {
    print('[DEBUG] motoristaId recebido estava vazio.');
    return {};
  }

  try {
    // 1. Busca dados do Firestore
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(motoristaId)
        .get();

    if (!userDoc.exists) {
      print(
          '[DEBUG] Motorista com ID "$motoristaId" não encontrado no Firestore.');
      return {};
    }

    final userData = userDoc.data()!;
    final List<dynamic> avaliacoesRaw = userData['avaliacoes'] ?? [];
    final List<double> avaliacoes =
        avaliacoesRaw.map((a) => (a as num).toDouble()).toList();
    double notaMedia = avaliacoes.isEmpty
        ? 0.0
        : avaliacoes.reduce((a, b) => a + b) / avaliacoes.length;

    // 2. Busca localização via função RPC no Supabase
    LatLng? motoristaLocation;

    final locationResponse = await Supabase.instance.client.rpc(
      'obter_localizacoes_por_ids',
      params: {
        'ids_dos_motoristas': [motoristaId]
      },
    );

    print('[DEBUG] Resposta RPC localização: $locationResponse');

    if (locationResponse is List && locationResponse.isNotEmpty) {
      final locData = locationResponse[0];
      if (locData is Map &&
          locData.containsKey('latitude') &&
          locData.containsKey('longitude')) {
        try {
          final latDouble = double.parse(locData['latitude'].toString());
          final lngDouble = double.parse(locData['longitude'].toString());
          motoristaLocation = LatLng(latDouble, lngDouble);
          print('[DEBUG] Coordenadas do motorista: $motoristaLocation');
        } catch (e) {
          print('[DEBUG] Erro ao converter coordenadas para double: $e');
        }
      } else {
        print('[DEBUG] Dados de localização incompletos no retorno da RPC.');
      }
    } else {
      print(
          '[DEBUG] RPC não retornou dados válidos para o motorista: $motoristaId');
    }

    // 3. Cálculo da distância
    double distanciaKm = 0.0;

    print('[DEBUG] Localização do passageiro: $passageiroLocation');
    print('[DEBUG] Localização do motorista: $motoristaLocation');

    if (motoristaLocation != null && passageiroLocation != null) {
      double distanciaMetros = Geolocator.distanceBetween(
        passageiroLocation.latitude,
        passageiroLocation.longitude,
        motoristaLocation.latitude,
        motoristaLocation.longitude,
      );
      distanciaKm = distanciaMetros / 1000;
      print('[DEBUG] Distância calculada: $distanciaKm km');
    } else {
      print(
          '[DEBUG] Não foi possível calcular a distância. Um dos pontos está nulo.');
    }

    // 4. Retorno consolidado
    return {
      'displayName': userData['display_name'] ?? 'Motorista',
      'photo_url': userData['photo_url'],
      'modeloDoCarro': userData['modeloDoCarro'] ?? 'Não informado',
      'nota': notaMedia,
      'distancia': distanciaKm,
    };
  } catch (e) {
    print(
        'Erro CRÍTICO ao buscar perfil completo do motorista ($motoristaId): $e');
    return {};
  }
}

/// Um widget de card que representa uma única oferta de motorista.
///
/// É um componente de UI auto-contido, responsável por exibir os detalhes
/// de uma oferta e delegar a ação de toque para o widget pai.
class CardOfertaMotorista extends StatelessWidget {
  const CardOfertaMotorista({
    Key? key,
    required this.oferta,
    required this.localizacaoPassageiro,
    required this.onTap,
  }) : super(key: key);

  /// Mapa contendo os dados brutos da oferta vindos da tabela 'ofertas' do Supabase.
  final Map<String, dynamic> oferta;

  /// Localização do passageiro, necessária para calcular a distância do motorista.
  final LatLng? localizacaoPassageiro;

  /// Função de callback executada quando o card é pressionado.
  final Future<void> Function() onTap;

  @override
  Widget build(BuildContext context) {
    final motoristaId = oferta['motoristaid'] as String?;
    final precoNumerico = oferta['precoofertado'] as num?;

    // Formata o preço da corrida para o padrão monetário brasileiro (BRL).
    // Garante que mesmo com falha, um valor padrão "N/A" seja exibido.
    String precoFormatado = "N/A";
    if (precoNumerico != null) {
      // Usa o pacote intl para uma formatação de moeda correta e localizada.
      // O `\` antes de `$` é necessário para escapar o caractere especial.
      precoFormatado = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
          .format(precoNumerico);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        // Usa um FutureBuilder para carregar os dados do perfil do motorista de forma assíncrona.
        // Isso permite que a UI exiba um estado de carregamento enquanto os dados são buscados.
        child: motoristaId == null
            ? SizedBox(
                height: 95, child: Center(child: Text('Dados inválidos')))
            : FutureBuilder<Map<String, dynamic>>(
                future:
                    _getMotoristaProfile(motoristaId, localizacaoPassageiro),
                builder: (context, snapshot) {
                  // Estado 1: Carregando dados.
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                        height: 95,
                        child: Center(
                            child: CircularProgressIndicator(strokeWidth: 2)));
                  }
                  // Estado 2: Erro ou sem dados.
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return SizedBox(
                        height: 95,
                        child: Center(child: Text('Motorista não encontrado')));
                  }

                  // Estado 3: Dados carregados com sucesso.
                  final profile = snapshot.data!;
                  final fotoUrl = profile['photo_url'];
                  return InkWell(
                    onTap: onTap,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          // Avatar do motorista.
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey.shade300,
                            backgroundImage:
                                (fotoUrl != null && fotoUrl.isNotEmpty)
                                    ? NetworkImage(fotoUrl)
                                    : null,
                            child: (fotoUrl == null || fotoUrl.isEmpty)
                                ? Icon(Icons.person,
                                    size: 30, color: Colors.white)
                                : null,
                          ),
                          SizedBox(width: 12),
                          // Coluna com informações textuais do motorista.
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(profile['displayName'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                SizedBox(height: 2),
                                Text(profile['modeloDoCarro'],
                                    style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: 14)),
                                SizedBox(height: 4),
                                Text(
                                    '${profile['distancia'].toStringAsFixed(1)} km de distância',
                                    style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 12)),
                              ],
                            ),
                          ),
                          SizedBox(width: 8),
                          // Coluna com preço e avaliação.
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                precoFormatado,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                              SizedBox(height: 6),
                              Row(
                                children: [
                                  Text(profile['nota'].toStringAsFixed(1),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                  SizedBox(width: 2),
                                  Icon(Icons.star,
                                      color: Colors.amber, size: 18),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

/// Widget principal que exibe uma lista de ofertas de motoristas em tempo
/// real.
///
/// Este widget é `Stateful` para gerenciar o ciclo de vida da escuta ao
/// stream de dados e outras variáveis de estado, como a localização do
/// passageiro.
class ListaDeOfertasAnimada extends StatefulWidget {
  const ListaDeOfertasAnimada({
    super.key,
    this.width,
    this.height,
    required this.idDaViagem,
    this.onMotoristaTapped,
  });

  /// Largura e altura opcionais para o container do widget.
  final double? width;
  final double? height;

  /// O ID da viagem atual para a qual as ofertas estão sendo buscadas.
  final int idDaViagem;

  /// Ação a ser executada quando um card de motorista é selecionado pelo usuário.
  final Future Function(String? motoristaId)? onMotoristaTapped;

  @override
  State<ListaDeOfertasAnimada> createState() => _ListaDeOfertasAnimadaState();
}

class _ListaDeOfertasAnimadaState extends State<ListaDeOfertasAnimada> {
  // Stream que escuta continuamente a tabela 'ofertas' no Supabase.
  late final Stream<List<Map<String, dynamic>>> _ofertasStream;
  // Armazena a localização de origem da viagem para ser usada nos cálculos de distância.
  LatLng? _localizacaoOrigemPassageiro;
  // Flag para controlar a exibição do indicador de carregamento inicial.
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Inicia a busca de dados essenciais assim que o widget é inserido na árvore.
    _inicializarDados();
  }

  /// Realiza a configuração inicial, buscando dados estáticos e configurando o stream.
  void _inicializarDados() async {
    // Busca a localização de origem da viagem uma única vez.
    try {
      final viagemData = await Supabase.instance.client
          .from('viagens')
          .select('origem')
          .eq('viagemid', widget.idDaViagem)
          .single();
      _localizacaoOrigemPassageiro = _parseLatLngString(viagemData['origem']);
    } catch (e) {
      print('Erro ao buscar origem da viagem: $e');
    }

    // Configura o stream para receber atualizações em tempo real da tabela de ofertas.
    // O `map` transforma o payload bruto em uma lista de mapas utilizável.
    _ofertasStream = Supabase.instance.client
        .from('ofertas')
        .stream(primaryKey: ['ofertaid'])
        .eq('viagemid', widget.idDaViagem)
        .map((payload) => List<Map<String, dynamic>>.from(payload));

    // Garante que o widget ainda está montado antes de atualizar o estado.
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: _isLoading
          // Exibe um loading inicial enquanto os dados de origem são carregados.
          ? Center(child: CircularProgressIndicator())
          // Após o carregamento inicial, o StreamBuilder gerencia a UI.
          : StreamBuilder<List<Map<String, dynamic>>>(
              stream: _ofertasStream,
              builder: (context, snapshot) {
                // Estado 1: Conectando ao stream.
                if (snapshot.connectionState == ConnectionState.waiting &&
                    !snapshot.hasData) {
                  return Center(child: Text('Conectando...'));
                }
                // Estado 2: Erro na conexão com o stream.
                if (snapshot.hasError) {
                  return Center(child: Text('Erro: ${snapshot.error}'));
                }
                final ofertas = snapshot.data ?? [];
                // Estado 3: Conectado, mas nenhuma oferta foi recebida ainda.
                if (ofertas.isEmpty) {
                  return Center(child: Text('Aguardando ofertas...'));
                }

                // Estado 4: Ofertas recebidas. Constrói a lista.
                // ListView.builder é usado para performance, construindo apenas os itens visíveis.
                return ListView.builder(
                  itemCount: ofertas.length,
                  itemBuilder: (context, index) {
                    final oferta = ofertas[index];
                    return CardOfertaMotorista(
                      key: ValueKey(oferta['ofertaid']),
                      oferta: oferta,
                      localizacaoPassageiro: _localizacaoOrigemPassageiro,
                      onTap: () async {
                        if (widget.onMotoristaTapped != null) {
                          await widget
                              .onMotoristaTapped!(oferta['motoristaid']);
                        }
                      },
                    );
                  },
                );
              },
            ),
    );
  }
}
