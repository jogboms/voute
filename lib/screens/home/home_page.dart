import 'package:flutter/material.dart';
import 'package:voute/widgets/_partials/mk_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MkAppBar(
        title: const Text("Home"),
      ),
      body: Material(),
    );
  }
}
