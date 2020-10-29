import 'package:TestApp/home/planetRow.dart';
import 'package:TestApp/model/planetsDetails.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:TestApp/home/planetRow.dart';
import 'package:TestApp/model/planetsDetails.dart';
import 'package:flutter/animation.dart';

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> with SingleTickerProviderStateMixin{

  Animation animation;
  AnimationController controller;


  @override
  void initState() {
    super.initState();
    controller=AnimationController(vsync: this,duration: Duration(seconds: 1));
    animation=Tween(begin: 1.0,end: 0.0).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn
    ));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: controller,
      builder: (context,child) {
        return Expanded(
          child: ListView.builder(
            itemCount: PlanetDao.planets.length,
            itemBuilder: (context,index) {
              return Transform(
                transform: Matrix4.translationValues(0,animation.value*width, 0),
                  child: PlanetRow(planet: PlanetDao.planets[index],));
            },
          ),
        );
      },
    );
  }
}