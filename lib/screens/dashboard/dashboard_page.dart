import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:rebloc/rebloc.dart';
import 'package:voute/constants/mk_colors.dart';
import 'package:voute/constants/mk_routes.dart';
import 'package:voute/models/user/user.dart';
import 'package:voute/rebloc/actions/common.dart';
import 'package:voute/rebloc/states/main.dart';
import 'package:voute/screens/accounts/accounts_page.dart';
import 'package:voute/screens/cards/cards_page.dart';
import 'package:voute/screens/home/home_page.dart';
import 'package:voute/screens/more/more_page.dart';
import 'package:voute/screens/people/people_page.dart';
import 'package:voute/utils/mk_after_layout_provider.dart';
import 'package:voute/utils/mk_navigate.dart';
import 'package:voute/utils/mk_screen_util.dart';
import 'package:voute/utils/mk_settings.dart';
import 'package:voute/utils/mk_status_bar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    Key key,
    @required this.user,
  }) : super(key: key);

  final UserModel user;

  static void onNavigate(BuildContext context, UserModel user) {
    Navigator.pushAndRemoveUntil<void>(
      context,
      MkPageRoute.fadeIn<void>(
        DashboardPage(user: user),
        settings: RouteSettings(name: MkRoutes.dashboard),
      ),
      (Route<void> route) => false,
    );
  }

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with TickerProviderStateMixin, MkAfterFirstLayoutProvider {
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
      const AccountsPage(key: const PageStorageKey("accounts")),
      const CardsPage(key: const PageStorageKey("cards")),
      const HomePage(key: const PageStorageKey("home")),
      const PeoplePage(key: const PageStorageKey("people")),
      const MorePage(key: const PageStorageKey("more")),
    ];
    _controller = TabController(
        vsync: this, initialIndex: _currentPageIndex, length: _tabViews.length)
      ..addListener(_pageListener);
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    // TODO: might need this
    // await Users.di().fcmRegister();

    await MkSettings.checkIsFirstTimeLogin().then<bool>(
      (bool isFirstTimeLogin) {
        return Future<bool>.delayed(
          const Duration(seconds: 3),
          () => isFirstTimeLogin,
        );
      },
    ).then((bool isFirstTimeLogin) async {});
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
          _onSwitchTab(_navHistory.removeAt(_prevIndex));
          print(_prevIndex);
        } else {
          _onSwitchTab(0);
        }
        print(_navHistory);
        return false;
      },
      child: MkStatusBar(
        brightness: Brightness.light,
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: MkColors.smoke,
          body: TabBarView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            children: _tabViews,
          ),
          bottomNavigationBar: SizedBox(
            height: ss(56) + MkScreenUtil().safeArea.bottom,
            child: _TabBar(
              currentIndex: _controller.index,
              onNavigate: _onSwitchTab,
              tabs: _tabIcons,
            ),
          ),
        ),
      ),
    );

    return FirstBuildDispatcher<AppState>(
      action:
          widget.user != null ? OnLoginAction(widget.user) : const VoidAction(),
      child: child,
    );
  }

  void _onSwitchTab(int index) {
    _controller.animateTo(
      index,
      duration: const Duration(milliseconds: 150),
      curve: Curves.decelerate,
    );
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
        fit: StackFit.expand,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: sw(24),
              height: sh(4),
              decoration: BoxDecoration(
                color: isActive
                    ? MkColors.base_primary.shade400
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(ss(2)),
              ),
            ),
          ),
          RawMaterialButton(
            constraints: BoxConstraints.expand(),
            shape: CircleBorder(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: sh(5)),
                Icon(
                  tab.icon,
                  color: MkColors.dark.shade600,
                  size: sf(24),
                ),
                SizedBox(height: sh(5)),
              ],
            ),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
