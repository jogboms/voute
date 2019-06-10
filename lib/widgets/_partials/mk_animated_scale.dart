import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MkAnimatedScale extends ImplicitlyAnimatedWidget {
  /// Creates a widget that animates its scale implicitly.
  ///
  /// The [scale] argument must not be null and must be between 0.0 and 1.0,
  /// inclusive. The [curve] and [duration] arguments must not be null.
  const MkAnimatedScale({
    Key key,
    this.child,
    @required this.scale,
    Curve curve = Curves.linear,
    @required Duration duration,
  })  : assert(scale != null && scale >= 0.0 && scale <= 1.0),
        super(key: key, curve: curve, duration: duration);

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  /// The target scale.
  ///
  /// An scale of 1.0 is fully sized. An scale of 0.0 is sized at zero
  /// (i.e., invisible).
  ///
  /// The scale must not be null.
  final double scale;

  @override
  _AnimatedScaleState createState() => _AnimatedScaleState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('scale', scale));
  }
}

class _AnimatedScaleState
    extends ImplicitlyAnimatedWidgetState<MkAnimatedScale> {
  Tween<double> _scale;
  Animation<double> _scaleAnimation;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _scale = visitor(
        _scale, widget.scale, (dynamic value) => Tween<double>(begin: value));
  }

  @override
  void didUpdateTweens() {
    _scaleAnimation = animation.drive(_scale);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: widget.child,
    );
  }
}
