import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "CPF" field.
  String? _cpf;
  String get cpf => _cpf ?? '';
  bool hasCpf() => _cpf != null;

  // "euSou" field.
  EuSou? _euSou;
  EuSou? get euSou => _euSou;
  bool hasEuSou() => _euSou != null;

  // "CRLV" field.
  String? _crlv;
  String get crlv => _crlv ?? '';
  bool hasCrlv() => _crlv != null;

  // "CNH" field.
  String? _cnh;
  String get cnh => _cnh ?? '';
  bool hasCnh() => _cnh != null;

  // "online" field.
  bool? _online;
  bool get online => _online ?? false;
  bool hasOnline() => _online != null;

  // "marcaDoCarro" field.
  String? _marcaDoCarro;
  String get marcaDoCarro => _marcaDoCarro ?? '';
  bool hasMarcaDoCarro() => _marcaDoCarro != null;

  // "modeloDoCarro" field.
  String? _modeloDoCarro;
  String get modeloDoCarro => _modeloDoCarro ?? '';
  bool hasModeloDoCarro() => _modeloDoCarro != null;

  // "minhaCategoria" field.
  String? _minhaCategoria;
  String get minhaCategoria => _minhaCategoria ?? '';
  bool hasMinhaCategoria() => _minhaCategoria != null;

  // "minhaTarifa" field.
  double? _minhaTarifa;

  /// é a ultima tarifa aplicada
  double get minhaTarifa => _minhaTarifa ?? 0.0;
  bool hasMinhaTarifa() => _minhaTarifa != null;

  // "fotoCarro" field.
  String? _fotoCarro;
  String get fotoCarro => _fotoCarro ?? '';
  bool hasFotoCarro() => _fotoCarro != null;

  // "temAr" field.
  bool? _temAr;
  bool get temAr => _temAr ?? false;
  bool hasTemAr() => _temAr != null;

  // "avaliacoes" field.
  List<double>? _avaliacoes;
  List<double> get avaliacoes => _avaliacoes ?? const [];
  bool hasAvaliacoes() => _avaliacoes != null;

  // "idViagem" field.
  int? _idViagem;
  int get idViagem => _idViagem ?? 0;
  bool hasIdViagem() => _idViagem != null;

  // "placaVeiculo" field.
  String? _placaVeiculo;
  String get placaVeiculo => _placaVeiculo ?? '';
  bool hasPlacaVeiculo() => _placaVeiculo != null;

  // "numeroCorridas" field.
  int? _numeroCorridas;
  int get numeroCorridas => _numeroCorridas ?? 0;
  bool hasNumeroCorridas() => _numeroCorridas != null;

  // "dataDeCadastro" field.
  DateTime? _dataDeCadastro;
  DateTime? get dataDeCadastro => _dataDeCadastro;
  bool hasDataDeCadastro() => _dataDeCadastro != null;

  // "anoDoCarro" field.
  int? _anoDoCarro;
  int get anoDoCarro => _anoDoCarro ?? 0;
  bool hasAnoDoCarro() => _anoDoCarro != null;

  // "corCarro" field.
  String? _corCarro;
  String get corCarro => _corCarro ?? '';
  bool hasCorCarro() => _corCarro != null;

  // "emCarteira" field.
  double? _emCarteira;
  double get emCarteira => _emCarteira ?? 0.0;
  bool hasEmCarteira() => _emCarteira != null;

  // "tipoChave" field.
  String? _tipoChave;
  String get tipoChave => _tipoChave ?? '';
  bool hasTipoChave() => _tipoChave != null;

  // "chave_pix" field.
  String? _chavePix;
  String get chavePix => _chavePix ?? '';
  bool hasChavePix() => _chavePix != null;

  // "aceitou" field.
  bool? _aceitou;

  /// isso na verdade é clicou
  bool get aceitou => _aceitou ?? false;
  bool hasAceitou() => _aceitou != null;

  // "cep" field.
  String? _cep;
  String get cep => _cep ?? '';
  bool hasCep() => _cep != null;

  // "cidadeMotorista" field.
  String? _cidadeMotorista;
  String get cidadeMotorista => _cidadeMotorista ?? '';
  bool hasCidadeMotorista() => _cidadeMotorista != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _role = snapshotData['role'] as String?;
    _title = snapshotData['title'] as String?;
    _cpf = snapshotData['CPF'] as String?;
    _euSou = snapshotData['euSou'] is EuSou
        ? snapshotData['euSou']
        : deserializeEnum<EuSou>(snapshotData['euSou']);
    _crlv = snapshotData['CRLV'] as String?;
    _cnh = snapshotData['CNH'] as String?;
    _online = snapshotData['online'] as bool?;
    _marcaDoCarro = snapshotData['marcaDoCarro'] as String?;
    _modeloDoCarro = snapshotData['modeloDoCarro'] as String?;
    _minhaCategoria = snapshotData['minhaCategoria'] as String?;
    _minhaTarifa = castToType<double>(snapshotData['minhaTarifa']);
    _fotoCarro = snapshotData['fotoCarro'] as String?;
    _temAr = snapshotData['temAr'] as bool?;
    _avaliacoes = getDataList(snapshotData['avaliacoes']);
    _idViagem = castToType<int>(snapshotData['idViagem']);
    _placaVeiculo = snapshotData['placaVeiculo'] as String?;
    _numeroCorridas = castToType<int>(snapshotData['numeroCorridas']);
    _dataDeCadastro = snapshotData['dataDeCadastro'] as DateTime?;
    _anoDoCarro = castToType<int>(snapshotData['anoDoCarro']);
    _corCarro = snapshotData['corCarro'] as String?;
    _emCarteira = castToType<double>(snapshotData['emCarteira']);
    _tipoChave = snapshotData['tipoChave'] as String?;
    _chavePix = snapshotData['chave_pix'] as String?;
    _aceitou = snapshotData['aceitou'] as bool?;
    _cep = snapshotData['cep'] as String?;
    _cidadeMotorista = snapshotData['cidadeMotorista'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? shortDescription,
  DateTime? lastActiveTime,
  String? role,
  String? title,
  String? cpf,
  EuSou? euSou,
  String? crlv,
  String? cnh,
  bool? online,
  String? marcaDoCarro,
  String? modeloDoCarro,
  String? minhaCategoria,
  double? minhaTarifa,
  String? fotoCarro,
  bool? temAr,
  int? idViagem,
  String? placaVeiculo,
  int? numeroCorridas,
  DateTime? dataDeCadastro,
  int? anoDoCarro,
  String? corCarro,
  double? emCarteira,
  String? tipoChave,
  String? chavePix,
  bool? aceitou,
  String? cep,
  String? cidadeMotorista,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'role': role,
      'title': title,
      'CPF': cpf,
      'euSou': euSou,
      'CRLV': crlv,
      'CNH': cnh,
      'online': online,
      'marcaDoCarro': marcaDoCarro,
      'modeloDoCarro': modeloDoCarro,
      'minhaCategoria': minhaCategoria,
      'minhaTarifa': minhaTarifa,
      'fotoCarro': fotoCarro,
      'temAr': temAr,
      'idViagem': idViagem,
      'placaVeiculo': placaVeiculo,
      'numeroCorridas': numeroCorridas,
      'dataDeCadastro': dataDeCadastro,
      'anoDoCarro': anoDoCarro,
      'corCarro': corCarro,
      'emCarteira': emCarteira,
      'tipoChave': tipoChave,
      'chave_pix': chavePix,
      'aceitou': aceitou,
      'cep': cep,
      'cidadeMotorista': cidadeMotorista,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.role == e2?.role &&
        e1?.title == e2?.title &&
        e1?.cpf == e2?.cpf &&
        e1?.euSou == e2?.euSou &&
        e1?.crlv == e2?.crlv &&
        e1?.cnh == e2?.cnh &&
        e1?.online == e2?.online &&
        e1?.marcaDoCarro == e2?.marcaDoCarro &&
        e1?.modeloDoCarro == e2?.modeloDoCarro &&
        e1?.minhaCategoria == e2?.minhaCategoria &&
        e1?.minhaTarifa == e2?.minhaTarifa &&
        e1?.fotoCarro == e2?.fotoCarro &&
        e1?.temAr == e2?.temAr &&
        listEquality.equals(e1?.avaliacoes, e2?.avaliacoes) &&
        e1?.idViagem == e2?.idViagem &&
        e1?.placaVeiculo == e2?.placaVeiculo &&
        e1?.numeroCorridas == e2?.numeroCorridas &&
        e1?.dataDeCadastro == e2?.dataDeCadastro &&
        e1?.anoDoCarro == e2?.anoDoCarro &&
        e1?.corCarro == e2?.corCarro &&
        e1?.emCarteira == e2?.emCarteira &&
        e1?.tipoChave == e2?.tipoChave &&
        e1?.chavePix == e2?.chavePix &&
        e1?.aceitou == e2?.aceitou &&
        e1?.cep == e2?.cep &&
        e1?.cidadeMotorista == e2?.cidadeMotorista;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.role,
        e?.title,
        e?.cpf,
        e?.euSou,
        e?.crlv,
        e?.cnh,
        e?.online,
        e?.marcaDoCarro,
        e?.modeloDoCarro,
        e?.minhaCategoria,
        e?.minhaTarifa,
        e?.fotoCarro,
        e?.temAr,
        e?.avaliacoes,
        e?.idViagem,
        e?.placaVeiculo,
        e?.numeroCorridas,
        e?.dataDeCadastro,
        e?.anoDoCarro,
        e?.corCarro,
        e?.emCarteira,
        e?.tipoChave,
        e?.chavePix,
        e?.aceitou,
        e?.cep,
        e?.cidadeMotorista
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
