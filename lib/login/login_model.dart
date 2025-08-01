import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  Local state fields for this page.

  dynamic latlng;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for nomeCompleto widget.
  FocusNode? nomeCompletoFocusNode;
  TextEditingController? nomeCompletoTextController;
  String? Function(BuildContext, String?)? nomeCompletoTextControllerValidator;
  // State field(s) for inputtelefone widget.
  FocusNode? inputtelefoneFocusNode;
  TextEditingController? inputtelefoneTextController;
  late MaskTextInputFormatter inputtelefoneMask;
  String? Function(BuildContext, String?)? inputtelefoneTextControllerValidator;
  // State field(s) for inputcpf widget.
  FocusNode? inputcpfFocusNode;
  TextEditingController? inputcpfTextController;
  late MaskTextInputFormatter inputcpfMask;
  String? Function(BuildContext, String?)? inputcpfTextControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for confirmPassword widget.
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordTextController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordTextControllerValidator;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // Stores action output result for [Backend Call - API (google convert geocode)] action in Button widget.
  ApiCallResponse? apiResultado;
  // State field(s) for emailAddressLogin widget.
  FocusNode? emailAddressLoginFocusNode;
  TextEditingController? emailAddressLoginTextController;
  String? Function(BuildContext, String?)?
      emailAddressLoginTextControllerValidator;
  // State field(s) for passwordLogin widget.
  FocusNode? passwordLoginFocusNode;
  TextEditingController? passwordLoginTextController;
  late bool passwordLoginVisibility;
  String? Function(BuildContext, String?)? passwordLoginTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    confirmPasswordVisibility = false;
    passwordLoginVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    nomeCompletoFocusNode?.dispose();
    nomeCompletoTextController?.dispose();

    inputtelefoneFocusNode?.dispose();
    inputtelefoneTextController?.dispose();

    inputcpfFocusNode?.dispose();
    inputcpfTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordTextController?.dispose();

    emailAddressLoginFocusNode?.dispose();
    emailAddressLoginTextController?.dispose();

    passwordLoginFocusNode?.dispose();
    passwordLoginTextController?.dispose();
  }
}
