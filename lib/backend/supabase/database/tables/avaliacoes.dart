import '../database.dart';

class AvaliacoesTable extends SupabaseTable<AvaliacoesRow> {
  @override
  String get tableName => 'avaliacoes';

  @override
  AvaliacoesRow createRow(Map<String, dynamic> data) => AvaliacoesRow(data);
}

class AvaliacoesRow extends SupabaseDataRow {
  AvaliacoesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AvaliacoesTable();

  int get idViagem => getField<int>('idViagem')!;
  set idViagem(int value) => setField<int>('idViagem', value);

  double get nota => getField<double>('nota')!;
  set nota(double value) => setField<double>('nota', value);

  String? get comentario => getField<String>('comentario');
  set comentario(String? value) => setField<String>('comentario', value);

  String get usuario => getField<String>('usuario')!;
  set usuario(String value) => setField<String>('usuario', value);

  String? get motorista => getField<String>('motorista');
  set motorista(String? value) => setField<String>('motorista', value);
}
