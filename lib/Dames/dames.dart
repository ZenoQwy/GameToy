import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class DamesGamePage extends StatefulWidget {
  const DamesGamePage({super.key, required this.title});
  final String title;

  @override
  State<DamesGamePage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<DamesGamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(children: <Widget>[
          Container(
            color: Colors.red, // Couleur de fond de la barre
            height: 150, // Hauteur de la barre
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/images/gametoy.png', // Logo de l'appli
                  ),
                )
              ],
            ),
          ),
        ]));
  }
}
