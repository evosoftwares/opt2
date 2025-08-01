import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'adicionar_creditos_widget.dart' show AdicionarCreditosWidget;
import 'package:flutter/material.dart';

class AdicionarCreditosModel extends FlutterFlowModel<AdicionarCreditosWidget> {
  ///  Local state fields for this page.

  String? ip;

  String valor = '0';

  double? valortrans;

  bool? esperarValor;

  String? email;

  String? numero;

  String? cep;

  String? nome;

  String? cpf;

  double? valorPraCreate;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - pegarIp] action in adicionarCreditos widget.
  String? ipXustom;
  // Stores action output result for [Backend Call - API (Criar Cliente Asaas)] action in Row widget.
  ApiCallResponse? cliente;
  // Stores action output result for [Backend Call - API (Criar Cobranca Asaas)] action in Row widget.
  ApiCallResponse? cobranca;
  // Stores action output result for [Backend Call - API (Obter QR Code)] action in Row widget.
  ApiCallResponse? pix;
  // Stores action output result for [Backend Call - Create Document] action in Row widget.
  TransacoesAsaasRecord? criaTransacaoAsaas;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
