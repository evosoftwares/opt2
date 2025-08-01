import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chamar_carro1_model.dart';
export 'chamar_carro1_model.dart';

class ChamarCarro1Widget extends StatefulWidget {
  const ChamarCarro1Widget({super.key});

  static String routeName = 'chamarCarro-1';
  static String routePath = 'chamarCarro1';

  @override
  State<ChamarCarro1Widget> createState() => _ChamarCarro1WidgetState();
}

class _ChamarCarro1WidgetState extends State<ChamarCarro1Widget> {
  late ChamarCarro1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChamarCarro1Model());

    _model.arValue = true;
    _model.animalValue = false;
    _model.portaMalaValue = false;
    _model.condominioValue = false;
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 52.0,
            icon: Icon(
              FFIcons.kback,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 22.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Solicitar uma viagem',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 16.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w500,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [
            Align(
              alignment: AlignmentDirectional(1.0, 0.0),
              child: Padding(
                padding: EdgeInsets.all(14.0),
                child: AuthUserStreamWidget(
                  builder: (context) => InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(PerfilWidget.routeName);
                    },
                    child: Hero(
                      tag: valueOrDefault<String>(
                        currentUserPhoto,
                        'https://i.pinimg.com/564x/4a/4a/78/4a4a784bb61946f71dce8d68942c4904.jpg',
                      ),
                      transitionOnUserGestures: true,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                        child: Image.network(
                          valueOrDefault<String>(
                            currentUserPhoto,
                            'https://i.pinimg.com/564x/4a/4a/78/4a4a784bb61946f71dce8d68942c4904.jpg',
                          ),
                          width: 30.0,
                          height: 30.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 15.0),
                    child: FlutterFlowPlacePicker(
                      iOSGoogleMapsApiKey:
                          'AIzaSyCoZBZ6RHxpq0EeKa4-UCkwSQrymtRacms',
                      androidGoogleMapsApiKey:
                          'AIzaSyCoZBZ6RHxpq0EeKa4-UCkwSQrymtRacms',
                      webGoogleMapsApiKey:
                          'AIzaSyCoZBZ6RHxpq0EeKa4-UCkwSQrymtRacms',
                      onSelect: (place) async {
                        safeSetState(
                            () => _model.placePickerOrigemValue = place);
                      },
                      defaultText: 'Selecione a partida',
                      icon: Icon(
                        Icons.place,
                        color: Color(0xFF3D3D3D),
                        size: 16.0,
                      ),
                      buttonOptions: FFButtonOptions(
                        width: 200.0,
                        height: 55.0,
                        color: Color(0xFFEEEEEE),
                        textAlign: TextAlign.center,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF343434),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                    child: FlutterFlowPlacePicker(
                      iOSGoogleMapsApiKey:
                          'AIzaSyCoZBZ6RHxpq0EeKa4-UCkwSQrymtRacms',
                      androidGoogleMapsApiKey:
                          'AIzaSyCoZBZ6RHxpq0EeKa4-UCkwSQrymtRacms',
                      webGoogleMapsApiKey:
                          'AIzaSyCoZBZ6RHxpq0EeKa4-UCkwSQrymtRacms',
                      onSelect: (place) async {
                        safeSetState(() => _model.placePickerValue = place);
                      },
                      defaultText: 'Selecione o destino',
                      icon: Icon(
                        Icons.place,
                        color: Color(0xFF3D3D3D),
                        size: 16.0,
                      ),
                      buttonOptions: FFButtonOptions(
                        width: 200.0,
                        height: 55.0,
                        color: Color(0xFFEEEEEE),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF343434),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                    child: FutureBuilder<List<CategoriasRow>>(
                      future: CategoriasTable().queryRows(
                        queryFn: (q) => q,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).secondary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<CategoriasRow>
                            dropDownCategoriasCategoriasRowList =
                            snapshot.data!;

                        return FlutterFlowDropDown<String>(
                          controller:
                              _model.dropDownCategoriasValueController ??=
                                  FormFieldController<String>(null),
                          options: dropDownCategoriasCategoriasRowList
                              .map((e) => e.nomeDaCategoria)
                              .toList(),
                          onChanged: (val) => safeSetState(
                              () => _model.dropDownCategoriasValue = val),
                          width: 300.0,
                          height: 56.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                          hintText: 'Escolha a categoria',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor: Color(0xFFEEEEEE),
                          elevation: 0.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 12.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isOverButton: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Precisa de ar-condicionado?',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.outfit(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).tertiary,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                      Switch.adaptive(
                        value: _model.arValue!,
                        onChanged: (newValue) async {
                          safeSetState(() => _model.arValue = newValue);
                        },
                        activeColor: Colors.black,
                        activeTrackColor: FlutterFlowTheme.of(context).info,
                        inactiveTrackColor: Color(0xFFBEBEBE),
                        inactiveThumbColor: Color(0xFF737373),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Precisa carregar pet?',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.outfit(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).tertiary,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                      Switch.adaptive(
                        value: _model.animalValue!,
                        onChanged: (newValue) async {
                          safeSetState(() => _model.animalValue = newValue);
                        },
                        activeColor: Colors.black,
                        activeTrackColor: FlutterFlowTheme.of(context).info,
                        inactiveTrackColor: Color(0x93BEBEBE),
                        inactiveThumbColor: Color(0xFF737373),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Precisa de porta-malas?',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.outfit(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).tertiary,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                      Switch.adaptive(
                        value: _model.portaMalaValue!,
                        onChanged: (newValue) async {
                          safeSetState(() => _model.portaMalaValue = newValue);
                        },
                        activeColor: Colors.black,
                        activeTrackColor: FlutterFlowTheme.of(context).info,
                        inactiveTrackColor: Color(0x93BEBEBE),
                        inactiveThumbColor: Color(0xFF737373),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Precisa que entre no condominio?',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).tertiary,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                        Switch.adaptive(
                          value: _model.condominioValue!,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.condominioValue = newValue);
                          },
                          activeColor: Colors.black,
                          activeTrackColor: FlutterFlowTheme.of(context).info,
                          inactiveTrackColor: Color(0x93BEBEBE),
                          inactiveThumbColor: Color(0xFF737373),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final firestoreBatch =
                            FirebaseFirestore.instance.batch();
                        try {
                          FFAppState().origem =
                              _model.placePickerOrigemValue.latLng;
                          FFAppState().destino = _model.placePickerValue.latLng;
                          FFAppState().update(() {});
                          _model.motoristas = await queryUsersRecordOnce(
                            queryBuilder: (usersRecord) => usersRecord
                                .where(
                                  'euSou',
                                  isEqualTo: EuSou.Motorista.serialize(),
                                )
                                .where(
                                  'minhaCategoria',
                                  isEqualTo: _model.dropDownCategoriasValue,
                                )
                                .where(
                                  'online',
                                  isEqualTo: true,
                                ),
                          );
                          _model.distancia = 5;
                          _model.indice = 0;
                          safeSetState(() {});
                          _model.saidaaction =
                              await actions.buscarMotoristasProximos(
                            _model.motoristas!.toList(),
                            _model.placePickerOrigemValue.latLng,
                            _model.distancia!.toDouble(),
                          );
                          _model.listaMotoristasProximos = _model.saidaaction!
                              .map((e) => e.reference)
                              .toList()
                              .cast<DocumentReference>();
                          safeSetState(() {});
                          _model.tamNMotoristas =
                              _model.listaMotoristasProximos.length;
                          safeSetState(() {});
                          while (((_model.listaMotoristasProximos.isNotEmpty) ==
                                  false) &&
                              (_model.distancia! <= 20)) {
                            _model.distancia = _model.distancia! + 5;
                            safeSetState(() {});
                            _model.saidaaction20 =
                                await actions.buscarMotoristasProximos(
                              _model.motoristas!.toList(),
                              _model.placePickerOrigemValue.latLng,
                              _model.distancia!.toDouble(),
                            );
                            _model.listaMotoristasProximos = _model
                                .saidaaction20!
                                .map((e) => e.reference)
                                .toList()
                                .cast<DocumentReference>();
                            safeSetState(() {});
                            _model.tamNMotoristas =
                                _model.listaMotoristasProximos.length;
                            safeSetState(() {});
                          }
                          _model.indice = 0;
                          safeSetState(() {});
                          _model.tamNMotoristas =
                              _model.listaMotoristasProximos.length;
                          safeSetState(() {});
                          if (_model.listaMotoristasProximos.length > 0) {
                            _model.viagem = await ViagensTable().insert({
                              'origem': functions.formatarLatLngParaString(
                                  _model.placePickerOrigemValue.latLng
                                      .toString()),
                              'destino': functions.formatarLatLngParaString(
                                  _model.placePickerValue.latLng.toString()),
                              'horarioOrigem':
                                  supaSerialize<DateTime>(getCurrentTimestamp),
                              'passageiroEmail': currentUserEmail,
                              'Categorias': _model.dropDownCategoriasValue,
                              'animal': _model.animalValue,
                              'portaMala': _model.portaMalaValue,
                              'arCondicionado': _model.arValue,
                              'entrarCondominio': _model.condominioValue,
                              'passageiroReference': currentUserReference?.id,
                              'enderecoOrigem':
                                  _model.placePickerOrigemValue.address,
                              'enderecoDestino':
                                  _model.placePickerValue.address,
                              'status': Status.Solicitado.name,
                            });

                            firestoreBatch.update(
                                currentUserReference!,
                                createUsersRecordData(
                                  idViagem: _model.viagem?.viagemid,
                                ));
                            while (_model.indice < _model.tamNMotoristas) {
                              _model.motoristasFiltrados =
                                  await queryUsersRecordOnce(
                                queryBuilder: (usersRecord) =>
                                    usersRecord.where(
                                  'uid',
                                  isEqualTo: _model.listaMotoristasProximos
                                      .elementAtOrNull(_model.indice)
                                      ?.id,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              if (_model.motoristasFiltrados!.idViagem <= 0) {
                                _model.addToListaMotoristaFiltrados(_model
                                    .listaMotoristasProximos.firstOrNull!);
                                safeSetState(() {});
                                FFAppState().addToMotoristasAguardando(_model
                                    .listaMotoristasProximos.firstOrNull!);
                                safeSetState(() {});
                              }
                              _model.indice = _model.indice + 1;
                              safeSetState(() {});
                            }
                            if (_model.listaMotoristaFiltrados.length > 0) {
                              context.pushNamed(
                                EscolhaMotoristaDescontinuadoWidget.routeName,
                                queryParameters: {
                                  'qualCorrida': serializeParam(
                                    _model.viagem,
                                    ParamType.SupabaseRow,
                                  ),
                                }.withoutNulls,
                              );
                            } else {
                              _model.deletada = await ViagensTable().delete(
                                matchingRows: (rows) => rows.eqOrNull(
                                  'viagemid',
                                  valueOrDefault(
                                      currentUserDocument?.idViagem, 0),
                                ),
                                returnRows: true,
                              );

                              firestoreBatch.update(currentUserReference!, {
                                ...mapToFirestore(
                                  {
                                    'idViagem': FieldValue.delete(),
                                  },
                                ),
                              });
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Motoristas não encontrados!'),
                                    content: Text(
                                        'Fizemos uma busca e infelizmente não encontramos nenhum motoristas disponível.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );

                              context.pushNamed(InicioClienteWidget.routeName);
                            }
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Motoristas não encontrados!'),
                                  content: Text(
                                      'Fizemos uma busca e infelizmente não encontramos nenhum motoristas disponível.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );

                            context.pushNamed(InicioClienteWidget.routeName);
                          }
                        } finally {
                          await firestoreBatch.commit();
                        }

                        safeSetState(() {});
                      },
                      text: 'Chamar',
                      options: FFButtonOptions(
                        height: 54.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 1.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
