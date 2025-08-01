import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'aceitar_corrida_widget.dart' show AceitarCorridaWidget;
import 'package:flutter/material.dart';

class AceitarCorridaModel extends FlutterFlowModel<AceitarCorridaWidget> {
  ///  Local state fields for this component.

  bool cliclou = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Distancia origem e destino)] action in Button widget.
  ApiCallResponse? resultadoDistancia;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
