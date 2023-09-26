import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';
import 'blackjack.dart';
import 'dart:async';

class BlackJackSplashScreenState extends StatefulWidget {
  @override
  _BlackJackSplashScreenState createState() => _BlackJackSplashScreenState();
}

class _BlackJackSplashScreenState extends State<BlackJackSplashScreenState> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => BlackJackGamePage(title: 'BlackJack'),
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
            Image.asset(
              "assets/images/blackjack.png",
              height: MediaQuery.of(context).size.height * 0.50,
              width: MediaQuery.of(context).size.height * 0.90,
            ),
            LoadingAnimationWidget.prograssiveDots(
                color: Colors.white, size: 75),
            Padding(padding: EdgeInsets.only(bottom: 80)),
          ],
        ),
      ),
    );
  }
}
