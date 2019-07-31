import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:voute/constants/mk_colors.dart';
import 'package:voute/screens/people/_partials/person_item.dart';
import 'package:voute/utils/mk_screen_util.dart';
import 'package:voute/utils/mk_sliver_separator_builder_delegate.dart';
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
          child: MkSearchBarRow(
            trailing: MkIconButton(
              icon: FeatherIcons.plus,
              fillColor: MkColors.dark.shade50,
              onPressed: () {},
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: sw(16), vertical: sh(16)),
          sliver: SliverList(
            delegate: MkSliverSeparatorBuilderDelegate(
              builder: (BuildContext context, int index) {
                return PersonItem();
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
