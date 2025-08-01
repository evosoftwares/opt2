import '../database.dart';

class ViagensTable extends SupabaseTable<ViagensRow> {
  @override
  String get tableName => 'viagens';

  @override
  ViagensRow createRow(Map<String, dynamic> data) => ViagensRow(data);
}

class ViagensRow extends SupabaseDataRow {
  ViagensRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViagensTable();

  int get viagemid => getField<int>('viagemid')!;
  set viagemid(int value) => setField<int>('viagemid', value);

  String? get passageiroEmail => getField<String>('passageiroEmail');
  set passageiroEmail(String? value) =>
      setField<String>('passageiroEmail', value);

  String get origem => getField<String>('origem')!;
  set origem(String value) => setField<String>('origem', value);

  String get destino => getField<String>('destino')!;
  set destino(String value) => setField<String>('destino', value);

  double? get precosugerido => getField<double>('precosugerido');
  set precosugerido(double? value) => setField<double>('precosugerido', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  DateTime? get horarioOrigem => getField<DateTime>('horarioOrigem');
  set horarioOrigem(DateTime? value) =>
      setField<DateTime>('horarioOrigem', value);

  DateTime? get horarioChegada => getField<DateTime>('horarioChegada');
  set horarioChegada(DateTime? value) =>
      setField<DateTime>('horarioChegada', value);

  String? get motoristaEmail => getField<String>('motoristaEmail');
  set motoristaEmail(String? value) =>
      setField<String>('motoristaEmail', value);

  String? get categorias => getField<String>('Categorias');
  set categorias(String? value) => setField<String>('Categorias', value);

  String? get formaDePagamento => getField<String>('forma de pagamento');
  set formaDePagamento(String? value) =>
      setField<String>('forma de pagamento', value);

  String? get comentario => getField<String>('comentario');
  set comentario(String? value) => setField<String>('comentario', value);

  bool? get animal => getField<bool>('animal');
  set animal(bool? value) => setField<bool>('animal', value);

  bool? get portaMala => getField<bool>('portaMala');
  set portaMala(bool? value) => setField<bool>('portaMala', value);

  bool? get entrarCondominio => getField<bool>('entrarCondominio');
  set entrarCondominio(bool? value) =>
      setField<bool>('entrarCondominio', value);

  bool? get arCondicionado => getField<bool>('arCondicionado');
  set arCondicionado(bool? value) => setField<bool>('arCondicionado', value);

  String? get passageiroReference => getField<String>('passageiroReference');
  set passageiroReference(String? value) =>
      setField<String>('passageiroReference', value);

  String? get motoristaReference => getField<String>('motoristaReference');
  set motoristaReference(String? value) =>
      setField<String>('motoristaReference', value);

  String? get enderecoOrigem => getField<String>('enderecoOrigem');
  set enderecoOrigem(String? value) =>
      setField<String>('enderecoOrigem', value);

  String? get enderecoDestino => getField<String>('enderecoDestino');
  set enderecoDestino(String? value) =>
      setField<String>('enderecoDestino', value);

  String? get idConversa => getField<String>('idConversa');
  set idConversa(String? value) => setField<String>('idConversa', value);
}
