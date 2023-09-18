import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';
import 'puissance4.dart';
import 'dart:async';

class PuissanceIVSplashScreenState extends StatefulWidget {
  @override
  _PuissanceIVSplashScreenState createState() => _PuissanceIVSplashScreenState();
}

class _PuissanceIVSplashScreenState extends State<PuissanceIVSplashScreenState> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
          () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => PuissanceIVGamePage(title: 'Puissance 4'),
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
            Image.asset("assets/images/puissance4.png",
              height: MediaQuery.of(context).size.height * 0.50,
              width: MediaQuery.of(context).size.height * 0.90,),
            LoadingAnimationWidget.prograssiveDots(
                color: Colors.white, size: 75),
            Padding(padding: EdgeInsets.only(bottom: 80 )),
          ],
        ),
      ),
    );
  }
}
