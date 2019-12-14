import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:voute/constants/mk_colors.dart';
import 'package:voute/utils/mk_screen_util.dart';
import 'package:voute/utils/ui/sliver_separator_builder_delegate.dart';
import 'package:voute/widgets/_partials/mk_app_bar_alt.dart';
import 'package:voute/widgets/_partials/mk_icon_button.dart';
import 'package:voute/widgets/app_theme.dart';

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
            delegate: SliverSeparatorBuilderDelegate(
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
  const _AccountItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Material(
      elevation: 4,
      shadowColor: Colors.black12,
      borderRadius: BorderRadius.circular(4),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          height: sh(60),
          child: Row(
            children: <Widget>[
              SizedBox(width: sh(16)),
              Icon(FeatherIcons.instagram, size: ss(32), color: MkColors.light_grey),
              SizedBox(width: sh(16)),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "First Bank",
                      style: theme.body3Medium.copyWith(color: MkColors.light_grey),
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
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
