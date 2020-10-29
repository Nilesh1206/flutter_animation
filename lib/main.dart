import 'dart:math';
import 'dart:ui';

import 'package:TestApp/home/homepage.dart';
import 'package:TestApp/ui/animation.dart';

import 'circle.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
       MaterialApp(
      title: 'Animation App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  bool showFingerPrint = false;
  bool isAnimationCompleted = false;
  @override
  void initState() {
    super.initState();

    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.forward:
            break;
          case AnimationStatus.completed:
            isAnimationCompleted = true;
            Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ColorLoader2();
                      }));
            _controller.reverse();
            break;
          case AnimationStatus.reverse:
            break;
          case AnimationStatus.dismissed:
            if (isAnimationCompleted){
              setState(() {
                showFingerPrint = !showFingerPrint;
              });
              isAnimationCompleted = false;
                Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ColorLoader2();
                      }));
            }
            break;
        }
      });
  }

  _onLongPressStart(LongPressStartDetails details) {
    if (!_controller.isAnimating) {
      _controller.forward();
    } else {
      _controller.forward(from: _controller.value);
    }
  }

  _onLongPressEnd(LongPressEndDetails details) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlue[50],
        alignment: Alignment.center,
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onLongPressStart: _onLongPressStart,
              onLongPressEnd: _onLongPressEnd,
              child: AnimatedBuilder(
                  animation: _controller,
                  builder: (_, child) {
                    return Transform.scale(
                      scale: ((_controller.value * 0.2) + 1),
                      child: Container(
                        width: 100,
                        padding: EdgeInsets.all(10),
                        height: 100,
                        child: Stack(
                          children: <Widget>[
                            CircularProgres(value: _controller.value),
                            Container(
                              child: showFingerPrint
                                  ? Center(
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                        size: 50,
                                      ),
                                      
                                    )
                                  : FingerPrintIcon(value: _controller.value),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.blue[100],
                                blurRadius: 10,
                                spreadRadius: 3,
                                offset: Offset(16, 16)),
                          ],
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class FingerPrintIcon extends StatelessWidget {
  final double value;
  FingerPrintIcon({this.value});
  Future navigateToSubPage(context) async {
  Navigator.pop(context);
}
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Center(
          child: IconButton(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 30),
           icon:Icon(Icons.fingerprint,
            color: Colors.blue,
            size: 50,),
            onPressed: () async{
              await  Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ColorLoader2();
                      }));
            },
          ),
          
        ),
        Positioned(
          bottom: 15,
          
          child: ClipRect(
            child: Align(
              alignment: Alignment.bottomCenter,
              heightFactor: value,
              child: Icon(
             Icons.fingerprint,
                color: Colors.blue,
                size: 50,
               
              ),
            ),
          ),
        ),
      ],
    );
  }
}
