import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rebloc/rebloc.dart';
import 'package:voute/constants/mk_colors.dart';
import 'package:voute/constants/mk_images.dart';
import 'package:voute/constants/mk_strings.dart';
import 'package:voute/constants/mk_style.dart';
import 'package:voute/rebloc/actions/bootstrap.dart';
import 'package:voute/rebloc/states/main.dart';
import 'package:voute/rebloc/view_models/bootstrap.dart';
import 'package:voute/screens/home/home_page.dart';
import 'package:voute/utils/mk_linear_gradient.dart';
import 'package:voute/utils/mk_navigate.dart';
import 'package:voute/utils/mk_screen_util.dart';
import 'package:voute/utils/mk_settings.dart';
import 'package:voute/utils/mk_status_bar.dart';
import 'package:voute/utils/mk_theme.dart';
import 'package:voute/widgets/_partials/mk_loading_spinner.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({
    Key key,
    this.isFirstTime = false,
  }) : super(key: key);

  final bool isFirstTime;

  @override
  Widget build(BuildContext context) {
    final MkTheme theme = MkTheme.of(context);
    return MkStatusBar(
      brightness: Brightness.light,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: const MkLinearGradient(),
              ),
            ),
            Center(
              child: Image(image: MkImages.logo),
            ),
            Positioned.fill(
              top: null,
              bottom: MediaQuery.of(context).padding.bottom + sh(24.0),
              child: Column(
                children: <Widget>[
                  const _MainView(),
                  SizedBox(height: sh(24)),
                  Text(
                    "VOÛTE",
                    style: theme.title
                        .copyWith(color: Colors.white, letterSpacing: 6),
                  ),
                  SizedBox(height: sh(2)),
                  Text(
                    MkSettings.getVersion(),
                    style: theme.xxsmall.copyWith(
                      color: Colors.white.withOpacity(.69),
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MainView extends StatelessWidget {
  const _MainView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelSubscriber<AppState, BootstrapViewModel>(
      converter: (AppState state) => BootstrapViewModel(state),
      builder: (
        BuildContext context,
        DispatchFunction dispatcher,
        BootstrapViewModel viewModel,
      ) {
        if (viewModel.hasError) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: sw(48)),
            child: GestureDetector(
              onTap: () {
                dispatcher(const BootstrapAsyncInitAction());
              },
              child: Text(
                MkStrings.genericError(viewModel.error) + "\n Tap to retry.",
                style: mkFont(14, Colors.white.withOpacity(.75)),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        if (viewModel.isLoading || viewModel.config == null) {
          return MkLoadingSpinner(
            color: MkColors.white.withOpacity(.5),
          );
        }

        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushAndRemoveUntil<void>(
            MkNavigate.fadeIn(HomePage()),
            (_) => true,
          );
        });

        return const SizedBox();
      },
    );
  }
}
