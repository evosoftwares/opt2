import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'solicitar_saque_model.dart';
export 'solicitar_saque_model.dart';

class SolicitarSaqueWidget extends StatefulWidget {
  const SolicitarSaqueWidget({super.key});

  static String routeName = 'solicitarSaque';
  static String routePath = 'solicitarSaque';

  @override
  State<SolicitarSaqueWidget> createState() => _SolicitarSaqueWidgetState();
}

class _SolicitarSaqueWidgetState extends State<SolicitarSaqueWidget> {
  late SolicitarSaqueModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SolicitarSaqueModel());
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
        backgroundColor: Color(0xFFF1F4F8),
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
            'Saque',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
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
            padding: EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    color: Colors.transparent,
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.0,
                            color: Color(0x20000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Saldo Disponível',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: formatNumber(
                                          valueOrDefault(
                                              currentUserDocument?.emCarteira,
                                              0.0),
                                          formatType: FormatType.decimal,
                                          decimalType: DecimalType.commaDecimal,
                                          currency: 'R\$ ',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmall
                                                      .fontStyle,
                                            ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ].divide(SizedBox(height: 12.0)),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.0,
                            color: Color(0x20000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Seus dados:',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                            ),
                            if (valueOrDefault(
                                        currentUserDocument?.chavePix, '') ==
                                    '')
                              AuthUserStreamWidget(
                                builder: (context) => FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed(
                                        ContabancariaWidget.routeName);
                                  },
                                  text: 'Cadastrar Chave Pix',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 40.0,
                                    padding: EdgeInsets.all(8.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFF292A2A),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .fontStyle,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                            Text(
                              'Informações do seu PIX',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            if (valueOrDefault(
                                        currentUserDocument?.chavePix, '') !=
                                    '')
                              AuthUserStreamWidget(
                                builder: (context) => Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Text(
                                        valueOrDefault(
                                            currentUserDocument?.chavePix, ''),
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .subText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Text(
                                        valueOrDefault(
                                            currentUserDocument?.tipoChave, ''),
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .subText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 15.0)),
                                ),
                              ),
                            Text(
                              'Valor do Saque',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                            ),
                            Container(
                              width: 400.0,
                              height: 100.0,
                              child: custom_widgets.CurrencyTextField(
                                width: 400.0,
                                height: 100.0,
                                currencySymbol: 'R\$',
                                initValue: 0.0,
                                hintText: 'Digite o valor desejado',
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                final firestoreBatch =
                                    FirebaseFirestore.instance.batch();
                                try {
                                  if (valueOrDefault(
                                              currentUserDocument?.chavePix,
                                              '') !=
                                          '') {
                                    if (valueOrDefault(
                                            currentUserDocument?.emCarteira,
                                            0.0) >
                                        0.0) {
                                      if (valueOrDefault(
                                              currentUserDocument?.emCarteira,
                                              0.0) >=
                                          FFAppState().currencyValue) {
                                        var saquesRecordReference =
                                            SaquesRecord.collection.doc();
                                        firestoreBatch.set(
                                            saquesRecordReference,
                                            createSaquesRecordData(
                                              userID: currentUserReference?.id,
                                              valor: FFAppState().currencyValue,
                                              status: 'SOLICITADO',
                                              dataCriacao: getCurrentTimestamp,
                                              dadosBancarios:
                                                  updateDadosTransfStruct(
                                                DadosTransfStruct(
                                                  chavePix: valueOrDefault(
                                                      currentUserDocument
                                                          ?.chavePix,
                                                      ''),
                                                  tipoChave: valueOrDefault(
                                                      currentUserDocument
                                                          ?.tipoChave,
                                                      ''),
                                                ),
                                                clearUnsetFields: false,
                                                create: true,
                                              ),
                                            ));
                                        _model.saqueCriado =
                                            SaquesRecord.getDocumentFromData(
                                                createSaquesRecordData(
                                                  userID:
                                                      currentUserReference?.id,
                                                  valor: FFAppState()
                                                      .currencyValue,
                                                  status: 'SOLICITADO',
                                                  dataCriacao:
                                                      getCurrentTimestamp,
                                                  dadosBancarios:
                                                      updateDadosTransfStruct(
                                                    DadosTransfStruct(
                                                      chavePix: valueOrDefault(
                                                          currentUserDocument
                                                              ?.chavePix,
                                                          ''),
                                                      tipoChave: valueOrDefault(
                                                          currentUserDocument
                                                              ?.tipoChave,
                                                          ''),
                                                    ),
                                                    clearUnsetFields: false,
                                                    create: true,
                                                  ),
                                                ),
                                                saquesRecordReference);
                                        _model.resultadoApiSaque =
                                            await IniciarSaqueAsaasCall.call(
                                          idInterno:
                                              _model.saqueCriado?.reference.id,
                                          valor: FFAppState().currencyValue,
                                          dadosBancariosJson: _model
                                              .saqueCriado?.dadosBancarios
                                              .toMap(),
                                        );

                                        if ((_model.resultadoApiSaque
                                                    ?.succeeded ??
                                                true) ==
                                            true) {
                                          firestoreBatch
                                              .update(currentUserReference!, {
                                            ...mapToFirestore(
                                              {
                                                'emCarteira':
                                                    FieldValue.increment(
                                                        -(FFAppState()
                                                            .currencyValue)),
                                              },
                                            ),
                                          });

                                          firestoreBatch.set(
                                              MovimentoCreditosRecord.collection
                                                  .doc(),
                                              createMovimentoCreditosRecordData(
                                                tipo: TipoMovimento.saida,
                                                dataMovimento:
                                                    getCurrentTimestamp,
                                                valor:
                                                    FFAppState().currencyValue,
                                                user: currentUserReference,
                                                fonte: currentUserReference,
                                              ));
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Atenção'),
                                                content: Text(
                                                    'Saque solicitado com sucesso'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );

                                          context.pushNamed(
                                              CarteiraWidget.routeName);
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text(
                                                    'Tranferência não realizada.'),
                                                content: Text(
                                                    'Por favor verifique seu dados e tente novamente.'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      }
                                    }
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Pix não cadastrado'),
                                          content: Text(
                                              'Por favor cadastre sua informações pix.'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );

                                    context.pushNamed(
                                        ContabancariaWidget.routeName);
                                  }
                                } finally {
                                  await firestoreBatch.commit();
                                }

                                safeSetState(() {});
                              },
                              text: 'Sacar',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 40.0,
                                padding: EdgeInsets.all(8.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF292A2A),
                                textStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text(
                                                  'Deseja alterar seus dados?'),
                                              content: Text(
                                                  'Ao confirmar você saíra dessa tela.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('Não desejo.'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('Desejo.'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  context
                                      .pushNamed(ContabancariaWidget.routeName);
                                }
                              },
                              text: 'Alterar dados',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 40.0,
                                padding: EdgeInsets.all(8.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ]
                              .divide(SizedBox(height: 10.0))
                              .addToEnd(SizedBox(height: 5.0)),
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 15.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
