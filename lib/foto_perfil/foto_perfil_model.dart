import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'foto_perfil_widget.dart' show FotoPerfilWidget;
import 'package:flutter/material.dart';

class FotoPerfilModel extends FlutterFlowModel<FotoPerfilWidget> {
  ///  Local state fields for this page.

  String? linkFoto;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadFotoPerfil = false;
  FFUploadedFile uploadedLocalFile_uploadFotoPerfil =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadFotoPerfil = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
