import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:rebloc/rebloc.dart';
import 'package:voute/constants/mk_routes.dart';
import 'package:voute/constants/mk_strings.dart';
import 'package:voute/rebloc/actions/common.dart';
import 'package:voute/rebloc/main.dart';
import 'package:voute/rebloc/states/app.dart';
import 'package:voute/screens/splash/splash_page.dart';
import 'package:voute/utils/mk_screen_util.dart';
import 'package:voute/widgets/_views/placeholder_view.dart';
import 'package:voute/widgets/_views/progress_hud_view.dart';
import 'package:voute/widgets/app_theme.dart';
import 'package:voute/widgets/bootstrap.dart';

class App extends StatefulWidget {
  App({@required this.bootstrap}) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  final BootstrapModel bootstrap;

  @override
  _AppState createState() => _AppState(bootstrap);
}

class _AppState extends State<App> {
  _AppState(this._bs) : store = reblocStore(user: _bs.user);

  final Store<AppState> store;
  final BootstrapModel _bs;

  final MkScreenUtilConfig screenConfig = const MkScreenUtilConfig(
    width: 412,
    height: 732,
    allowFontScaling: true,
  );

  @override
  void dispose() {
    store.dispatch(const OnDisposeAction());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      child: StoreProvider<AppState>(
        store: store,
        child: FirstBuildDispatcher<AppState>(
          // Initialize action
          action: const OnInitAction(),
          child: ProgressHudView(
            opacity: .9,
            child: Builder(
              builder: (BuildContext context) => MaterialApp(
                debugShowCheckedModeBanner: false,
                title: MkStrings.appName,
                color: Colors.white,
                theme: AppTheme.of(context).themeData(Theme.of(context)),
                builder: (_, child) => Builder(
                  builder: (BuildContext context) {
                    MkScreenUtil.initialize(context: context, config: screenConfig);
                    return child;
                  },
                ),
                onGenerateRoute: (RouteSettings settings) => _PageRoute<dynamic>(
                  settings: settings.copyWith(name: MkRoutes.start, isInitialRoute: true),
                  builder: (_) {
                    if (_bs.isTestMode) {
                      return const SizedBox();
                    }

                    return _bs.isRemembered ? const PlaceholderView() : SplashPage(isFirstTime: _bs.isFirstTime);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PageRoute<T> extends MaterialPageRoute<T> {
  _PageRoute({WidgetBuilder builder, RouteSettings settings}) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (settings.isInitialRoute) {
      return child;
    }

    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(0.0, 0.3), end: Offset.zero).animate(animation),
        child: child,
      ),
    );
  }
}
