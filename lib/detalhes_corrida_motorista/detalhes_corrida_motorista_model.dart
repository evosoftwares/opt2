import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'detalhes_corrida_motorista_widget.dart'
    show DetalhesCorridaMotoristaWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class DetalhesCorridaMotoristaModel
    extends FlutterFlowModel<DetalhesCorridaMotoristaWidget> {
  ///  State fields for stateful widgets in this page.

  Stream<List<ViagensRow>>? detalhesCorridaMotoristaSupabaseStream;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timerController.dispose();
  }
}
