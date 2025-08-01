import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'escolha_motorista_model.dart';
export 'escolha_motorista_model.dart';

class EscolhaMotoristaWidget extends StatefulWidget {
  const EscolhaMotoristaWidget({
    super.key,
    required this.qualCorrida,
  });

  final ViagensRow? qualCorrida;

  static String routeName = 'escolhaMotorista';
  static String routePath = 'escolhaMotorista';

  @override
  State<EscolhaMotoristaWidget> createState() => _EscolhaMotoristaWidgetState();
}

class _EscolhaMotoristaWidgetState extends State<EscolhaMotoristaWidget> {
  late EscolhaMotoristaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EscolhaMotoristaModel());

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

    return StreamBuilder<List<OfertasRow>>(
      stream: _model.escolhaMotoristaSupabaseStream ??= SupaFlow.client
          .from("ofertas")
          .stream(primaryKey: ['ofertaid'])
          .eqOrNull(
            'viagemid',
            widget.qualCorrida?.viagemid,
          )
          .map((list) => list.map((item) => OfertasRow(item)).toList()),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFEBEFF2),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).secondary,
                  ),
                ),
              ),
            ),
          );
        }
        List<OfertasRow> escolhaMotoristaOfertasRowList = snapshot.data!;

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
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Esperando por motorista',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.poppins(
                                fontWeight: FontWeight.normal,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                      Container(
                        width: double.infinity,
                        height: functions.calcularAlturaLista(
                            escolhaMotoristaOfertasRowList.length),
                        child: custom_widgets.ListaDeOfertasAnimada(
                          width: double.infinity,
                          height: functions.calcularAlturaLista(
                              escolhaMotoristaOfertasRowList.length),
                          idDaViagem: widget.qualCorrida!.viagemid,
                          onMotoristaTapped: (motoristaId) async {
                            final firestoreBatch =
                                FirebaseFirestore.instance.batch();
                            try {
                              _model.queryOfertas =
                                  await OfertasTable().queryRows(
                                queryFn: (q) => q
                                    .eqOrNull(
                                      'viagemid',
                                      widget.qualCorrida?.viagemid,
                                    )
                                    .eqOrNull(
                                      'motoristaid',
                                      motoristaId,
                                    ),
                              );
                              if (valueOrDefault(
                                      currentUserDocument?.emCarteira, 0.0) >=
                                  _model.queryOfertas!.firstOrNull!
                                      .precoofertado!) {
                                await actions
                                    .selecionarMotoristaEFinalizarOfertas(
                                  widget.qualCorrida!.viagemid,
                                  motoristaId!,
                                  FFAppState().keyMaps,
                                );

                                var conversasRecordReference =
                                    ConversasRecord.collection.doc();
                                firestoreBatch.set(conversasRecordReference, {
                                  ...createConversasRecordData(
                                    statusConversa:
                                        StatusConversaPeloStatusServico
                                            .andamento,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'participantes': [currentUserReference],
                                      'quemLeu': [currentUserReference],
                                    },
                                  ),
                                });
                                _model.atualizaPessoa =
                                    ConversasRecord.getDocumentFromData({
                                  ...createConversasRecordData(
                                    statusConversa:
                                        StatusConversaPeloStatusServico
                                            .andamento,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'participantes': [currentUserReference],
                                      'quemLeu': [currentUserReference],
                                    },
                                  ),
                                }, conversasRecordReference);

                                var mensagensRecordReference =
                                    MensagensRecord.collection.doc();
                                firestoreBatch.set(
                                    mensagensRecordReference,
                                    createMensagensRecordData(
                                      createdAt: getCurrentTimestamp,
                                      mensagem:
                                          'Olá, estou solicitando a corrida.',
                                      conversaID:
                                          _model.atualizaPessoa?.reference,
                                      enviadoPor: currentUserReference,
                                      ehMensagem: true,
                                    ));
                                _model.mensagemEnviada =
                                    MensagensRecord.getDocumentFromData(
                                        createMensagensRecordData(
                                          createdAt: getCurrentTimestamp,
                                          mensagem:
                                              'Olá, estou solicitando a corrida.',
                                          conversaID:
                                              _model.atualizaPessoa?.reference,
                                          enviadoPor: currentUserReference,
                                          ehMensagem: true,
                                        ),
                                        mensagensRecordReference);
                                await ViagensTable().update(
                                  data: {
                                    'idConversa':
                                        _model.atualizaPessoa?.reference.id,
                                  },
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'viagemid',
                                    widget.qualCorrida?.viagemid,
                                  ),
                                );

                                firestoreBatch.update(
                                    _model.mensagemEnviada!.reference,
                                    createMensagensRecordData(
                                      mensagensId:
                                          _model.mensagemEnviada?.reference.id,
                                    ));

                                firestoreBatch
                                    .update(_model.atualizaPessoa!.reference, {
                                  ...createConversasRecordData(
                                    ultimaMensagem:
                                        _model.mensagemEnviada?.reference,
                                    conversaId:
                                        _model.atualizaPessoa?.reference.id,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'participantes': FieldValue.arrayUnion([
                                        functions.convertStringEmReference(
                                            motoristaId)
                                      ]),
                                    },
                                  ),
                                });

                                context.pushNamed(
                                  DetalhesCorridaClienteWidget.routeName,
                                  queryParameters: {
                                    'qualCorrida': serializeParam(
                                      widget.qualCorrida,
                                      ParamType.SupabaseRow,
                                    ),
                                    'motoristaId': serializeParam(
                                      motoristaId,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Atenção'),
                                              content: Text(
                                                  'Você não possui créditos suficientes para escolher esta oferta. Gostaria de adicionar agora?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('Não'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('Sim'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  context.pushNamed(
                                    AdicionarCreditosWidget.routeName,
                                    queryParameters: {
                                      'valorEsperado': serializeParam(
                                        _model.queryOfertas?.firstOrNull
                                            ?.precoofertado,
                                        ParamType.double,
                                      ),
                                    }.withoutNulls,
                                  );
                                }
                              }
                            } finally {
                              await firestoreBatch.commit();
                            }

                            safeSetState(() {});
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            _model.listaMotoristas = await queryUsersRecordOnce(
                              queryBuilder: (usersRecord) => usersRecord.where(
                                'idViagem',
                                isEqualTo: widget.qualCorrida?.viagemid,
                              ),
                            );
                            await ViagensTable().update(
                              data: {
                                'status': Status.Cancelado.name,
                              },
                              matchingRows: (rows) => rows.eqOrNull(
                                'viagemid',
                                widget.qualCorrida?.viagemid,
                              ),
                            );
                            _model.indice = 0;
                            _model.nMotoristas = _model.listaMotoristas?.length;
                            safeSetState(() {});
                            while (_model.indice < _model.nMotoristas!) {
                              await _model.listaMotoristas!
                                  .elementAtOrNull(_model.indice)!
                                  .reference
                                  .update({
                                ...createUsersRecordData(
                                  aceitou: false,
                                ),
                                ...mapToFirestore(
                                  {
                                    'idViagem': FieldValue.delete(),
                                  },
                                ),
                              });
                              _model.indice = _model.indice + 1;
                              safeSetState(() {});
                            }

                            context.pushNamed(ChamarCarro1Widget.routeName);

                            safeSetState(() {});
                          },
                          text: 'Cancelar',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 56.0,
                            padding: EdgeInsets.all(8.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).error,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
