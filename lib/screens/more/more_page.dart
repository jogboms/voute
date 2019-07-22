import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:voute/constants/mk_style.dart';
import 'package:voute/utils/mk_screen_util.dart';
import 'package:voute/utils/mk_sliver_separator_builder_delegate.dart';
import 'package:voute/utils/mk_theme.dart';
import 'package:voute/widgets/_partials/mk_app_bar_alt.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key key}) : super(key: key);

  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        MkSliverAppBarAlt(
          child: SizedBox(
            height: sh(kBaseAppBarHeight),
            child: Center(
              child: Text("More", style: MkTheme.of(context).subhead4Medium),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: sw(16), vertical: sh(16)),
          sliver: SliverList(
            delegate: MkSliverSeparatorBuilderDelegate(
              builder: (BuildContext context, int index) {
                return _MenuItem();
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: sh(12));
              },
              childCount: 4,
            ),
          ),
        ),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = MkTheme.of(context);

    return Material(
      elevation: 4,
      shadowColor: Colors.black12,
      borderRadius: BorderRadius.circular(4),
      clipBehavior: Clip.hardEdge,
      child: ListTile(
        onTap: () {
          //
        },
        leading: Icon(FeatherIcons.plusSquare),
        title: Text(
          "Item",
          style: theme.subhead3Semi,
        ),
      ),
    );
  }
}
