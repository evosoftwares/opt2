import '/backend/supabase/supabase.dart';
import '/components/avaliacao_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'detalhes_corrida_cliente_widget.dart' show DetalhesCorridaClienteWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class DetalhesCorridaClienteModel
    extends FlutterFlowModel<DetalhesCorridaClienteWidget> {
  ///  State fields for stateful widgets in this page.

  Stream<List<ViagensRow>>? detalhesCorridaClienteSupabaseStream;
  // Stores action output result for [Backend Call - Query Rows] action in detalhesCorridaCliente widget.
  List<ViagensRow>? viagemzinha;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 180000;
  int timerMilliseconds = 180000;
  String timerValue = StopWatchTimer.getDisplayTime(
    180000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for avaliacao component.
  late AvaliacaoModel avaliacaoModel;

  @override
  void initState(BuildContext context) {
    avaliacaoModel = createModel(context, () => AvaliacaoModel());
  }

  @override
  void dispose() {
    timerController.dispose();
    avaliacaoModel.dispose();
  }
}
