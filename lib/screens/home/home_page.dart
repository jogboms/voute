import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:voute/constants/mk_colors.dart';
import 'package:voute/screens/cards/_partials/card_item.dart';
import 'package:voute/screens/dashboard/dashboard_page.dart';
import 'package:voute/screens/people/_partials/person_item.dart';
import 'package:voute/utils/mk_screen_util.dart';
import 'package:voute/utils/mk_theme.dart';
import 'package:voute/widgets/_partials/mk_app_bar_alt.dart';
import 'package:voute/widgets/_partials/mk_clear_button.dart';
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
        // Intentional: there is a bug after switch between other tabs
        // and then coming back to home
//        SliverToBoxAdapter(child: Container()),
        MkSliverAppBarAlt(
          child: MkSearchBarRow(
            trailing: MkIconButton(
              icon: FeatherIcons.user,
              fillColor: MkColors.dark.shade50,
              onPressed: () {},
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: sh(16)),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: sh(cardItemHeight) + _cardShadowOffset,
                  child: Swiper(
                    viewportFraction: 0.825,
                    scale: .85,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: _cardShadowOffset),
                        child: CardItem(
                          index: index,
                          elevation: 16,
                          type: CardItemType.gradient,
                        ),
                      );
                    },
                    itemCount: 15,
                  ),
                ),
                SizedBox(height: sh(6)),
                _TitleContentBlock(
                  title: "FAVORITE PEOPLE",
                  onTap: () => DashboardPage.of(context).goToTab(3),
                  child: Column(
                    children: <Widget>[
                      PersonItem(),
                      SizedBox(height: sh(8)),
                      PersonItem(),
                      SizedBox(height: sh(8)),
                      PersonItem(),
                    ],
                  ),
                ),
                SizedBox(height: sh(24)),
                _TitleContentBlock(
                  title: "FAVORITE BANKS",
                  onTap: () => DashboardPage.of(context).goToTab(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _BankItem(),
                      _BankItem(),
                      _BankItem(),
                    ],
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

class _BankItem extends StatelessWidget {
  const _BankItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.square(ss(110)),
      child: Material(
        elevation: 4,
        shadowColor: Colors.black12,
        borderRadius: BorderRadius.circular(4),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(FeatherIcons.instagram, size: ss(54), color: MkColors.light_grey),
              Text(
                "First Bank",
                style: MkTheme.of(context).smallMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TitleContentBlock extends StatelessWidget {
  const _TitleContentBlock({
    Key key,
    @required this.title,
    @required this.onTap,
    @required this.child,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = MkTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sw(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: sh(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: theme.body3MediumHint),
                MkClearButton(
                  padding: EdgeInsets.zero,
                  child: Text(
                    "SEE ALL",
                    style: theme.smallMedium.copyWith(color: MkColors.primary),
                  ),
                  onPressed: onTap,
                ),
              ],
            ),
          ),
          SizedBox(height: sh(8)),
          child,
        ],
      ),
    );
  }
}

const double _cardShadowOffset = 24;
