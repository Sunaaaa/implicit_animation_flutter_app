import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

const ompang_url = "https://item.kakaocdn.net/do/8ae65d2dc85026b9157bf3a5a8c87ab8f43ad912ad8dd55b04db6a64cddaf76d";

class FadeInDemo extends StatefulWidget {
  _FadeInDemo createState() => _FadeInDemo();
}

class _FadeInDemo extends State<FadeInDemo> {
  double _opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: const EdgeInsets.all(10)),
        Image.network(ompang_url),
        TextButton(onPressed: () => setState(()=>_opacity = 1), child: Text("Show Details", style: TextStyle(color: Colors.lightGreen[600])),),
        AnimatedOpacity (
          duration: Duration(seconds: 3),
          opacity: _opacity,
          child: Column(
            children: [
              Text("Hi~"),
              Text("My name is OMPANGI"),
              Text("Nice to meet U :) "),
            ],
          ),
        )
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text("Implicit Animations"),
        ),
        body: Center(
          child: FadeInDemo(),
        ),
      ),
    );
  }
}