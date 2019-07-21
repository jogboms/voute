import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:voute/constants/mk_colors.dart';
import 'package:voute/utils/mk_screen_util.dart';
import 'package:voute/utils/mk_sliver_separator_builder_delegate.dart';
import 'package:voute/utils/mk_theme.dart';
import 'package:voute/widgets/_partials/mk_app_bar_alt.dart';
import 'package:voute/widgets/_partials/mk_icon_button.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({Key key}) : super(key: key);

  @override
  _AccountsPageState createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
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
                return _AccountItem();
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

class _AccountItem extends StatelessWidget {
  const _AccountItem({
    Key key,
    @required this.theme,
  }) : super(key: key);

  final MkTheme theme;

  @override
  Widget build(BuildContext context) {
    final theme = MkTheme.of(context);
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
          height: sh(60),
          child: Row(
            children: <Widget>[
              SizedBox(width: sh(16)),
              Icon(
                FeatherIcons.instagram,
                size: ss(32),
                color: MkColors.light_grey,
              ),
              SizedBox(width: sh(16)),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "First Bank",
                      style: theme.body3Medium
                          .copyWith(color: MkColors.light_grey),
                    ),
                    Text(
                      "09152437489",
                      style: theme.subhead4Medium.copyWith(letterSpacing: 1.15),
                    ),
                  ],
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
