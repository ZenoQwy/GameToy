import 'package:flutter/material.dart';
import 'package:game_toy/navigation.dart';

class MilleBornesPage extends StatefulWidget {
  const MilleBornesPage({super.key, required this.title});
  final String title;

  @override
  State<MilleBornesPage> createState() => _MilleBornesPage();
}

class _MilleBornesPage extends State<MilleBornesPage> {
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
          const Padding(padding: EdgeInsets.only(bottom: 50)),
          for (int row = 0; row < 8; row++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int col = 0; col < 8; col++)
                      SizedBox(
                    width: MediaQuery.of(context).size.width * 0.12,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: col % 2 == 0 && row % 2 == 0 || col % 2 != 0 && row % 2 != 0? Colors.white : Colors.black,
                      ),

                      onPressed: () {

                      },
                      child: const Text(
                        '',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
        ])
    );
  }
}
