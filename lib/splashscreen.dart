import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'dart:async';

import 'navigation.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});
  final String title;
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  NavigationPage(title: 'Bienvenue sur GameToy !'),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: Stack(children: [
          Center(
            child: Image.asset("assets/images/gametoy.png"),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(50),
                    child: LoadingAnimationWidget.inkDrop(
                        color: Colors.white, size: 50),
                  )
                ],
              )
            ],
          )
        ]));
  }
}
