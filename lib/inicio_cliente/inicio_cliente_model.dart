import '/components/avaliacao_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'inicio_cliente_widget.dart' show InicioClienteWidget;
import 'package:flutter/material.dart';

class InicioClienteModel extends FlutterFlowModel<InicioClienteWidget> {
  ///  Local state fields for this page.

  bool avalie = false;

  ///  State fields for stateful widgets in this page.

  // Model for avaliacao component.
  late AvaliacaoModel avaliacaoModel;

  @override
  void initState(BuildContext context) {
    avaliacaoModel = createModel(context, () => AvaliacaoModel());
  }

  @override
  void dispose() {
    avaliacaoModel.dispose();
  }
}
