import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rebloc/rebloc.dart';
import 'package:voute/constants/mk_colors.dart';
import 'package:voute/constants/mk_strings.dart';
import 'package:voute/constants/mk_style.dart';
import 'package:voute/rebloc/actions/bootstrap.dart';
import 'package:voute/rebloc/states/main.dart';
import 'package:voute/rebloc/view_models/bootstrap.dart';
import 'package:voute/utils/mk_screen_util.dart';
import 'package:voute/utils/mk_status_bar.dart';
import 'package:voute/widgets/_partials/mk_clear_button.dart';
import 'package:voute/widgets/_partials/mk_loading_spinner.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({
    Key key,
    this.isFirstTime = false,
  }) : super(key: key);

  // TODO: can do more with this
  final bool isFirstTime;

  @override
  Widget build(BuildContext context) {
    return MkStatusBar(
      brightness: Brightness.light,
      child: Scaffold(
        body: const _MainView(),
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
          return SafeArea(
            top: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: sw(48)),
                  child: Text(
                    MkStrings.genericError(viewModel.error),
                    style: mkFontMedium(14, Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: sh(16)),
                MkClearButton(
                  child: const Text("RETRY"),
                  color: Colors.white70,
                  onPressed: () {
                    dispatcher(const BootstrapAsyncInitAction());
                  },
                ),
                SizedBox(height: sh(24)),
              ],
            ),
          );
        }

        if (viewModel.isLoading || viewModel.config == null) {
          return Positioned.fill(
            top: null,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.only(bottom: sh(64)),
                child: MkLoadingSpinner(
                  color: MkColors.smokey,
                ),
              ),
            ),
          );
        }

        return Center(
          child: const FlutterLogo(),
        );
      },
    );
  }
}
