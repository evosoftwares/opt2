import '../database.dart';

class MarcaDeCarrosTable extends SupabaseTable<MarcaDeCarrosRow> {
  @override
  String get tableName => 'marca de carros';

  @override
  MarcaDeCarrosRow createRow(Map<String, dynamic> data) =>
      MarcaDeCarrosRow(data);
}

class MarcaDeCarrosRow extends SupabaseDataRow {
  MarcaDeCarrosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MarcaDeCarrosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nomeDaMarca => getField<String>('nome da marca');
  set nomeDaMarca(String? value) => setField<String>('nome da marca', value);
}
