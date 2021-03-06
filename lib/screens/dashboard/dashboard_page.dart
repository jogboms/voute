import 'package:after_layout/after_layout.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rebloc/rebloc.dart';
import 'package:voute/constants/mk_colors.dart';
import 'package:voute/constants/mk_routes.dart';
import 'package:voute/environments/environment.dart';
import 'package:voute/models/user/user.dart';
import 'package:voute/rebloc/actions/common.dart';
import 'package:voute/rebloc/states/app.dart';
import 'package:voute/screens/accounts/accounts_page.dart';
import 'package:voute/screens/cards/cards_page.dart';
import 'package:voute/screens/home/home_page.dart';
import 'package:voute/screens/more/more_page.dart';
import 'package:voute/screens/people/people_page.dart';
import 'package:voute/utils/mk_first_time_login_check.dart';
import 'package:voute/utils/mk_navigate.dart';
import 'package:voute/utils/mk_screen_util.dart';
import 'package:voute/utils/mk_status_bar.dart';
import 'package:voute/widgets/_views/keyboard_wrapper_view.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    Key key,
    @required this.user,
  }) : super(key: key);

  final UserModel user;

  static void onNavigate(BuildContext context, UserModel user) {
    Navigator.pushAndRemoveUntil<void>(
      context,
      MkNavigate.fadeIn<void>(
        DashboardPage(user: user),
        settings: RouteSettings(name: MkRoutes.dashboard),
      ),
      (Route<void> route) => false,
    );
  }

  static DashboardPageState of(BuildContext context) => Provider.of<DashboardPageState>(context);

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> with TickerProviderStateMixin, AfterLayoutMixin {
  final List<int> _navHistory = [];
  int _currentPageIndex = 2;
  TabController _controller;
  List<Widget> _tabViews;

  final List<_Tab> _tabIcons = [
    const _Tab(icon: FeatherIcons.briefcase),
    const _Tab(icon: FeatherIcons.creditCard),
    const _Tab(icon: FeatherIcons.home),
    const _Tab(icon: FeatherIcons.users),
    const _Tab(icon: FeatherIcons.moreHorizontal),
  ];

  @override
  void initState() {
    super.initState();
    _tabViews = [
      const AccountsPage(key: PageStorageKey("accounts")),
      const CardsPage(key: PageStorageKey("cards")),
      const HomePage(key: PageStorageKey("home")),
      const PeoplePage(key: PageStorageKey("people")),
      const MorePage(key: PageStorageKey("more")),
    ];
    _controller = TabController(vsync: this, initialIndex: _currentPageIndex, length: _tabViews.length)
      ..addListener(_pageListener);
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    await MkFirstTimeLoginCheck.check(Environment.di())
        .then<bool>((bool isFirstTimeLogin) => Future<bool>.delayed(const Duration(seconds: 3), () => isFirstTimeLogin))
        .then((bool isFirstTimeLogin) async {});
  }

  @override
  void dispose() {
    _controller?.removeListener(_pageListener);
    _controller?.dispose();
    super.dispose();
  }

  void _pageListener() {
    setState(() {
      _navHistory.add(_currentPageIndex);
      _currentPageIndex = _controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final child = WillPopScope(
      // TODO
      onWillPop: () async {
        if (_navHistory.isNotEmpty) {
          final _prevIndex = _navHistory.length - 1;
          goToTab(_navHistory.removeAt(_prevIndex));
          print(_prevIndex);
        } else {
          goToTab(0);
        }
        print(_navHistory);
        return false;
      },
      child: MkStatusBar(
        brightness: Brightness.dark,
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: MkColors.smoke,
          body: TabBarView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            children: _tabViews.map((child) {
              return Provider<DashboardPageState>.value(
                value: this,
                child: KeyboardWrapperView(child: child),
              );
            }).toList(),
          ),
          bottomNavigationBar: SizedBox(
            height: ss(56) + MkScreenUtil().safeArea.bottom,
            child: _TabBar(currentIndex: _controller.index, onNavigate: goToTab, tabs: _tabIcons),
          ),
        ),
      ),
    );

    return FirstBuildDispatcher<AppState>(
      action: widget.user != null ? OnLoginAction(widget.user) : const VoidAction(),
      child: child,
    );
  }

  void goToTab(int index) {
    _controller.animateTo(index, duration: const Duration(milliseconds: 150), curve: Curves.decelerate);
  }
}

class _TabBar extends StatelessWidget {
  const _TabBar({
    Key key,
    @required this.currentIndex,
    @required this.onNavigate,
    @required this.tabs,
  }) : super(key: key);

  final int currentIndex;
  final ValueChanged<int> onNavigate;
  final List<_Tab> tabs;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: sw(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(tabs.length, (index) {
            return _TabButton(
              tab: tabs[index],
              isActive: currentIndex == index,
              onPressed: () => onNavigate(index),
            );
          }),
        ),
      ),
    );
  }
}

class _Tab {
  const _Tab({@required this.icon});

  final IconData icon;
}

class _TabButton extends StatelessWidget {
  const _TabButton({
    Key key,
    @required this.tab,
    @required this.onPressed,
    @required this.isActive,
  }) : super(key: key);

  final _Tab tab;
  final VoidCallback onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tight(Size.square(ss(56))),
      child: Stack(
        children: <Widget>[
          if (isActive)
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: sw(24),
                height: sh(4),
                decoration: BoxDecoration(
                  color: MkColors.base_primary.shade400,
                  borderRadius: BorderRadius.circular(ss(2)),
                ),
              ),
            ),
          RawMaterialButton(
            constraints: BoxConstraints.expand(),
            shape: CircleBorder(),
            child: Icon(tab.icon, color: MkColors.dark.shade600, size: sf(24)),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
