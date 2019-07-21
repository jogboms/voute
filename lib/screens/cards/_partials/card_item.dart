import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:voute/constants/mk_colors.dart';
import 'package:voute/constants/mk_fonts.dart';
import 'package:voute/constants/mk_images.dart';
import 'package:voute/utils/mk_linear_gradient.dart';
import 'package:voute/utils/mk_screen_util.dart';
import 'package:voute/utils/mk_theme.dart';
import 'package:voute/widgets/_partials/mk_icon_button.dart';

const double kCardItemHeight = 180.0;

class CardItem extends StatelessWidget {
  const CardItem({
    Key key,
    this.index,
    this.elevation = 4,
    this.type = CardItemType.plain,
  }) : super(key: key);

  final int index;
  final double elevation;
  final CardItemType type;

  @override
  Widget build(BuildContext context) {
    final child = _buildContent(context);

    return Material(
      elevation: elevation,
      shadowColor: Colors.black26,
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          //
        },
        child: SizedBox(
          height: sh(kCardItemHeight),
          child: type == CardItemType.gradient
              ? DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: MkLinearGradient(),
                  ),
                  child: child,
                )
              : child,
        ),
      ),
    );
  }

  Padding _buildContent(BuildContext context) {
    final theme = MkTheme.of(context);
    final color = type == CardItemType.gradient ? Colors.white : MkColors.dark;
    final icon = MkImages.cards[index % 3];
    final size = sw(48);

    return Padding(
      padding: EdgeInsets.fromLTRB(sw(16), sh(8), sw(16), sh(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              type == CardItemType.gradient
                  ? ImageIcon(icon, color: color, size: size)
                  : Image(image: icon, width: size),
              const Spacer(),
              MkIconButton(
                icon: FeatherIcons.moreHorizontal,
                color: color,
                onPressed: () {
                  //
                },
              ),
            ],
          ),
          const Spacer(),
          Text(
            "First Bank",
            style: theme.subhead3.copyWith(letterSpacing: 1.15, color: color),
          ),
          SizedBox(height: sh(16)),
          Text(
            "**** **** **** 1234",
            style: theme.subhead4Medium.copyWith(
                letterSpacing: 1.5, fontFamily: MkFonts.ocr, color: color),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: sh(24)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "* * *",
                style: theme.subhead3Semi.copyWith(color: color),
              ),
              Text(
                "08/21",
                style: theme.bodyMedium.copyWith(
                    letterSpacing: 1.25, fontFamily: MkFonts.ocr, color: color),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

enum CardItemType {
  plain,
  gradient,
}
