import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';
import 'millesBornes.dart';
import 'dart:async';

class MillesBornesSplashScreen extends StatefulWidget {
  @override
  _MillesBornesSplashScreenState createState() => _MillesBornesSplashScreenState();
}

class _MillesBornesSplashScreenState extends State<MillesBornesSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
          () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => MilleBornesPage(title: '1000 bornes'),
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
            Image.asset("assets/images/1000bornes.png",
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
