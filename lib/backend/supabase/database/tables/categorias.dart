import '../database.dart';

class CategoriasTable extends SupabaseTable<CategoriasRow> {
  @override
  String get tableName => 'Categorias';

  @override
  CategoriasRow createRow(Map<String, dynamic> data) => CategoriasRow(data);
}

class CategoriasRow extends SupabaseDataRow {
  CategoriasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CategoriasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  double? get minPorKM => getField<double>('minPorKM');
  set minPorKM(double? value) => setField<double>('minPorKM', value);

  double? get maxPorKM => getField<double>('maxPorKM');
  set maxPorKM(double? value) => setField<double>('maxPorKM', value);

  String get nomeDaCategoria => getField<String>('Nome da categoria')!;
  set nomeDaCategoria(String value) =>
      setField<String>('Nome da categoria', value);
}
