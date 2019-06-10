import 'package:flutter/widgets.dart';

class FixedHeightScrollView extends StatelessWidget {
  const FixedHeightScrollView({
    Key key,
    @required this.child,
    this.padding,
    this.physics,
  })  : assert(child != null),
        super(key: key);

  final EdgeInsets padding;
  final Widget child;
  final BouncingScrollPhysics physics;

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraint) {
        return SingleChildScrollView(
          physics: physics ?? BouncingScrollPhysics(),
          padding: padding ?? EdgeInsets.zero,
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(
              Size.fromHeight(
                constraint.biggest.longestSide +
                    _media.viewInsets.bottom -
                    padding.vertical,
              ),
            ),
            child: child,
          ),
        );
      },
    );
  }
}
