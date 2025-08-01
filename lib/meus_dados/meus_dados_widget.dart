import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'meus_dados_model.dart';
export 'meus_dados_model.dart';

class MeusDadosWidget extends StatefulWidget {
  const MeusDadosWidget({super.key});

  static String routeName = 'meusDados';
  static String routePath = 'meusDados';

  @override
  State<MeusDadosWidget> createState() => _MeusDadosWidgetState();
}

class _MeusDadosWidgetState extends State<MeusDadosWidget> {
  late MeusDadosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeusDadosModel());

    _model.nomeCompletoTextController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.nomeCompletoFocusNode ??= FocusNode();

    _model.inputtelefoneTextController ??=
        TextEditingController(text: currentPhoneNumber);
    _model.inputtelefoneFocusNode ??= FocusNode();

    _model.inputtelefoneMask = MaskTextInputFormatter(mask: '(##) # ####-####');
    _model.inputcpfTextController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.cpf, ''));
    _model.inputcpfFocusNode ??= FocusNode();

    _model.inputcpfMask = MaskTextInputFormatter(mask: '###.###.###-##');
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Meus dados',
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
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: AuthUserStreamWidget(
                  builder: (context) => ClipRRect(
                    borderRadius: BorderRadius.circular(240.0),
                    child: Image.network(
                      valueOrDefault<String>(
                        currentUserPhoto,
                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/opt2-n5y3g4/assets/b0wmhvax11qe/user_(1).png',
                      ),
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    final selectedMedia =
                        await selectMediaWithSourceBottomSheet(
                      context: context,
                      allowPhoto: true,
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      safeSetState(
                          () => _model.isDataUploading_uploadDataL6t = true);
                      var selectedUploadedFiles = <FFUploadedFile>[];

                      var downloadUrls = <String>[];
                      try {
                        selectedUploadedFiles = selectedMedia
                            .map((m) => FFUploadedFile(
                                  name: m.storagePath.split('/').last,
                                  bytes: m.bytes,
                                  height: m.dimensions?.height,
                                  width: m.dimensions?.width,
                                  blurHash: m.blurHash,
                                ))
                            .toList();

                        downloadUrls = (await Future.wait(
                          selectedMedia.map(
                            (m) async =>
                                await uploadData(m.storagePath, m.bytes),
                          ),
                        ))
                            .where((u) => u != null)
                            .map((u) => u!)
                            .toList();
                      } finally {
                        _model.isDataUploading_uploadDataL6t = false;
                      }
                      if (selectedUploadedFiles.length ==
                              selectedMedia.length &&
                          downloadUrls.length == selectedMedia.length) {
                        safeSetState(() {
                          _model.uploadedLocalFile_uploadDataL6t =
                              selectedUploadedFiles.first;
                          _model.uploadedFileUrl_uploadDataL6t =
                              downloadUrls.first;
                        });
                      } else {
                        safeSetState(() {});
                        return;
                      }
                    }

                    await currentUserReference!.update(createUsersRecordData(
                      photoUrl: _model.uploadedFileUrl_uploadDataL6t,
                    ));
                  },
                  text: 'Trocar foto',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    height: 44.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: Colors.white,
                          fontSize: 14.0,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              Divider(
                thickness: 2.0,
                color: Color(0xFFBEBEBE),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                child: AuthUserStreamWidget(
                  builder: (context) => Container(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _model.nomeCompletoTextController,
                      focusNode: _model.nomeCompletoFocusNode,
                      autofocus: false,
                      autofillHints: [AutofillHints.email],
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Nome completo',
                        labelStyle: FlutterFlowTheme.of(context)
                            .labelLarge
                            .override(
                              font: GoogleFonts.poppins(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 1.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .fontStyle,
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x0D000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        filled: true,
                        fillColor: Color(0xFFEAEAEA),
                        contentPadding: EdgeInsets.all(24.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            font: GoogleFonts.poppins(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                      cursorColor: FlutterFlowTheme.of(context).primary,
                      validator: _model.nomeCompletoTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: AuthUserStreamWidget(
                  builder: (context) => Container(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _model.inputtelefoneTextController,
                      focusNode: _model.inputtelefoneFocusNode,
                      autofocus: false,
                      autofillHints: [AutofillHints.telephoneNumberNational],
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Telefone',
                        labelStyle:
                            FlutterFlowTheme.of(context).labelLarge.override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                                  letterSpacing: 1.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontStyle,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x0E000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE0E3E7),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE0E3E7),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        filled: true,
                        fillColor: Color(0xFFEAEAEA),
                        contentPadding: EdgeInsets.all(28.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Color(0xFF101213),
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                      keyboardType: TextInputType.number,
                      validator: _model.inputtelefoneTextControllerValidator
                          .asValidator(context),
                      inputFormatters: [_model.inputtelefoneMask],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: AuthUserStreamWidget(
                  builder: (context) => Container(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _model.inputcpfTextController,
                      focusNode: _model.inputcpfFocusNode,
                      autofocus: false,
                      autofillHints: [AutofillHints.name],
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'CPF',
                        labelStyle:
                            FlutterFlowTheme.of(context).labelLarge.override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                                  letterSpacing: 1.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontStyle,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x0D000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE0E3E7),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE0E3E7),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        filled: true,
                        fillColor: Color(0xFFEAEAEA),
                        contentPadding: EdgeInsets.all(28.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Color(0xFF101213),
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                      keyboardType: TextInputType.number,
                      validator: _model.inputcpfTextControllerValidator
                          .asValidator(context),
                      inputFormatters: [_model.inputcpfMask],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await currentUserReference!.update(createUsersRecordData(
                      displayName: _model.nomeCompletoTextController.text,
                      phoneNumber: _model.inputtelefoneTextController.text,
                      cpf: _model.inputcpfTextController.text,
                    ));
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Dados salvos'),
                          content:
                              Text('Seus dados foram atualizados com sucesso.'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  text: 'Alterar dados',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 59.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: Colors.white,
                          fontSize: 14.0,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
