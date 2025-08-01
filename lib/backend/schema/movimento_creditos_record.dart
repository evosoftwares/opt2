import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MovimentoCreditosRecord extends FirestoreRecord {
  MovimentoCreditosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  bool hasValor() => _valor != null;

  // "dataMovimento" field.
  DateTime? _dataMovimento;
  DateTime? get dataMovimento => _dataMovimento;
  bool hasDataMovimento() => _dataMovimento != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "fonte" field.
  DocumentReference? _fonte;
  DocumentReference? get fonte => _fonte;
  bool hasFonte() => _fonte != null;

  // "tipo" field.
  TipoMovimento? _tipo;
  TipoMovimento? get tipo => _tipo;
  bool hasTipo() => _tipo != null;

  void _initializeFields() {
    _valor = castToType<double>(snapshotData['valor']);
    _dataMovimento = snapshotData['dataMovimento'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _fonte = snapshotData['fonte'] as DocumentReference?;
    _tipo = snapshotData['tipo'] is TipoMovimento
        ? snapshotData['tipo']
        : deserializeEnum<TipoMovimento>(snapshotData['tipo']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('movimentoCreditos');

  static Stream<MovimentoCreditosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MovimentoCreditosRecord.fromSnapshot(s));

  static Future<MovimentoCreditosRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => MovimentoCreditosRecord.fromSnapshot(s));

  static MovimentoCreditosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MovimentoCreditosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MovimentoCreditosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MovimentoCreditosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MovimentoCreditosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MovimentoCreditosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMovimentoCreditosRecordData({
  double? valor,
  DateTime? dataMovimento,
  DocumentReference? user,
  DocumentReference? fonte,
  TipoMovimento? tipo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'valor': valor,
      'dataMovimento': dataMovimento,
      'user': user,
      'fonte': fonte,
      'tipo': tipo,
    }.withoutNulls,
  );

  return firestoreData;
}

class MovimentoCreditosRecordDocumentEquality
    implements Equality<MovimentoCreditosRecord> {
  const MovimentoCreditosRecordDocumentEquality();

  @override
  bool equals(MovimentoCreditosRecord? e1, MovimentoCreditosRecord? e2) {
    return e1?.valor == e2?.valor &&
        e1?.dataMovimento == e2?.dataMovimento &&
        e1?.user == e2?.user &&
        e1?.fonte == e2?.fonte &&
        e1?.tipo == e2?.tipo;
  }

  @override
  int hash(MovimentoCreditosRecord? e) => const ListEquality()
      .hash([e?.valor, e?.dataMovimento, e?.user, e?.fonte, e?.tipo]);

  @override
  bool isValidKey(Object? o) => o is MovimentoCreditosRecord;
}
