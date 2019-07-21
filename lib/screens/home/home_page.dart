import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:voute/constants/mk_colors.dart';
import 'package:voute/screens/cards/_partials/card_item.dart';
import 'package:voute/utils/mk_screen_util.dart';
import 'package:voute/widgets/_partials/mk_app_bar_alt.dart';
import 'package:voute/widgets/_partials/mk_icon_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                icon: FeatherIcons.user,
                fillColor: MkColors.dark.shade50,
                onPressed: () {},
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: sh(16)),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: sh(kCardItemHeight),
                  child: Swiper(
                    viewportFraction: 0.825,
                    scale: .85,
                    itemBuilder: (BuildContext context, int index) {
                      return CardItem(
                        index: index,
                        elevation: 16,
                        type: CardItemType.gradient,
                      );
                    },
                    itemCount: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
