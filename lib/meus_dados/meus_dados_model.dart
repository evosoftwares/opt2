import '/flutter_flow/flutter_flow_util.dart';
import 'meus_dados_widget.dart' show MeusDadosWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MeusDadosModel extends FlutterFlowModel<MeusDadosWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataL6t = false;
  FFUploadedFile uploadedLocalFile_uploadDataL6t =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataL6t = '';

  // State field(s) for nomeCompleto widget.
  FocusNode? nomeCompletoFocusNode;
  TextEditingController? nomeCompletoTextController;
  String? Function(BuildContext, String?)? nomeCompletoTextControllerValidator;
  // State field(s) for inputtelefone widget.
  FocusNode? inputtelefoneFocusNode;
  TextEditingController? inputtelefoneTextController;
  late MaskTextInputFormatter inputtelefoneMask;
  String? Function(BuildContext, String?)? inputtelefoneTextControllerValidator;
  // State field(s) for inputcpf widget.
  FocusNode? inputcpfFocusNode;
  TextEditingController? inputcpfTextController;
  late MaskTextInputFormatter inputcpfMask;
  String? Function(BuildContext, String?)? inputcpfTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeCompletoFocusNode?.dispose();
    nomeCompletoTextController?.dispose();

    inputtelefoneFocusNode?.dispose();
    inputtelefoneTextController?.dispose();

    inputcpfFocusNode?.dispose();
    inputcpfTextController?.dispose();
  }
}
