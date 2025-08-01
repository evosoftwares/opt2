import '../database.dart';

class LocalizacaoMotoristaTable extends SupabaseTable<LocalizacaoMotoristaRow> {
  @override
  String get tableName => 'LocalizacaoMotorista';

  @override
  LocalizacaoMotoristaRow createRow(Map<String, dynamic> data) =>
      LocalizacaoMotoristaRow(data);
}

class LocalizacaoMotoristaRow extends SupabaseDataRow {
  LocalizacaoMotoristaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LocalizacaoMotoristaTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String? get localizacao => getField<String>('localizacao');
  set localizacao(String? value) => setField<String>('localizacao', value);

  DateTime? get timestamp => getField<DateTime>('timestamp');
  set timestamp(DateTime? value) => setField<DateTime>('timestamp', value);
}
