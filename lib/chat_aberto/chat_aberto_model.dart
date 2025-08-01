import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_aberto_widget.dart' show ChatAbertoWidget;
import 'package:flutter/material.dart';

class ChatAbertoModel extends FlutterFlowModel<ChatAbertoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ColumnScroll widget.
  ScrollController? columnScroll;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading_fotoConversa = false;
  FFUploadedFile uploadedLocalFile_fotoConversa =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_fotoConversa = '';

  // Stores action output result for [Backend Call - Create Document] action in Icon widget.
  MensagensRecord? imagemNova;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  MensagensRecord? mensagemNova;

  @override
  void initState(BuildContext context) {
    columnScroll = ScrollController();
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    columnScroll?.dispose();
    listViewController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
