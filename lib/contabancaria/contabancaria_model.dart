import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'contabancaria_widget.dart' show ContabancariaWidget;
import 'package:flutter/material.dart';

class ContabancariaModel extends FlutterFlowModel<ContabancariaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for chavePix widget.
  FocusNode? chavePixFocusNode;
  TextEditingController? chavePixTextController;
  String? Function(BuildContext, String?)? chavePixTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    chavePixFocusNode?.dispose();
    chavePixTextController?.dispose();
  }
}
