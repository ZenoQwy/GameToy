import 'package:flutter/material.dart';

import 'splashscreen.dart';
import 'navigation.dart';
import 'Morpion/morpion.dart';
import 'Puissance4/puissance4.dart';
import 'Dames/dames.dart';

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
        '/route2': (BuildContext context) => MorpionGamePage(title: 'Morpion'),
        '/route3': (BuildContext context) => PuissanceIVGamePage(title: 'Puissance4'),
        '/route4': (BuildContext context) => DamesGamePage(title: 'Dames'),
      },
    );
  }
}
