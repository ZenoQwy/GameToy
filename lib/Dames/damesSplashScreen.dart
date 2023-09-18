import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';
import 'dames.dart';
import 'dart:async';

class DamesSplashScreen extends StatefulWidget {
  @override
  _DamesSplashScreen createState() => _DamesSplashScreen();
}

class _DamesSplashScreen extends State<DamesSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
          () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => DamesGamePage(title: 'Dames'),
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
            Image.asset("assets/images/dames.png",
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
