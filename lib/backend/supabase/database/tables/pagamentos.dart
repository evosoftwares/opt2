import '../database.dart';

class PagamentosTable extends SupabaseTable<PagamentosRow> {
  @override
  String get tableName => 'Pagamentos';

  @override
  PagamentosRow createRow(Map<String, dynamic> data) => PagamentosRow(data);
}

class PagamentosRow extends SupabaseDataRow {
  PagamentosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PagamentosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get tipo => getField<String>('Tipo');
  set tipo(String? value) => setField<String>('Tipo', value);

  double? get valor => getField<double>('valor');
  set valor(double? value) => setField<double>('valor', value);

  String get emailUser => getField<String>('emailUser')!;
  set emailUser(String value) => setField<String>('emailUser', value);
}
