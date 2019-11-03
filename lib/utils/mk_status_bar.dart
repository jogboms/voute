import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class MkStatusBar extends StatelessWidget {
  const MkStatusBar({
    Key key,
    this.brightness = Brightness.dark,
    @required this.child,
  }) : super(key: key);

  const MkStatusBar.dark({
    @required this.child,
  }) : brightness = Brightness.dark;

  const MkStatusBar.light({
    @required this.child,
  }) : brightness = Brightness.light;

  final Widget child;
  final Brightness brightness;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: brightness == Brightness.dark ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
      child: child,
    );
  }
}
