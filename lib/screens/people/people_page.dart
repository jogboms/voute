import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:voute/constants/mk_colors.dart';
import 'package:voute/utils/mk_screen_util.dart';
import 'package:voute/utils/mk_sliver_separator_builder_delegate.dart';
import 'package:voute/utils/mk_theme.dart';
import 'package:voute/widgets/_partials/mk_app_bar_alt.dart';
import 'package:voute/widgets/_partials/mk_icon_button.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({Key key}) : super(key: key);

  @override
  _PeoplePageState createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
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
                return _PersonItem();
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

class _PersonItem extends StatelessWidget {
  const _PersonItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      shadowColor: Colors.black12,
      borderRadius: BorderRadius.circular(4),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          //
        },
        child: SizedBox(
          height: sh(48),
          child: Row(
            children: <Widget>[
              SizedBox(width: sh(16)),
              CircleAvatar(
                child: Text("A"),
              ),
              SizedBox(width: sh(16)),
              Expanded(
                child: Text(
                  "Agbeke",
                  style: MkTheme.of(context).subhead1Medium,
                ),
              ),
              MkIconButton(
                icon: FeatherIcons.moreHorizontal,
                onPressed: () {
                  //
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
