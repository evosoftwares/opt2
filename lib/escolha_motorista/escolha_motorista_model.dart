import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'escolha_motorista_widget.dart' show EscolhaMotoristaWidget;
import 'package:flutter/material.dart';

class EscolhaMotoristaModel extends FlutterFlowModel<EscolhaMotoristaWidget> {
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

  int? nMotoristas;

  ///  State fields for stateful widgets in this page.

  Stream<List<OfertasRow>>? escolhaMotoristaSupabaseStream;
  // Stores action output result for [Backend Call - Query Rows] action in ListaDeOfertasAnimada widget.
  List<OfertasRow>? queryOfertas;
  // Stores action output result for [Backend Call - Create Document] action in ListaDeOfertasAnimada widget.
  ConversasRecord? atualizaPessoa;
  // Stores action output result for [Backend Call - Create Document] action in ListaDeOfertasAnimada widget.
  MensagensRecord? mensagemEnviada;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UsersRecord>? listaMotoristas;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
