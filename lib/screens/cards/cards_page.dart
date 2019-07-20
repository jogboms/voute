import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:voute/constants/mk_colors.dart';
import 'package:voute/utils/mk_screen_util.dart';
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
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, i) {
              return Material(
                color: Colors.green,
                child: SizedBox(
                  height: 32,
                ),
              );
            },
            childCount: 25,
          ),
        ),
      ],
    );
  }
}