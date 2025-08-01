import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/carregamento_componente_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'adicionar_creditos_model.dart';
export 'adicionar_creditos_model.dart';

class AdicionarCreditosWidget extends StatefulWidget {
  const AdicionarCreditosWidget({
    super.key,
    double? valorEsperado,
  }) : this.valorEsperado = valorEsperado ?? 0.0;

  final double valorEsperado;

  static String routeName = 'adicionarCreditos';
  static String routePath = 'adicionarCreditos';

  @override
  State<AdicionarCreditosWidget> createState() =>
      _AdicionarCreditosWidgetState();
}

class _AdicionarCreditosWidgetState extends State<AdicionarCreditosWidget> {
  late AdicionarCreditosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdicionarCreditosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.ipXustom = await actions.pegarIp();
      _model.ip = _model.ipXustom;
      safeSetState(() {});
      if (widget.valorEsperado > 0.0) {
        FFAppState().currencyValue = widget.valorEsperado;
        safeSetState(() {});
      }
    });
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
            'Adicionar créditos ',
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
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Crédito (R\$)',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
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
                                initValue: widget.valorEsperado,
                                hintText: 'Digite o valor desejado',
                              ),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Escolha seu método de pagamento',
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primary,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                        height: 334.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (FFAppState().currencyValue >= 20.0) {
                                    if (currentUserEmail != '') {
                                      _model.cpf = functions
                                          .limparStringNumerico(valueOrDefault(
                                              currentUserDocument?.cpf, ''));
                                      _model.email = currentUserEmail;
                                      _model.numero =
                                          functions.limparStringNumerico(
                                              currentPhoneNumber);
                                      _model.cep = functions
                                          .limparStringNumerico(valueOrDefault(
                                              currentUserDocument?.cep, ''));
                                      _model.nome = currentUserDisplayName;
                                      safeSetState(() {});
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child:
                                                  CarregamentoComponenteWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));

                                      if ((_model.ip != '0') &&
                                          (_model.ip != null &&
                                              _model.ip != '')) {
                                        _model.cliente =
                                            await CriarClienteAsaasCall.call(
                                          name: currentUserDisplayName,
                                          cpfCnpj:
                                              functions.limparStringNumerico(
                                                  valueOrDefault(
                                                      currentUserDocument?.cpf,
                                                      '')),
                                          email: currentUserEmail,
                                          phone: functions.limparStringNumerico(
                                              currentPhoneNumber),
                                        );

                                        if (getJsonField(
                                              (_model.cliente?.jsonBody ?? ''),
                                              r'''$.id''',
                                            ) !=
                                            null) {
                                          _model.cobranca =
                                              await CriarCobrancaAsaasCall.call(
                                            customer:
                                                CriarClienteAsaasCall.idCerto(
                                              (_model.cliente?.jsonBody ?? ''),
                                            ).toString(),
                                            billingType: 'PIX',
                                            value: FFAppState().currencyValue,
                                            description:
                                                'Adicionar créditos OPT Mobilidade',
                                            dueDate: dateTimeFormat(
                                              "yyyy-MM-dd",
                                              getCurrentTimestamp,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            remoteIp: _model.ip,
                                          );

                                          if (getJsonField(
                                                (_model.cobranca?.jsonBody ??
                                                    ''),
                                                r'''$.id''',
                                              ) !=
                                              null) {
                                            _model.pix =
                                                await ObterQRCodeCall.call(
                                              id: CriarCobrancaAsaasCall
                                                  .idPagamento(
                                                (_model.cobranca?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                            );

                                            if (getJsonField(
                                                  (_model.pix?.jsonBody ?? ''),
                                                  r'''$.encodedImage''',
                                                ) !=
                                                null) {
                                              var transacoesAsaasRecordReference =
                                                  TransacoesAsaasRecord
                                                      .collection
                                                      .doc();
                                              await transacoesAsaasRecordReference
                                                  .set(
                                                      createTransacoesAsaasRecordData(
                                                asaasPaymentId: getJsonField(
                                                  (_model.cobranca?.jsonBody ??
                                                      ''),
                                                  r'''$.id''',
                                                ).toString(),
                                                userRef: currentUserReference,
                                                valor: functions
                                                    .garantirValorDouble((_model
                                                            .cobranca
                                                            ?.jsonBody ??
                                                        '')),
                                                status: getJsonField(
                                                  (_model.cobranca?.jsonBody ??
                                                      ''),
                                                  r'''$.status''',
                                                ).toString(),
                                                dataCriacao:
                                                    getCurrentTimestamp,
                                              ));
                                              _model.criaTransacaoAsaas =
                                                  TransacoesAsaasRecord
                                                      .getDocumentFromData(
                                                          createTransacoesAsaasRecordData(
                                                            asaasPaymentId:
                                                                getJsonField(
                                                              (_model.cobranca
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.id''',
                                                            ).toString(),
                                                            userRef:
                                                                currentUserReference,
                                                            valor: functions
                                                                .garantirValorDouble((_model
                                                                        .cobranca
                                                                        ?.jsonBody ??
                                                                    '')),
                                                            status:
                                                                getJsonField(
                                                              (_model.cobranca
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.status''',
                                                            ).toString(),
                                                            dataCriacao:
                                                                getCurrentTimestamp,
                                                          ),
                                                          transacoesAsaasRecordReference);
                                              Navigator.pop(context);

                                              context.pushNamed(
                                                PixWidget.routeName,
                                                queryParameters: {
                                                  'valor': serializeParam(
                                                    FFAppState().currencyValue,
                                                    ParamType.double,
                                                  ),
                                                  'codigoQR': serializeParam(
                                                    (_model.pix?.jsonBody ??
                                                        ''),
                                                    ParamType.JSON,
                                                  ),
                                                  'id': serializeParam(
                                                    CriarCobrancaAsaasCall
                                                        .idPagamento(
                                                      (_model.cobranca
                                                              ?.jsonBody ??
                                                          ''),
                                                    ).toString(),
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              Navigator.pop(context);
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Atenção'),
                                                    content: Text(
                                                        'Falha ao gerar QR Code. Por favor, verifique sua conexão e tente novamente.'),
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
                                          } else {
                                            Navigator.pop(context);
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Atenção'),
                                                  content: Text(
                                                      'Falha ao gerar cobrança. Por favor, verifique sua conexão e tente novamente.'),
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
                                        } else {
                                          Navigator.pop(context);
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Atenção'),
                                                content: Text(
                                                    'Falha ao gerar cliente. Por favor, verifique sua conexão e tente novamente.'),
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
                                      } else {
                                        Navigator.pop(context);
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Atenção'),
                                              content: Text(
                                                  'Falha ao gerar IP. Por favor, verifique sua conexão e tente novamente.'),
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
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title:
                                                Text('E-mail não cadastrado'),
                                            content: Text(
                                                'Por favor atualize seus dados e adcione um e-mail para efetura o pagamento.'),
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

                                      context.pushNamed(PerfilWidget.routeName);
                                    }
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Atenção'),
                                          content: Text(
                                              'O valor deverá ser maior do que R\$ 19,99'),
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
                                  }

                                  safeSetState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/logo-pix-icone-1024.png',
                                        width: 30.0,
                                        height: 30.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      'Pagar com PIX',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF424242),
                                            fontSize: 20.0,
                                            letterSpacing: 1.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        child: Icon(
                                          Icons.arrow_right_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 18.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (FFAppState().currencyValue > 0.0) {
                                      context.pushNamed(
                                        CartaoCreditoWidget.routeName,
                                        queryParameters: {
                                          'valor': serializeParam(
                                            FFAppState().currencyValue,
                                            ParamType.double,
                                          ),
                                          'ipEndereco': serializeParam(
                                            _model.ip,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    3.0, 0.0, 2.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.creditCard,
                                              color: Color(0xFF3A4545),
                                              size: 22.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Pagar com Cartão',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF424242),
                                              fontSize: 20.0,
                                              letterSpacing: 1.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Icon(
                                            Icons.arrow_right_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                              ),
                            ]
                                .divide(SizedBox(height: 25.0))
                                .addToStart(SizedBox(height: 22.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 16.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
