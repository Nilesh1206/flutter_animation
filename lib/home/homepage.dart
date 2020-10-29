import 'package:flutter/material.dart';
import 'gradientAppBar.dart';
import 'homepageBody.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(62, 57, 99,1),
      body: Column(
        children: [
          GradientAppBar(title:"treva"),
          HomePageBody(),
        ],
      ),
    );
  }
}