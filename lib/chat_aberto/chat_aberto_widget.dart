import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat_aberto_model.dart';
export 'chat_aberto_model.dart';

class ChatAbertoWidget extends StatefulWidget {
  const ChatAbertoWidget({
    super.key,
    required this.comQuem,
    required this.conversa,
  });

  final DocumentReference? comQuem;
  final DocumentReference? conversa;

  static String routeName = 'chatAberto';
  static String routePath = 'chatAberto';

  @override
  State<ChatAbertoWidget> createState() => _ChatAbertoWidgetState();
}

class _ChatAbertoWidgetState extends State<ChatAbertoWidget> {
  late ChatAbertoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatAbertoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await widget.conversa!.update({
        ...mapToFirestore(
          {
            'quemLeu': FieldValue.delete(),
          },
        ),
      });
      await _model.columnScroll?.animateTo(
        _model.columnScroll!.position.maxScrollExtent,
        duration: Duration(milliseconds: 0),
        curve: Curves.ease,
      );
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
        backgroundColor: FlutterFlowTheme.of(context).secondary,
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
          title: StreamBuilder<UsersRecord>(
            stream: UsersRecord.getDocument(widget.comQuem!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).secondary,
                      ),
                    ),
                  ),
                );
              }

              final textUsersRecord = snapshot.data!;

              return Text(
                textUsersRecord.displayName,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              );
            },
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  primary: false,
                  controller: _model.columnScroll,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: FutureBuilder<List<MensagensRecord>>(
                          future: queryMensagensRecordOnce(
                            queryBuilder: (mensagensRecord) => mensagensRecord
                                .where(
                                  'conversaID',
                                  isEqualTo: widget.conversa,
                                )
                                .orderBy('createdAt'),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).secondary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<MensagensRecord> listViewMensagensRecordList =
                                snapshot.data!;

                            return ListView.separated(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                11.0,
                                0,
                                11.0,
                              ),
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewMensagensRecordList.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 11.0),
                              itemBuilder: (context, listViewIndex) {
                                final listViewMensagensRecord =
                                    listViewMensagensRecordList[listViewIndex];
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (listViewMensagensRecord.enviadoPor !=
                                        currentUserReference)
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFE9E9E9),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(22.0),
                                                  topLeft:
                                                      Radius.circular(22.0),
                                                  topRight:
                                                      Radius.circular(22.0),
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (listViewMensagensRecord
                                                          .ehMensagem ==
                                                      true)
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(10.0),
                                                      child: Text(
                                                        listViewMensagensRecord
                                                            .mensagem,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  if (listViewMensagensRecord
                                                          .ehMensagem ==
                                                      false)
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        listViewMensagensRecord
                                                            .fotoChat,
                                                        width: 200.0,
                                                        height: 200.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                dateTimeFormat(
                                                  "Hm",
                                                  listViewMensagensRecord
                                                      .createdAt!,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (listViewMensagensRecord.enviadoPor ==
                                        currentUserReference)
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(22.0),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(22.0),
                                                    topRight:
                                                        Radius.circular(22.0),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (listViewMensagensRecord
                                                            .ehMensagem ==
                                                        true)
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Text(
                                                          listViewMensagensRecord
                                                              .mensagem,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    if (listViewMensagensRecord
                                                            .ehMensagem ==
                                                        false)
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          listViewMensagensRecord
                                                              .fotoChat,
                                                          width: 200.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Text(
                                                  dateTimeFormat(
                                                    "Hm",
                                                    listViewMensagensRecord
                                                        .createdAt!,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              },
                              controller: _model.listViewController,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          textInputAction: TextInputAction.send,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: false,
                            hintText: 'Digite uma mensagem...',
                            hintStyle: FlutterFlowTheme.of(context)
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
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            filled: true,
                            fillColor: Color(0xFFECECEC),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                          maxLines: 10,
                          minLines: 1,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            final firestoreBatch =
                                FirebaseFirestore.instance.batch();
                            try {
                              final selectedMedia =
                                  await selectMediaWithSourceBottomSheet(
                                context: context,
                                allowPhoto: true,
                                allowVideo: true,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                safeSetState(() =>
                                    _model.isDataUploading_fotoConversa = true);
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
                                      (m) async => await uploadData(
                                          m.storagePath, m.bytes),
                                    ),
                                  ))
                                      .where((u) => u != null)
                                      .map((u) => u!)
                                      .toList();
                                } finally {
                                  _model.isDataUploading_fotoConversa = false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile_fotoConversa =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl_fotoConversa =
                                        downloadUrls.first;
                                  });
                                } else {
                                  safeSetState(() {});
                                  return;
                                }
                              }

                              var mensagensRecordReference =
                                  MensagensRecord.collection.doc();
                              firestoreBatch.set(
                                  mensagensRecordReference,
                                  createMensagensRecordData(
                                    enviadoPor: currentUserReference,
                                    createdAt: getCurrentTimestamp,
                                    conversaID: widget.conversa,
                                    fotoChat:
                                        _model.uploadedFileUrl_fotoConversa,
                                    ehMensagem: false,
                                    mensagem: 'Foto...',
                                  ));
                              _model.imagemNova =
                                  MensagensRecord.getDocumentFromData(
                                      createMensagensRecordData(
                                        enviadoPor: currentUserReference,
                                        createdAt: getCurrentTimestamp,
                                        conversaID: widget.conversa,
                                        fotoChat:
                                            _model.uploadedFileUrl_fotoConversa,
                                        ehMensagem: false,
                                        mensagem: 'Foto...',
                                      ),
                                      mensagensRecordReference);

                              firestoreBatch.update(
                                  _model.imagemNova!.reference,
                                  createMensagensRecordData(
                                    mensagensId:
                                        _model.imagemNova?.reference.id,
                                  ));
                              safeSetState(() {
                                _model.textController?.clear();
                              });

                              firestoreBatch.update(widget.conversa!, {
                                ...createConversasRecordData(
                                  ultimaMensagem: _model.imagemNova?.reference,
                                ),
                                ...mapToFirestore(
                                  {
                                    'quemLeu': FieldValue.arrayRemove(
                                        [currentUserReference]),
                                  },
                                ),
                              });

                              firestoreBatch.update(widget.conversa!, {
                                ...mapToFirestore(
                                  {
                                    'quemLeu': FieldValue.arrayUnion(
                                        [currentUserReference]),
                                  },
                                ),
                              });
                              await Future.delayed(
                                Duration(
                                  milliseconds: 25,
                                ),
                              );
                              unawaited(
                                () async {
                                  await _model.columnScroll?.animateTo(
                                    _model
                                        .columnScroll!.position.maxScrollExtent,
                                    duration: Duration(milliseconds: 5),
                                    curve: Curves.ease,
                                  );
                                }(),
                              );
                            } finally {
                              await firestoreBatch.commit();
                            }

                            safeSetState(() {});
                          },
                          child: FaIcon(
                            FontAwesomeIcons.paperclip,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 40.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderRadius: 24.0,
                          buttonSize: 42.0,
                          fillColor: FlutterFlowTheme.of(context).info,
                          icon: Icon(
                            Icons.send_sharp,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            final firestoreBatch =
                                FirebaseFirestore.instance.batch();
                            try {
                              if (_model.textController.text != '') {
                                var mensagensRecordReference =
                                    MensagensRecord.collection.doc();
                                firestoreBatch.set(
                                    mensagensRecordReference,
                                    createMensagensRecordData(
                                      enviadoPor: currentUserReference,
                                      mensagem: _model.textController.text,
                                      createdAt: getCurrentTimestamp,
                                      conversaID: widget.conversa,
                                      ehMensagem: true,
                                    ));
                                _model.mensagemNova =
                                    MensagensRecord.getDocumentFromData(
                                        createMensagensRecordData(
                                          enviadoPor: currentUserReference,
                                          mensagem: _model.textController.text,
                                          createdAt: getCurrentTimestamp,
                                          conversaID: widget.conversa,
                                          ehMensagem: true,
                                        ),
                                        mensagensRecordReference);

                                firestoreBatch.update(
                                    _model.mensagemNova!.reference,
                                    createMensagensRecordData(
                                      mensagensId:
                                          _model.mensagemNova?.reference.id,
                                    ));
                                safeSetState(() {
                                  _model.textController?.clear();
                                });

                                firestoreBatch.update(widget.conversa!, {
                                  ...createConversasRecordData(
                                    ultimaMensagem:
                                        _model.mensagemNova?.reference,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'quemLeu': FieldValue.arrayRemove(
                                          [currentUserReference]),
                                    },
                                  ),
                                });

                                firestoreBatch.update(widget.conversa!, {
                                  ...mapToFirestore(
                                    {
                                      'quemLeu': FieldValue.arrayUnion(
                                          [currentUserReference]),
                                    },
                                  ),
                                });
                                await Future.delayed(
                                  Duration(
                                    milliseconds: 25,
                                  ),
                                );
                              } else {
                                await action_blocks.alertaNegativo(
                                  context,
                                  mensagem: 'Escreva uma mensagem',
                                );
                                safeSetState(() {});
                              }

                              unawaited(
                                () async {
                                  await _model.columnScroll?.animateTo(
                                    _model
                                        .columnScroll!.position.maxScrollExtent,
                                    duration: Duration(milliseconds: 5),
                                    curve: Curves.ease,
                                  );
                                }(),
                              );
                            } finally {
                              await firestoreBatch.commit();
                            }

                            safeSetState(() {});
                          },
                        ),
                      ),
                    ],
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
