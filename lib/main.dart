import 'package:flutter/material.dart';

import 'splashscreen.dart';
import 'navigation.dart';
import 'Jeu 1/morpion.dart';
import 'Jeu 2/puissanceIV.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GameToy',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'GameToy navigation'),
      routes: <String, WidgetBuilder>{
        '/route1': (BuildContext context) =>
            NavigationPage(title: "Bienvenue sur GameToy !"),
        '/route2': (BuildContext context) => MorpionGamePage(title: 'Jeu 1'),
        '/route3': (BuildContext context) => PowerIVGamePage(title: 'Jeu 2'),
      },
    );
  }
}
