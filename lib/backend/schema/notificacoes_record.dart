import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificacoesRecord extends FirestoreRecord {
  NotificacoesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "cidade" field.
  String? _cidade;
  String get cidade => _cidade ?? '';
  bool hasCidade() => _cidade != null;

  // "mensagem" field.
  String? _mensagem;
  String get mensagem => _mensagem ?? '';
  bool hasMensagem() => _mensagem != null;

  // "motorista" field.
  DocumentReference? _motorista;
  DocumentReference? get motorista => _motorista;
  bool hasMotorista() => _motorista != null;

  // "horario" field.
  DateTime? _horario;
  DateTime? get horario => _horario;
  bool hasHorario() => _horario != null;

  // "todosMotoristas" field.
  bool? _todosMotoristas;
  bool get todosMotoristas => _todosMotoristas ?? false;
  bool hasTodosMotoristas() => _todosMotoristas != null;

  // "tipoMensagem" field.
  String? _tipoMensagem;
  String get tipoMensagem => _tipoMensagem ?? '';
  bool hasTipoMensagem() => _tipoMensagem != null;

  void _initializeFields() {
    _cidade = snapshotData['cidade'] as String?;
    _mensagem = snapshotData['mensagem'] as String?;
    _motorista = snapshotData['motorista'] as DocumentReference?;
    _horario = snapshotData['horario'] as DateTime?;
    _todosMotoristas = snapshotData['todosMotoristas'] as bool?;
    _tipoMensagem = snapshotData['tipoMensagem'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notificacoes');

  static Stream<NotificacoesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificacoesRecord.fromSnapshot(s));

  static Future<NotificacoesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificacoesRecord.fromSnapshot(s));

  static NotificacoesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificacoesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificacoesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificacoesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificacoesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificacoesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificacoesRecordData({
  String? cidade,
  String? mensagem,
  DocumentReference? motorista,
  DateTime? horario,
  bool? todosMotoristas,
  String? tipoMensagem,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cidade': cidade,
      'mensagem': mensagem,
      'motorista': motorista,
      'horario': horario,
      'todosMotoristas': todosMotoristas,
      'tipoMensagem': tipoMensagem,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificacoesRecordDocumentEquality
    implements Equality<NotificacoesRecord> {
  const NotificacoesRecordDocumentEquality();

  @override
  bool equals(NotificacoesRecord? e1, NotificacoesRecord? e2) {
    return e1?.cidade == e2?.cidade &&
        e1?.mensagem == e2?.mensagem &&
        e1?.motorista == e2?.motorista &&
        e1?.horario == e2?.horario &&
        e1?.todosMotoristas == e2?.todosMotoristas &&
        e1?.tipoMensagem == e2?.tipoMensagem;
  }

  @override
  int hash(NotificacoesRecord? e) => const ListEquality().hash([
        e?.cidade,
        e?.mensagem,
        e?.motorista,
        e?.horario,
        e?.todosMotoristas,
        e?.tipoMensagem
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificacoesRecord;
}
