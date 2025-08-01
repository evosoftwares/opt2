import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'solicitar_saque_widget.dart' show SolicitarSaqueWidget;
import 'package:flutter/material.dart';

class SolicitarSaqueModel extends FlutterFlowModel<SolicitarSaqueWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SaquesRecord? saqueCriado;
  // Stores action output result for [Backend Call - API (iniciarSaqueAsaas)] action in Button widget.
  ApiCallResponse? resultadoApiSaque;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
