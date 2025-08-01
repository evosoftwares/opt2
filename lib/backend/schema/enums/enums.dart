import 'package:collection/collection.dart';

enum EuSou {
  Motorista,
  Passageiro,
  AdmApp,
}

enum OnlineOffline {
  Online,
  Offline,
}

enum Status {
  Solicitado,
  Aceito,
  motoristaChegou,
  emAndamento,
  Concluido,
  Cancelado,
}

enum TipoPagamento {
  corrida,
  reembolso,
  credito,
  saque,
}

enum StatusOferta {
  Pendente,
  Aceito,
  Rejeitado,
}

enum Cor {
  Branco,
  Cinza,
  Preto,
  Vermelho,
  Azul,
  Amarelo,
}

enum TipoMovimento {
  entrada,
  saida,
}

enum TipoChavePix {
  EVP,
  PHONE,
  EMAIL,
  CNPJ,
  CPF,
}

enum StatusConversaPeloStatusServico {
  andamento,
  finalizada,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (EuSou):
      return EuSou.values.deserialize(value) as T?;
    case (OnlineOffline):
      return OnlineOffline.values.deserialize(value) as T?;
    case (Status):
      return Status.values.deserialize(value) as T?;
    case (TipoPagamento):
      return TipoPagamento.values.deserialize(value) as T?;
    case (StatusOferta):
      return StatusOferta.values.deserialize(value) as T?;
    case (Cor):
      return Cor.values.deserialize(value) as T?;
    case (TipoMovimento):
      return TipoMovimento.values.deserialize(value) as T?;
    case (TipoChavePix):
      return TipoChavePix.values.deserialize(value) as T?;
    case (StatusConversaPeloStatusServico):
      return StatusConversaPeloStatusServico.values.deserialize(value) as T?;
    default:
      return null;
  }
}
