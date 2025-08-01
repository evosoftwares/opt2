import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'perfil_detalhes_widget.dart' show PerfilDetalhesWidget;
import 'package:flutter/material.dart';

class PerfilDetalhesModel extends FlutterFlowModel<PerfilDetalhesWidget> {
  ///  Local state fields for this page.

  int? nAvaliacoes;

  double? media;

  double? totalAvaliacao;

  int? indice;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in perfilDetalhes widget.
  UsersRecord? motorista;
  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
