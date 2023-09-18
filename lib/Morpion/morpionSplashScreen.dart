import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';
import 'morpion.dart';
import 'dart:async';

class MorpionSplashScreen extends StatefulWidget {
  @override
  _MorpionSplashScreenState createState() => _MorpionSplashScreenState();
}

class _MorpionSplashScreenState extends State<MorpionSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
          () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => MorpionGamePage(title: 'Morpion'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/morpion.png",
              height: MediaQuery.of(context).size.height * 0.40,),
            Padding(padding: EdgeInsets.only(bottom: 75)),
            LoadingAnimationWidget.prograssiveDots(
                color: Colors.white, size: 75),
          ],
        ),
      ),
    );
  }
}
