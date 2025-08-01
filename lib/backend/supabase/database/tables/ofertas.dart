import '../database.dart';

class OfertasTable extends SupabaseTable<OfertasRow> {
  @override
  String get tableName => 'ofertas';

  @override
  OfertasRow createRow(Map<String, dynamic> data) => OfertasRow(data);
}

class OfertasRow extends SupabaseDataRow {
  OfertasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OfertasTable();

  int get ofertaid => getField<int>('ofertaid')!;
  set ofertaid(int value) => setField<int>('ofertaid', value);

  int? get viagemid => getField<int>('viagemid');
  set viagemid(int? value) => setField<int>('viagemid', value);

  String? get motoristaid => getField<String>('motoristaid');
  set motoristaid(String? value) => setField<String>('motoristaid', value);

  double? get precoofertado => getField<double>('precoofertado');
  set precoofertado(double? value) => setField<double>('precoofertado', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);
}
