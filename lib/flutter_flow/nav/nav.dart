import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? BemvindoWidget() : LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? BemvindoWidget() : LoginWidget(),
          routes: [
            FFRoute(
              name: EscolhaMotoristaWidget.routeName,
              path: EscolhaMotoristaWidget.routePath,
              builder: (context, params) => EscolhaMotoristaWidget(
                qualCorrida: params.getParam<ViagensRow>(
                  'qualCorrida',
                  ParamType.SupabaseRow,
                ),
              ),
            ),
            FFRoute(
              name: DetalhesCorridaClienteWidget.routeName,
              path: DetalhesCorridaClienteWidget.routePath,
              builder: (context, params) => DetalhesCorridaClienteWidget(
                qualCorrida: params.getParam<ViagensRow>(
                  'qualCorrida',
                  ParamType.SupabaseRow,
                ),
                motoristaId: params.getParam(
                  'motoristaId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ChamarCarro1Widget.routeName,
              path: ChamarCarro1Widget.routePath,
              builder: (context, params) => ChamarCarro1Widget(),
            ),
            FFRoute(
              name: PerfilWidget.routeName,
              path: PerfilWidget.routePath,
              builder: (context, params) => PerfilWidget(),
            ),
            FFRoute(
              name: ProfileChangePasswordWidget.routeName,
              path: ProfileChangePasswordWidget.routePath,
              builder: (context, params) => ProfileChangePasswordWidget(),
            ),
            FFRoute(
              name: LoginWidget.routeName,
              path: LoginWidget.routePath,
              builder: (context, params) => LoginWidget(),
            ),
            FFRoute(
              name: CarteiraWidget.routeName,
              path: CarteiraWidget.routePath,
              builder: (context, params) => CarteiraWidget(),
            ),
            FFRoute(
              name: PrincipalWidget.routeName,
              path: PrincipalWidget.routePath,
              builder: (context, params) => PrincipalWidget(),
            ),
            FFRoute(
              name: FotoCNHWidget.routeName,
              path: FotoCNHWidget.routePath,
              builder: (context, params) => FotoCNHWidget(),
            ),
            FFRoute(
              name: FotoCRLVWidget.routeName,
              path: FotoCRLVWidget.routePath,
              builder: (context, params) => FotoCRLVWidget(),
            ),
            FFRoute(
              name: SucessoPagamentoWidget.routeName,
              path: SucessoPagamentoWidget.routePath,
              builder: (context, params) => SucessoPagamentoWidget(
                supaPagamento: params.getParam<PagamentosRow>(
                  'supaPagamento',
                  ParamType.SupabaseRow,
                ),
              ),
            ),
            FFRoute(
              name: EuSouWidget.routeName,
              path: EuSouWidget.routePath,
              builder: (context, params) => EuSouWidget(),
            ),
            FFRoute(
              name: CorridasWidget.routeName,
              path: CorridasWidget.routePath,
              builder: (context, params) => CorridasWidget(),
            ),
            FFRoute(
              name: FotoPerfilWidget.routeName,
              path: FotoPerfilWidget.routePath,
              builder: (context, params) => FotoPerfilWidget(),
            ),
            FFRoute(
              name: CategoriaWidget.routeName,
              path: CategoriaWidget.routePath,
              builder: (context, params) => CategoriaWidget(),
            ),
            FFRoute(
              name: MeusDadosWidget.routeName,
              path: MeusDadosWidget.routePath,
              builder: (context, params) => MeusDadosWidget(),
            ),
            FFRoute(
              name: MinhaOfertaWidget.routeName,
              path: MinhaOfertaWidget.routePath,
              builder: (context, params) => MinhaOfertaWidget(),
            ),
            FFRoute(
              name: InicioClienteWidget.routeName,
              path: InicioClienteWidget.routePath,
              builder: (context, params) => InicioClienteWidget(),
            ),
            FFRoute(
              name: BemvindoWidget.routeName,
              path: BemvindoWidget.routePath,
              builder: (context, params) => BemvindoWidget(),
            ),
            FFRoute(
              name: FotoCarroWidget.routeName,
              path: FotoCarroWidget.routePath,
              builder: (context, params) => FotoCarroWidget(),
            ),
            FFRoute(
              name: DetalhesCorridaMotoristaWidget.routeName,
              path: DetalhesCorridaMotoristaWidget.routePath,
              builder: (context, params) => DetalhesCorridaMotoristaWidget(
                qualCorrida: params.getParam<ViagensRow>(
                  'qualCorrida',
                  ParamType.SupabaseRow,
                ),
              ),
            ),
            FFRoute(
              name: EscolhaMotoristaDescontinuadoWidget.routeName,
              path: EscolhaMotoristaDescontinuadoWidget.routePath,
              builder: (context, params) => EscolhaMotoristaDescontinuadoWidget(
                qualCorrida: params.getParam<ViagensRow>(
                  'qualCorrida',
                  ParamType.SupabaseRow,
                ),
              ),
            ),
            FFRoute(
              name: PerfilDetalhesWidget.routeName,
              path: PerfilDetalhesWidget.routePath,
              builder: (context, params) => PerfilDetalhesWidget(
                deQuemEh: params.getParam(
                  'deQuemEh',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: MeuCarroWidget.routeName,
              path: MeuCarroWidget.routePath,
              builder: (context, params) => MeuCarroWidget(),
            ),
            FFRoute(
              name: DadosVeiculoWidget.routeName,
              path: DadosVeiculoWidget.routePath,
              builder: (context, params) => DadosVeiculoWidget(),
            ),
            FFRoute(
              name: AlterarVeiculoWidget.routeName,
              path: AlterarVeiculoWidget.routePath,
              builder: (context, params) => AlterarVeiculoWidget(),
            ),
            FFRoute(
              name: ContabancariaWidget.routeName,
              path: ContabancariaWidget.routePath,
              builder: (context, params) => ContabancariaWidget(),
            ),
            FFRoute(
              name: SolicitarSaqueWidget.routeName,
              path: SolicitarSaqueWidget.routePath,
              builder: (context, params) => SolicitarSaqueWidget(),
            ),
            FFRoute(
              name: AdicionarCreditosWidget.routeName,
              path: AdicionarCreditosWidget.routePath,
              builder: (context, params) => AdicionarCreditosWidget(
                valorEsperado: params.getParam(
                  'valorEsperado',
                  ParamType.double,
                ),
              ),
            ),
            FFRoute(
              name: PixWidget.routeName,
              path: PixWidget.routePath,
              builder: (context, params) => PixWidget(
                valor: params.getParam(
                  'valor',
                  ParamType.double,
                ),
                codigoQR: params.getParam(
                  'codigoQR',
                  ParamType.JSON,
                ),
                id: params.getParam(
                  'id',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ConversasWidget.routeName,
              path: ConversasWidget.routePath,
              builder: (context, params) => ConversasWidget(),
            ),
            FFRoute(
              name: ChatAbertoWidget.routeName,
              path: ChatAbertoWidget.routePath,
              builder: (context, params) => ChatAbertoWidget(
                comQuem: params.getParam(
                  'comQuem',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
                conversa: params.getParam(
                  'conversa',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Conversas'],
                ),
              ),
            ),
            FFRoute(
              name: CartaoCreditoWidget.routeName,
              path: CartaoCreditoWidget.routePath,
              builder: (context, params) => CartaoCreditoWidget(
                valor: params.getParam(
                  'valor',
                  ParamType.double,
                ),
                ipEndereco: params.getParam(
                  'ipEndereco',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: MeusSaquesWidget.routeName,
              path: MeusSaquesWidget.routePath,
              builder: (context, params) => MeusSaquesWidget(),
            ),
            FFRoute(
              name: CriarNotificacaoWidget.routeName,
              path: CriarNotificacaoWidget.routePath,
              builder: (context, params) => CriarNotificacaoWidget(),
            ),
            FFRoute(
              name: InicioGestorWidget.routeName,
              path: InicioGestorWidget.routePath,
              builder: (context, params) => InicioGestorWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.white,
                  child: Center(
                    child: Image.asset(
                      'assets/images/Option_Brasil_PDF.pdf.png',
                      width: 222.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
