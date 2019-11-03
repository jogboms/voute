import 'package:flutter/widgets.dart';

class KeyboardWrapperView extends StatelessWidget {
  const KeyboardWrapperView({Key key, @required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: child,
    );
  }
}
