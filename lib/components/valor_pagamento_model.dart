import '/flutter_flow/flutter_flow_util.dart';
import 'valor_pagamento_widget.dart' show ValorPagamentoWidget;
import 'package:flutter/material.dart';

class ValorPagamentoModel extends FlutterFlowModel<ValorPagamentoWidget> {
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
