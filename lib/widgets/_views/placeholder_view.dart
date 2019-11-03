import 'package:flutter/material.dart';
import 'package:voute/widgets/_partials/mk_app_bar.dart';

class PlaceholderView extends StatelessWidget {
  const PlaceholderView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: MkAppBar(title: Text("Placeholder")));
  }
}
