import 'package:flutter/widgets.dart';

typedef MkTypedWidgetBuilder<T> = Widget Function(BuildContext context, T data);

typedef MkTypedWidgetBuilder2<T, U> = Widget Function(BuildContext context, T data, U extra);
