import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'cartao_credito_widget.dart' show CartaoCreditoWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CartaoCreditoModel extends FlutterFlowModel<CartaoCreditoWidget> {
  ///  Local state fields for this page.

  String? dataMes;

  String? nomePrimeira;

  String? dataAno;

  String? nomeSobrenome;

  String? bandeira;

  dynamic jsonCompletoNome;

  String? statusPag;

  ///  State fields for stateful widgets in this page.

  // State field(s) for numCartao widget.
  FocusNode? numCartaoFocusNode;
  TextEditingController? numCartaoTextController;
  late MaskTextInputFormatter numCartaoMask;
  String? Function(BuildContext, String?)? numCartaoTextControllerValidator;
  // State field(s) for dataVal widget.
  FocusNode? dataValFocusNode;
  TextEditingController? dataValTextController;
  late MaskTextInputFormatter dataValMask;
  String? Function(BuildContext, String?)? dataValTextControllerValidator;
  // State field(s) for codigoSegurancaeld widget.
  FocusNode? codigoSegurancaeldFocusNode;
  TextEditingController? codigoSegurancaeldTextController;
  late MaskTextInputFormatter codigoSegurancaeldMask;
  String? Function(BuildContext, String?)?
      codigoSegurancaeldTextControllerValidator;
  // State field(s) for nomeCartao widget.
  FocusNode? nomeCartaoFocusNode;
  TextEditingController? nomeCartaoTextController;
  String? Function(BuildContext, String?)? nomeCartaoTextControllerValidator;
  // State field(s) for cpfCartao widget.
  FocusNode? cpfCartaoFocusNode;
  TextEditingController? cpfCartaoTextController;
  String? Function(BuildContext, String?)? cpfCartaoTextControllerValidator;
  // State field(s) for parcelas widget.
  int? parcelasValue;
  FormFieldController<int>? parcelasValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController8;
  late MaskTextInputFormatter textFieldMask3;
  String? Function(BuildContext, String?)? textController8Validator;
  // Stores action output result for [Backend Call - API (Criar Cliente Asaas)] action in Button widget.
  ApiCallResponse? cliente;
  // Stores action output result for [Backend Call - API (Criar Cobranca Asaas)] action in Button widget.
  ApiCallResponse? cobranca;
  // Stores action output result for [Backend Call - API (Checa Status Cobranca)] action in Button widget.
  ApiCallResponse? status;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    numCartaoFocusNode?.dispose();
    numCartaoTextController?.dispose();

    dataValFocusNode?.dispose();
    dataValTextController?.dispose();

    codigoSegurancaeldFocusNode?.dispose();
    codigoSegurancaeldTextController?.dispose();

    nomeCartaoFocusNode?.dispose();
    nomeCartaoTextController?.dispose();

    cpfCartaoFocusNode?.dispose();
    cpfCartaoTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController6?.dispose();

    textFieldFocusNode2?.dispose();
    textController7?.dispose();

    textFieldFocusNode3?.dispose();
    textController8?.dispose();
  }
}
