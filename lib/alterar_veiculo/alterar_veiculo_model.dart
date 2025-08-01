import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'alterar_veiculo_widget.dart' show AlterarVeiculoWidget;
import 'package:flutter/material.dart';

class AlterarVeiculoModel extends FlutterFlowModel<AlterarVeiculoWidget> {
  ///  Local state fields for this page.

  String? marcaCarro;

  ///  State fields for stateful widgets in this page.

  // State field(s) for cor widget.
  String? corValue;
  FormFieldController<String>? corValueController;
  // State field(s) for placa widget.
  FocusNode? placaFocusNode;
  TextEditingController? placaTextController;
  String? Function(BuildContext, String?)? placaTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    placaFocusNode?.dispose();
    placaTextController?.dispose();
  }
}
