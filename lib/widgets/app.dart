import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:rebloc/rebloc.dart';
import 'package:voute/constants/mk_routes.dart';
import 'package:voute/constants/mk_strings.dart';
import 'package:voute/rebloc/actions/common.dart';
import 'package:voute/rebloc/main.dart';
import 'package:voute/rebloc/states/main.dart';
import 'package:voute/screens/splash/splash_page.dart';
import 'package:voute/utils/mk_navigate.dart';
import 'package:voute/utils/mk_screen_util.dart';
import 'package:voute/utils/mk_theme.dart';
import 'package:voute/widgets/_views/placeholder_view.dart';
import 'package:voute/widgets/_views/progress_hud_view.dart';
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
    return MkTheme(
      child: StoreProvider<AppState>(
        store: store,
        child: FirstBuildDispatcher<AppState>(
          // Initialize action
          action: const OnInitAction(),
          child: ProgressHudView(
            opacity: .9,
            child: Builder(
              builder: (BuildContext context) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: MkStrings.appName,
                  color: Colors.white,
                  theme: MkTheme.of(context).themeData(Theme.of(context)),
                  builder: (context, child) {
                    return Builder(
                      builder: (BuildContext context) {
                        MkScreenUtil.initialize(
                          context: context,
                          config: screenConfig,
                        );
                        return child;
                      },
                    );
                  },
                  onGenerateRoute: (RouteSettings settings) {
                    return MkNavigateRoute<dynamic>(
                      builder: (_) {
                        if (_bs.isTestMode) {
                          return const SizedBox();
                        }

                        return _bs.isRemembered
                            ? const PlaceholderView()
                            : SplashPage(isFirstTime: _bs.isFirstTime);
                      },
                      settings: settings.copyWith(
                        name: MkRoutes.start,
                        isInitialRoute: true,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
