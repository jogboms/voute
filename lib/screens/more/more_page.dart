import 'package:flutter/material.dart';
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
          child: SizedBox(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, i) {
              return Material(
                color: Colors.orange,
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
