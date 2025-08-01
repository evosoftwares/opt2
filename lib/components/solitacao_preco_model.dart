import '/flutter_flow/flutter_flow_util.dart';
import 'solitacao_preco_widget.dart' show SolitacaoPrecoWidget;
import 'package:flutter/material.dart';

class SolitacaoPrecoModel extends FlutterFlowModel<SolitacaoPrecoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for valor widget.
  FocusNode? valorFocusNode;
  TextEditingController? valorTextController;
  String? Function(BuildContext, String?)? valorTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    valorFocusNode?.dispose();
    valorTextController?.dispose();
  }
}
