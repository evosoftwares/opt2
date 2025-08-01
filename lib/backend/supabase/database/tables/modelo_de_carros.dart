import '../database.dart';

class ModeloDeCarrosTable extends SupabaseTable<ModeloDeCarrosRow> {
  @override
  String get tableName => 'modelo de carros';

  @override
  ModeloDeCarrosRow createRow(Map<String, dynamic> data) =>
      ModeloDeCarrosRow(data);
}

class ModeloDeCarrosRow extends SupabaseDataRow {
  ModeloDeCarrosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ModeloDeCarrosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nomeDoModelo => getField<String>('nome do modelo');
  set nomeDoModelo(String? value) => setField<String>('nome do modelo', value);

  String? get pertenceAQualMarca => getField<String>('pertence a qual marca');
  set pertenceAQualMarca(String? value) =>
      setField<String>('pertence a qual marca', value);

  int? get marcas => getField<int>('marcas');
  set marcas(int? value) => setField<int>('marcas', value);
}
