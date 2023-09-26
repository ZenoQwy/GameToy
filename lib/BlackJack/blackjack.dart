//import 'package:audioplayers/audioplayers.dart';
import 'package:game_toy/BlackJack/class/Croupier.dart';
import 'package:game_toy/BlackJack/class/Joueur.dart';
import 'package:game_toy/navigation.dart';
import 'package:flutter/material.dart';
import 'class/Partie.dart';
import 'dart:async';

class BlackJackGamePage extends StatefulWidget {
  const BlackJackGamePage({super.key, required this.title});

  final String title;
  @override
  State<BlackJackGamePage> createState() => _BlackJackState();
}

//final player = AudioPlayer();

class _BlackJackState extends State<BlackJackGamePage> {
  bool selected = false;
  Joueur _j = Joueur();

  void _playSound() {
    //player.play(AssetSource('sounds/clic.mp3'));
  }

  void _playwin() {
    //player.play(AssetSource('sounds/win.mp3'));
  }

  void _stopsound() {
    //player.stop();
  }

  void _resetJeu() {
    setState(() {});
  }

  List<double> yOffsets = [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          leading: IconButton(
            icon: Icon(
                Icons.arrow_back), // Icône de retour (flèche vers la gauche)
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => NavigationPage(
                      title:
                      'GameToy - Accueil'), // Remplacez par le titre approprié
                ),
              );
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < _j.getMain().length; i++)
                  AnimatedContainer(
                    transform: Matrix4.translationValues(0.0, yOffsets[i], 0.0),
                    duration: const Duration(milliseconds: 300),
                    child: MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          yOffsets[i] = -10.0;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          yOffsets[i] = 0.0;
                        });
                      },
                      child: Image.asset(
                        "assets/images/cartes/${_j.getCardInMain(i).getCarte()}.png",
                        height: 50,
                      ),
                    ),
                  ),
              ],
            )
          ],
        ));
  }
}
