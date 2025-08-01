import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'escolha_motorista_descontinuado_widget.dart'
    show EscolhaMotoristaDescontinuadoWidget;
import 'package:flutter/material.dart';

class EscolhaMotoristaDescontinuadoModel
    extends FlutterFlowModel<EscolhaMotoristaDescontinuadoWidget> {
  ///  Local state fields for this page.

  List<OfertasRow> load = [];
  void addToLoad(OfertasRow item) => load.add(item);
  void removeFromLoad(OfertasRow item) => load.remove(item);
  void removeAtIndexFromLoad(int index) => load.removeAt(index);
  void insertAtIndexInLoad(int index, OfertasRow item) =>
      load.insert(index, item);
  void updateLoadAtIndex(int index, Function(OfertasRow) updateFn) =>
      load[index] = updateFn(load[index]);

  int indice = 0;

  OfertasRow? supaList;

  List<int> ofertasid = [];
  void addToOfertasid(int item) => ofertasid.add(item);
  void removeFromOfertasid(int item) => ofertasid.remove(item);
  void removeAtIndexFromOfertasid(int index) => ofertasid.removeAt(index);
  void insertAtIndexInOfertasid(int index, int item) =>
      ofertasid.insert(index, item);
  void updateOfertasidAtIndex(int index, Function(int) updateFn) =>
      ofertasid[index] = updateFn(ofertasid[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<OfertasRow>? queryOferta;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ConversasRecord? atualizaPessoa;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  MensagensRecord? mensagemEnviada;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
