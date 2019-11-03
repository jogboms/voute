import 'package:flutter/widgets.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:voute/widgets/_dialogs/error_message_dialog.dart';
import 'package:voute/widgets/_dialogs/success_message_dialog.dart';
import 'package:voute/widgets/_partials/mk_loading_spinner.dart';

const Duration _kDuration = Duration(milliseconds: 3000);

class ProgressHudView extends StatelessWidget {
  const ProgressHudView({
    Key key,
    @required this.child,
    this.opacity = 0.3,
    this.backgroundColor = const Color(0xAA000000),
    this.color = const Color(0xAAFFFFFF),
  })  : assert(child != null),
        assert(opacity != null),
        super(key: key);

  final Widget child;
  final double opacity;
  final Color backgroundColor;
  final Color color;

  static _ProgressHudViewState of(BuildContext context) {
    final config = Provider.of<_Config>(context);
    return _ProgressHudViewState(
      context,
      opacity: config.opacity,
      backgroundColor: config.backgroundColor,
      color: config.color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Provider<_Config>.value(
      child: child,
      value: _Config(
        opacity: opacity,
        backgroundColor: backgroundColor,
        color: color,
      ),
    );
  }
}

class _ProgressHudViewState {
  _ProgressHudViewState(
    this._context, {
    @required this.opacity,
    @required this.backgroundColor,
    @required this.color,
  });

  final BuildContext _context;
  final double opacity;
  final Color backgroundColor;
  final Color color;

  final _key = ValueKey("p_h_v");

  void show() {
    showOverlay(
      _context,
      (context, _) {
        return _BackdropWrapper(
          backgroundColor: backgroundColor,
          opacity: opacity,
          child: MkLoadingSpinner(size: 32, color: color),
        );
      },
      duration: Duration.zero,
      key: _key,
    );
  }

  void hide() => showOverlay(_context, (_, v) => const SizedBox(), key: _key);

  void success([String message, Duration duration]) async {
    showOverlay(
      _context,
      (context, _) {
        return _BackdropWrapper(
          child: SuccessMessageDialog(message: message),
          backgroundColor: backgroundColor,
          opacity: opacity,
        );
      },
      duration: duration ?? _kDuration,
      key: _key,
    );
  }

  void error(dynamic e, [Duration duration]) async {
    showOverlay(
      _context,
      (context, _) {
        return _BackdropWrapper(
          child: ErrorMessageDialog(error: e),
          backgroundColor: backgroundColor,
          opacity: opacity,
        );
      },
      duration: duration ?? _kDuration,
      key: _key,
    );
  }
}

class _BackdropWrapper extends StatelessWidget {
  const _BackdropWrapper({
    Key key,
    @required this.child,
    @required this.opacity,
    @required this.backgroundColor,
  }) : super(key: key);

  final Widget child;
  final double opacity;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedOpacity(
          opacity: opacity,
          child: ModalBarrier(
            dismissible: false,
            color: backgroundColor,
          ),
          duration: const Duration(milliseconds: 350),
        ),
        child,
      ],
    );
  }
}

class _Config {
  _Config({
    @required this.opacity,
    @required this.backgroundColor,
    @required this.color,
  });

  final double opacity;
  final Color backgroundColor;
  final Color color;
}
