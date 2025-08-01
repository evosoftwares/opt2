import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'chamar_carro1_widget.dart' show ChamarCarro1Widget;
import 'package:flutter/material.dart';

class ChamarCarro1Model extends FlutterFlowModel<ChamarCarro1Widget> {
  ///  Local state fields for this page.

  int indice = 0;

  List<DocumentReference> listaMotoristasProximos = [];
  void addToListaMotoristasProximos(DocumentReference item) =>
      listaMotoristasProximos.add(item);
  void removeFromListaMotoristasProximos(DocumentReference item) =>
      listaMotoristasProximos.remove(item);
  void removeAtIndexFromListaMotoristasProximos(int index) =>
      listaMotoristasProximos.removeAt(index);
  void insertAtIndexInListaMotoristasProximos(
          int index, DocumentReference item) =>
      listaMotoristasProximos.insert(index, item);
  void updateListaMotoristasProximosAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      listaMotoristasProximos[index] = updateFn(listaMotoristasProximos[index]);

  int tamNMotoristas = 0;

  int? distancia = 0;

  List<DocumentReference> listaMotoristaFiltrados = [];
  void addToListaMotoristaFiltrados(DocumentReference item) =>
      listaMotoristaFiltrados.add(item);
  void removeFromListaMotoristaFiltrados(DocumentReference item) =>
      listaMotoristaFiltrados.remove(item);
  void removeAtIndexFromListaMotoristaFiltrados(int index) =>
      listaMotoristaFiltrados.removeAt(index);
  void insertAtIndexInListaMotoristaFiltrados(
          int index, DocumentReference item) =>
      listaMotoristaFiltrados.insert(index, item);
  void updateListaMotoristaFiltradosAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      listaMotoristaFiltrados[index] = updateFn(listaMotoristaFiltrados[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for PlacePickerOrigem widget.
  FFPlace placePickerOrigemValue = FFPlace();
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // State field(s) for DropDownCategorias widget.
  String? dropDownCategoriasValue;
  FormFieldController<String>? dropDownCategoriasValueController;
  // State field(s) for ar widget.
  bool? arValue;
  // State field(s) for animal widget.
  bool? animalValue;
  // State field(s) for portaMala widget.
  bool? portaMalaValue;
  // State field(s) for condominio widget.
  bool? condominioValue;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UsersRecord>? motoristas;
  // Stores action output result for [Custom Action - buscarMotoristasProximos] action in Button widget.
  List<UsersRecord>? saidaaction;
  // Stores action output result for [Custom Action - buscarMotoristasProximos] action in Button widget.
  List<UsersRecord>? saidaaction20;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ViagensRow? viagem;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? motoristasFiltrados;
  // Stores action output result for [Backend Call - Delete Row(s)] action in Button widget.
  List<ViagensRow>? deletada;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
