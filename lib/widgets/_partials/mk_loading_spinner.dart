import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MkLoadingSpinner extends StatelessWidget {
  const MkLoadingSpinner({Key key, this.color, this.size}) : super(key: key);

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      size: size ?? 32.0,
      itemBuilder: (_, int i) => color != null ? _box(color) : _box(Colors.black12),
    );
  }

  Widget _box(Color color) => DecoratedBox(decoration: BoxDecoration(color: color, shape: BoxShape.circle));
}
