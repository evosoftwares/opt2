import '/backend/schema/enums/enums.dart';
import '/components/aceitar_corrida_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'principal_widget.dart' show PrincipalWidget;
import 'package:flutter/material.dart';

class PrincipalModel extends FlutterFlowModel<PrincipalWidget> {
  ///  Local state fields for this page.

  int? viagemIdPageState;

  LatLng? locInicial;

  List<Status> listastatus = [
    Status.Aceito,
    Status.motoristaChegou,
    Status.emAndamento,
    Status.Solicitado
  ];
  void addToListastatus(Status item) => listastatus.add(item);
  void removeFromListastatus(Status item) => listastatus.remove(item);
  void removeAtIndexFromListastatus(int index) => listastatus.removeAt(index);
  void insertAtIndexInListastatus(int index, Status item) =>
      listastatus.insert(index, item);
  void updateListastatusAtIndex(int index, Function(Status) updateFn) =>
      listastatus[index] = updateFn(listastatus[index]);

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Custom Action - locEmTempoReal] action in Button widget.
  bool? permissaoBoolean;
  // Model for AceitarCorrida component.
  late AceitarCorridaModel aceitarCorridaModel;

  @override
  void initState(BuildContext context) {
    aceitarCorridaModel = createModel(context, () => AceitarCorridaModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    aceitarCorridaModel.dispose();
  }
}
