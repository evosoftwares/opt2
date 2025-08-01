import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListaDeMotoristasRecord extends FirestoreRecord {
  ListaDeMotoristasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "listaMotoristasProximoe" field.
  List<DocumentReference>? _listaMotoristasProximoe;
  List<DocumentReference> get listaMotoristasProximoe =>
      _listaMotoristasProximoe ?? const [];
  bool hasListaMotoristasProximoe() => _listaMotoristasProximoe != null;

  void _initializeFields() {
    _listaMotoristasProximoe =
        getDataList(snapshotData['listaMotoristasProximoe']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('listaDeMotoristas');

  static Stream<ListaDeMotoristasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ListaDeMotoristasRecord.fromSnapshot(s));

  static Future<ListaDeMotoristasRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ListaDeMotoristasRecord.fromSnapshot(s));

  static ListaDeMotoristasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ListaDeMotoristasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ListaDeMotoristasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ListaDeMotoristasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ListaDeMotoristasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ListaDeMotoristasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createListaDeMotoristasRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class ListaDeMotoristasRecordDocumentEquality
    implements Equality<ListaDeMotoristasRecord> {
  const ListaDeMotoristasRecordDocumentEquality();

  @override
  bool equals(ListaDeMotoristasRecord? e1, ListaDeMotoristasRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(
        e1?.listaMotoristasProximoe, e2?.listaMotoristasProximoe);
  }

  @override
  int hash(ListaDeMotoristasRecord? e) =>
      const ListEquality().hash([e?.listaMotoristasProximoe]);

  @override
  bool isValidKey(Object? o) => o is ListaDeMotoristasRecord;
}
