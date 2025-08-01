import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'meu_carro_widget.dart' show MeuCarroWidget;
import 'package:flutter/material.dart';

class MeuCarroModel extends FlutterFlowModel<MeuCarroWidget> {
  ///  Local state fields for this page.

  int? idMarca;

  String? nomeMarca;

  ///  State fields for stateful widgets in this page.

  // State field(s) for marca widget.
  String? marcaValue;
  FormFieldController<String>? marcaValueController;
  // State field(s) for modelo widget.
  String? modeloValue;
  FormFieldController<String>? modeloValueController;
  // State field(s) for ano widget.
  int? anoValue;
  FormFieldController<int>? anoValueController;
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
