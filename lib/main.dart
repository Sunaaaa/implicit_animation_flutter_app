import 'dart:math';

import 'package:flutter/material.dart';

const _duration = Duration(milliseconds: 400);

void main() {
  runApp(MyApp());
}

double randomBorderRadius() {
  return Random().nextDouble() * 64;
}

double randomMargin() {
  return Random().nextDouble() * 64;
}

Color randomColor() {
  return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
}
class AnimatedContainerDemo extends StatefulWidget {
  _AnimatedContainerDemo createState() => _AnimatedContainerDemo();
}

class _AnimatedContainerDemo extends State<AnimatedContainerDemo> {

  Color _color ;
  double _borderRadius;
  double _margin;
  @override
  void initState() {
    _color = randomColor();
    _borderRadius = randomBorderRadius();
    _margin = randomMargin();
  }

  void change() {
    setState((){
      _color = randomColor();
      _borderRadius = randomBorderRadius();
      _margin = randomMargin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Implicit Animations"), backgroundColor: Colors.lightGreen,),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 128,
              height: 128,
              child: AnimatedContainer(
                margin: EdgeInsets.all(_margin),
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: BorderRadius.circular(_borderRadius)
                ),
                duration: _duration,
                curve: Curves.easeInOutBack,
              ),
            ),
            ElevatedButton(onPressed: () => change(), child: Text("Change"))
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedContainerDemo(),
    );
  }
}