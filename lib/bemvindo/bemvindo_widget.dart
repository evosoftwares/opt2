import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bemvindo_model.dart';
export 'bemvindo_model.dart';

/// crie uma página de bem vindo para ser a página inicial do app
class BemvindoWidget extends StatefulWidget {
  const BemvindoWidget({super.key});

  static String routeName = 'bemvindo';
  static String routePath = 'bemvindo';

  @override
  State<BemvindoWidget> createState() => _BemvindoWidgetState();
}

class _BemvindoWidgetState extends State<BemvindoWidget> {
  late BemvindoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BemvindoModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFFBF9F5),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.black],
                  stops: [0.1, 0.4],
                  begin: AlignmentDirectional(0.03, -1.0),
                  end: AlignmentDirectional(-0.03, 1.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 10.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Text(
                        'Bem vindo, ${currentUserDisplayName}!',
                        textAlign: TextAlign.center,
                        style:
                            FlutterFlowTheme.of(context).displayMedium.override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .displayMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  fontSize: 36.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .displayMedium
                                      .fontStyle,
                                ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 50.0),
                    child: Text(
                      'Estamos felizes em tê-lo conosco. Prepare-se para uma experiência incrível!',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                            ),
                            color: Colors.white,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                            lineHeight: 1.5,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 25.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (currentUserDocument?.euSou == null) {
                                  context.pushNamed(EuSouWidget.routeName);
                                } else {
                                  if (currentUserDocument?.euSou ==
                                      EuSou.Passageiro) {
                                    context.pushNamed(
                                        InicioClienteWidget.routeName);
                                  } else if (currentUserDocument?.euSou ==
                                      EuSou.AdmApp) {
                                    context.pushNamed(
                                        InicioGestorWidget.routeName);
                                  } else {
                                    if (currentUserPhoto == '') {
                                      context.pushNamed(
                                          FotoPerfilWidget.routeName);
                                    } else if (valueOrDefault(currentUserDocument?.cnh, '') ==
                                            '') {
                                      context
                                          .pushNamed(FotoCNHWidget.routeName);
                                    } else if (valueOrDefault(currentUserDocument?.crlv, '') ==
                                            '') {
                                      context
                                          .pushNamed(FotoCRLVWidget.routeName);
                                    } else if (valueOrDefault(currentUserDocument?.minhaCategoria, '') ==
                                            '') {
                                      context
                                          .pushNamed(CategoriaWidget.routeName);
                                    } else if ((valueOrDefault(currentUserDocument?.marcaDoCarro, '') == '') ||
                                        (valueOrDefault(currentUserDocument?.modeloDoCarro, '') ==
                                                '') ||
                                        (valueOrDefault(currentUserDocument?.corCarro, '') ==
                                                '') ||
                                        (valueOrDefault(currentUserDocument?.anoDoCarro, 0) ==
                                            null) ||
                                        (valueOrDefault(currentUserDocument?.placaVeiculo, '') ==
                                                '')) {
                                      context
                                          .pushNamed(MeuCarroWidget.routeName);
                                    } else if (valueOrDefault(currentUserDocument?.fotoCarro, '') ==
                                            '') {
                                      context
                                          .pushNamed(FotoCarroWidget.routeName);
                                    } else                                    context
                                        .pushNamed(PrincipalWidget.routeName);
                                  
                                  }
                                }
                              },
                              text: 'Entrar',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 56.0,
                                padding: EdgeInsets.all(8.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x33FFFFFF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                GoRouter.of(context).prepareAuthEvent();
                                await authManager.signOut();
                                GoRouter.of(context).clearRedirectLocation();

                                context.goNamedAuth(
                                    LoginWidget.routeName, context.mounted);
                              },
                              text: 'Sair',
                              options: FFButtonOptions(
                                width: 150.0,
                                height: 56.0,
                                padding: EdgeInsets.all(8.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x00FFFFFF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                      decoration: TextDecoration.underline,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 30.0),
                    child: Text(
                      'Ao continuar, você concorda com nossos Termos de Serviço e Política de Privacidade',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                            ),
                            color: Colors.white,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontStyle,
                            lineHeight: 1.5,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
