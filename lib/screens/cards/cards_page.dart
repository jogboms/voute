import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:voute/constants/mk_colors.dart';
import 'package:voute/constants/mk_fonts.dart';
import 'package:voute/constants/mk_images.dart';
import 'package:voute/utils/mk_screen_util.dart';
import 'package:voute/utils/mk_sliver_separator_builder_delegate.dart';
import 'package:voute/utils/mk_theme.dart';
import 'package:voute/widgets/_partials/mk_app_bar_alt.dart';
import 'package:voute/widgets/_partials/mk_icon_button.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({Key key}) : super(key: key);

  @override
  _CardsPageState createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        MkSliverAppBarAlt(
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(FeatherIcons.search),
                    suffixIcon: MkIconButton(
                      icon: FeatherIcons.xCircle,
                      color: Colors.black12,
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              SizedBox(width: sw(16)),
              MkIconButton(
                icon: FeatherIcons.plus,
                fillColor: MkColors.dark.shade50,
                onPressed: () {},
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: sw(16), vertical: sh(16)),
          sliver: SliverList(
            delegate: MkSliverSeparatorBuilderDelegate(
              builder: (BuildContext context, int index) {
                return _CardItem(index: index);
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: sh(12));
              },
              childCount: 25,
            ),
          ),
        ),
      ],
    );
  }
}

class _CardItem extends StatelessWidget {
  const _CardItem({
    Key key,
    this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = MkTheme.of(context);
    return Material(
      elevation: 4,
      shadowColor: Colors.black12,
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          //
        },
        child: SizedBox(
          height: sh(180),
          child: Padding(
            padding: EdgeInsets.fromLTRB(sw(16), sh(8), sw(16), sh(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image(image: MkImages.cards[index % 3], width: sw(48)),
                    const Spacer(),
                    MkIconButton(
                      icon: FeatherIcons.moreHorizontal,
                      onPressed: () {
                        //
                      },
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  "First Bank",
                  style: theme.subhead3.copyWith(letterSpacing: 1.15),
                ),
                SizedBox(height: sh(16)),
                Text(
                  "**** **** **** 1234",
                  style: theme.subhead4Medium
                      .copyWith(letterSpacing: 1.5, fontFamily: MkFonts.ocr),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: sh(24)),
                Row(
                  children: <Widget>[
                    Text(
                      "* * *",
                      style: theme.subhead3Semi,
                    ),
                    const Spacer(),
                    Text(
                      "08/21",
                      style: theme.bodyMedium.copyWith(
                          letterSpacing: 1.25, fontFamily: MkFonts.ocr),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
