import '../database.dart';

class AnoVeiculosTable extends SupabaseTable<AnoVeiculosRow> {
  @override
  String get tableName => 'ano veiculos';

  @override
  AnoVeiculosRow createRow(Map<String, dynamic> data) => AnoVeiculosRow(data);
}

class AnoVeiculosRow extends SupabaseDataRow {
  AnoVeiculosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AnoVeiculosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get ano => getField<int>('ano');
  set ano(int? value) => setField<int>('ano', value);
}
