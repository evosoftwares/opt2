import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'escolha_motorista_descontinuado_model.dart';
export 'escolha_motorista_descontinuado_model.dart';

class EscolhaMotoristaDescontinuadoWidget extends StatefulWidget {
  const EscolhaMotoristaDescontinuadoWidget({
    super.key,
    required this.qualCorrida,
  });

  final ViagensRow? qualCorrida;

  static String routeName = 'escolhaMotoristaDescontinuado';
  static String routePath = 'escolhaMotoristaDescontinuado';

  @override
  State<EscolhaMotoristaDescontinuadoWidget> createState() =>
      _EscolhaMotoristaDescontinuadoWidgetState();
}

class _EscolhaMotoristaDescontinuadoWidgetState
    extends State<EscolhaMotoristaDescontinuadoWidget> {
  late EscolhaMotoristaDescontinuadoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EscolhaMotoristaDescontinuadoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFEBEFF2),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 52.0,
            icon: Icon(
              FFIcons.kback,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 22.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Esperando motorista',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 16.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w500,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Esperando por motorista !',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
                Builder(
                  builder: (context) {
                    final todasLocalizacaoes =
                        FFAppState().motoristasAguardando.toList();
                    if (todasLocalizacaoes.isEmpty) {
                      return Center(
                        child: Image.asset(
                          'assets/images/Por_enquanto_nao_tem_nada_aqui.png',
                          width: 222.0,
                          fit: BoxFit.contain,
                        ),
                      );
                    }

                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: todasLocalizacaoes.length,
                      separatorBuilder: (_, __) => SizedBox(height: 15.0),
                      itemBuilder: (context, todasLocalizacaoesIndex) {
                        final todasLocalizacaoesItem =
                            todasLocalizacaoes[todasLocalizacaoesIndex];
                        return Material(
                          color: Colors.transparent,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  child: StreamBuilder<List<UsersRecord>>(
                                    stream: queryUsersRecord(
                                      queryBuilder: (usersRecord) =>
                                          usersRecord.where(
                                        'uid',
                                        isEqualTo: todasLocalizacaoesItem.id,
                                      ),
                                      singleRecord: true,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<UsersRecord>
                                          containerUsersRecordList =
                                          snapshot.data!;
                                      // Return an empty Container when the item does not exist.
                                      if (snapshot.data!.isEmpty) {
                                        return Container();
                                      }
                                      final containerUsersRecord =
                                          containerUsersRecordList.isNotEmpty
                                              ? containerUsersRecordList.first
                                              : null;

                                      return Container(
                                        decoration: BoxDecoration(),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Chamar motorista'),
                                                          content: Text(
                                                              'Tem certeza que deseja chamar esse motorista?'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Não chamar'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text(
                                                                  'Confirmar'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              _model.queryOferta =
                                                  await OfertasTable()
                                                      .queryRows(
                                                queryFn: (q) => q
                                                    .eqOrNull(
                                                      'viagemid',
                                                      widget.qualCorrida
                                                          ?.viagemid,
                                                    )
                                                    .eqOrNull(
                                                      'motoristaid',
                                                      containerUsersRecord?.uid,
                                                    ),
                                              );
                                              if (valueOrDefault(
                                                      currentUserDocument
                                                          ?.emCarteira,
                                                      0.0) >=
                                                  valueOrDefault<double>(
                                                    _model
                                                        .queryOferta
                                                        ?.firstOrNull
                                                        ?.precoofertado,
                                                    0.0,
                                                  )) {
                                                await actions
                                                    .selecionarMotoristaEFinalizarOfertas(
                                                  widget.qualCorrida!.viagemid,
                                                  containerUsersRecord!.uid,
                                                  FFAppState().keyMaps,
                                                );

                                                var conversasRecordReference =
                                                    ConversasRecord.collection
                                                        .doc();
                                                await conversasRecordReference
                                                    .set({
                                                  ...createConversasRecordData(
                                                    statusConversa:
                                                        StatusConversaPeloStatusServico
                                                            .andamento,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'participantes': [
                                                        currentUserReference
                                                      ],
                                                      'quemLeu': [
                                                        currentUserReference
                                                      ],
                                                    },
                                                  ),
                                                });
                                                _model.atualizaPessoa =
                                                    ConversasRecord
                                                        .getDocumentFromData({
                                                  ...createConversasRecordData(
                                                    statusConversa:
                                                        StatusConversaPeloStatusServico
                                                            .andamento,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'participantes': [
                                                        currentUserReference
                                                      ],
                                                      'quemLeu': [
                                                        currentUserReference
                                                      ],
                                                    },
                                                  ),
                                                }, conversasRecordReference);

                                                var mensagensRecordReference =
                                                    MensagensRecord.collection
                                                        .doc();
                                                await mensagensRecordReference
                                                    .set(
                                                        createMensagensRecordData(
                                                  createdAt:
                                                      getCurrentTimestamp,
                                                  mensagem:
                                                      'Olá, estou solicitando a corrida.',
                                                  conversaID: _model
                                                      .atualizaPessoa
                                                      ?.reference,
                                                  enviadoPor:
                                                      currentUserReference,
                                                  ehMensagem: true,
                                                ));
                                                _model.mensagemEnviada =
                                                    MensagensRecord.getDocumentFromData(
                                                        createMensagensRecordData(
                                                          createdAt:
                                                              getCurrentTimestamp,
                                                          mensagem:
                                                              'Olá, estou solicitando a corrida.',
                                                          conversaID: _model
                                                              .atualizaPessoa
                                                              ?.reference,
                                                          enviadoPor:
                                                              currentUserReference,
                                                          ehMensagem: true,
                                                        ),
                                                        mensagensRecordReference);
                                                await ViagensTable().update(
                                                  data: {
                                                    'idConversa': _model
                                                        .atualizaPessoa
                                                        ?.reference
                                                        .id,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eqOrNull(
                                                    'viagemid',
                                                    widget
                                                        .qualCorrida?.viagemid,
                                                  ),
                                                );

                                                await _model
                                                    .mensagemEnviada!.reference
                                                    .update(
                                                        createMensagensRecordData(
                                                  mensagensId: _model
                                                      .mensagemEnviada
                                                      ?.reference
                                                      .id,
                                                ));

                                                await _model
                                                    .atualizaPessoa!.reference
                                                    .update({
                                                  ...createConversasRecordData(
                                                    ultimaMensagem: _model
                                                        .atualizaPessoa
                                                        ?.ultimaMensagem,
                                                    conversaId: _model
                                                        .atualizaPessoa
                                                        ?.reference
                                                        .id,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'participantes':
                                                          FieldValue
                                                              .arrayUnion([
                                                        functions
                                                            .convertStringEmReference(
                                                                containerUsersRecord
                                                                    .reference
                                                                    .id)
                                                      ]),
                                                    },
                                                  ),
                                                });

                                                context.pushNamed(
                                                  DetalhesCorridaClienteWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'qualCorrida':
                                                        serializeParam(
                                                      widget.qualCorrida,
                                                      ParamType.SupabaseRow,
                                                    ),
                                                    'motoristaId':
                                                        serializeParam(
                                                      containerUsersRecord
                                                          .reference.id,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Atenção'),
                                                              content: Text(
                                                                  'Você não possui créditos suficientes para escolher esta oferta. Gostaria de adicionar agora?'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'Não'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Sim'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  context.pushNamed(
                                                    AdicionarCreditosWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'valorEsperado':
                                                          serializeParam(
                                                        _model
                                                            .queryOferta
                                                            ?.firstOrNull
                                                            ?.precoofertado,
                                                        ParamType.double,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                }
                                              }
                                            }

                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(6.0, 6.0, 5.0, 7.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        containerUsersRecord
                                                            ?.photoUrl,
                                                        'https://tse3.mm.bing.net/th?id=OIP.ddYkYqqWMKSwEsjE_MC3pwHaHa&pid=Api&P=0&h=180',
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            containerUsersRecord
                                                                ?.displayName,
                                                            'nome',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .outfit(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        containerUsersRecord
                                                                            ?.marcaDoCarro,
                                                                        'Marca',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.outfit(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF57636C),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        containerUsersRecord
                                                                            ?.modeloDoCarro,
                                                                        'Modelo',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.outfit(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF57636C),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            AuthUserStreamWidget(
                                                              builder:
                                                                  (context) =>
                                                                      Text(
                                                                formatNumber(
                                                                  (valueOrDefault(currentUserDocument?.minhaTarifa, 0.0) *
                                                                              functions.distanciaOrigemDestino(functions.strToLatLng(widget.qualCorrida?.origem)!, functions.strToLatLng(widget.qualCorrida?.destino)!) *
                                                                              100)
                                                                          .ceilToDouble() /
                                                                      100,
                                                                  formatType:
                                                                      FormatType
                                                                          .decimal,
                                                                  decimalType:
                                                                      DecimalType
                                                                          .commaDecimal,
                                                                  currency:
                                                                      'R\$',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .outfit(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            FutureBuilder<
                                                                List<
                                                                    AvaliacoesRow>>(
                                                              future:
                                                                  AvaliacoesTable()
                                                                      .queryRows(
                                                                queryFn: (q) =>
                                                                    q.eqOrNull(
                                                                  'motorista',
                                                                  containerUsersRecord
                                                                      ?.reference
                                                                      .id,
                                                                ),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<AvaliacoesRow>
                                                                    containerAvaliacoesRowList =
                                                                    snapshot
                                                                        .data!;

                                                                return Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        formatNumber(
                                                                          functions.mediaDasAvaliacoes(containerAvaliacoesRowList
                                                                              .map((e) => e.nota)
                                                                              .toList()),
                                                                          formatType:
                                                                              FormatType.decimal,
                                                                          decimalType:
                                                                              DecimalType.commaDecimal,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .override(
                                                                              font: GoogleFonts.outfit(
                                                                                fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF57636C),
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                            ),
                                                                      ),
                                                                      Icon(
                                                                        Icons
                                                                            .star,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent2,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.chevron_right_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                ].divide(SizedBox(width: 5.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ].divide(SizedBox(height: 10.0)),
            ),
          ),
        ),
      ),
    );
  }
}
