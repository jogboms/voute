import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MkNavigate {
  static CupertinoPageRoute slideIn<T>(
    Widget widget, {
    String name,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    PageRoute hostRoute,
  }) {
    final _settings = name != null ? RouteSettings(name: name) : settings;
    return CupertinoPageRoute<T>(
      builder: (BuildContext context) => widget,
      settings: _settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
    );
  }

  static Route<T> fadeIn<T>(
    Widget widget, {
    String name,
    RouteSettings settings,
    bool maintainState = true,
  }) {
    final _settings = name != null ? RouteSettings(name: name) : settings;
    return PageRouteBuilder<T>(
      opaque: false,
      pageBuilder: (_, __, ___) => widget,
      transitionsBuilder: (_, Animation<double> animation, __, Widget child) =>
          FadeTransition(opacity: animation, child: child),
      settings: _settings,
      maintainState: maintainState,
    );
  }
}
