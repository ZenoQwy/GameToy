import 'package:flutter/material.dart';
import 'package:game_toy/navigation.dart';

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
          leading: IconButton(
            icon:
            Icon(Icons.arrow_back), // Icône de retour (flèche vers la gauche)
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => NavigationPage(
                      title: 'GameToy - Accueil'), // Remplacez par le titre approprié
                ),
              );
            },
          ),
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
                    'assets/images/gametoy_logo.png', // Logo de l'appli
                  ),
                )
              ],
            ),
          ),
        ]));
  }
}
