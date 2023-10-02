import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:game_toy/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'class/Carte.dart';
import 'class/Partie.dart';

class BlackJackGamePage extends StatefulWidget {
  const BlackJackGamePage({super.key, required this.title});

  final String title;
  @override
  State<BlackJackGamePage> createState() => _BlackJackState();
}

final player = AudioPlayer();

class _BlackJackState extends State<BlackJackGamePage> {
  Partie _partie = new Partie();
  double globalCardHeight = 110;
  double _leftPosition = 0;
  int tempTransition = 800;
  bool CardIsMoving = false;
  bool animationEnCours = false;

  @override
  void initState() {
    super.initState();
    // Déclenchez l'animation de pioche automatiquement après un certain délai
    lancerAnimationPiocheEnBoucle();
  }

  void lancerAnimationPiocheEnBoucle() {
    if (!_partie.getPioche().isEmpty()) {
      if (!animationEnCours) {
        setState(() {
          animationEnCours = true;
        });
        lancerAnimationPioche();
        Future.delayed(Duration(seconds: 3), () {
          setState(() {
            animationEnCours = false;
          });
          // Lancez à nouveau l'animation en boucle
          lancerAnimationPiocheEnBoucle();
        });
      }
    }else{
      _resetJeu();
      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          lancerAnimationPiocheEnBoucle();
        });
      });
    }
  }

  void lancerAnimationPioche() {
    if (CardIsMoving == false) {
      setState(() {
        CardIsMoving = true;
      });
      Future.delayed(Duration.zero, () {
        // Utilisez Future.delayed avec une durée nulle pour exécuter du code après le rendu initial
        if (_partie.getPioche().getCardInPioche(0).estRetournee()) {
          _partie.getPioche().getCardInPioche(0).retourner();
        }
        _leftPosition = (40 - MediaQuery.of(context).size.width / 2).toDouble();
        Future.delayed(Duration(milliseconds: 800), () {
          setState(() {
            if (!_partie.getTable().isEmpty()) {
              _partie.getTable().reset();
            }
            _partie.TableePioche();
            _leftPosition = 0;
            tempTransition = 0;
          });
          Future.delayed(Duration(milliseconds: 10), () {
            setState(() {
              tempTransition = 800;
              CardIsMoving = false;
            });
          });
        });
      });
    }
  }

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(children: [
                Text("Main du Croupier",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                Align(
                  alignment: Alignment.center, // Adjust alignment as needed
                  child: Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: buildCroupierHand()),
                ),
              ]),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    test(),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    buildFausseWidget(),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Pioche",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    buildPiocheWidget(),
                  ],
                ),
              ],
            ),
            Column(children: [
              ElevatedButton(
                onPressed: _resetJeu,
                child: Text("Reset"),
              ),
              ElevatedButton(
                onPressed: _melanger,
                child: Text("Mélanger pioche"),
              ),
              ElevatedButton(
                onPressed: _fausse,
                child: Text("Afficher Fausse"),
              ),
              ElevatedButton(
                onPressed: _pioche,
                child: Text("Afficher Pioche"),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(children: [
                  Text("Votre main",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Align(
                    alignment: Alignment.center, // Adjust alignment as needed
                    child: Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: buildPlayerHand()),
                  ),
                ]),
              ],
            ),
          ],
        ));
  }

  void _fausse() {
    if (!_partie.getTable().isEmpty()) {
      print(_partie.getTable().getCardOnTable(0).toString());
    }
  }

  void _pioche() {
    if (!_partie.getPioche().isEmpty()) {
      print(_partie.getPioche().getCards().toString());
    }
  }

  void _melanger() {
    setState(() {
      _partie.getPioche().melanger();
    });
  }

  void _resetJeu() {
    setState(() {
      _partie = new Partie();
    });
  }

  Widget buildPlayerHand() {
    return SizedBox(
        width: 75 +
            (15 *
                _partie
                    .getJoueur()
                    .getMain()
                    .length
                    .toDouble()), // Gere l'affichage de la main de l'adversaire ( face cachée )
        height: globalCardHeight,
        child: Container(
            width: double.infinity,
            height: 200.0,
            child: Stack(
              children: [
                for (int i = 0; i < _partie.getCroupier().getMain().length; i++)
                  Positioned(
                      left: i * 15.0,
                      // Ajustez la valeur pour l'espacement horizontal entre les cartes
                      child: AnimatedContainer(
                          decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          duration: Duration(seconds: 1),
                          child: Image.asset(
                            'assets/images/cartes/${_partie.getJoueur().getCardInMain(i).getCarte()}.png',
                            height: 100,
                          ))),
              ],
            )));
  }

  Widget buildCroupierHand() {
    return SizedBox(
        width: 75 +
            (15 *
                _partie
                    .getCroupier()
                    .getMain()
                    .length
                    .toDouble()), // Gere l'affichage de la main de l'adversaire ( face cachée )
        height: globalCardHeight,
        child: Container(
            width: double.infinity,
            height: 200.0,
            child: Stack(
              children: [
                for (int i = 0; i < _partie.getCroupier().getMain().length; i++)
                  Positioned(
                      left: i * 15.0,
                      // Ajustez la valeur pour l'espacement horizontal entre les cartes
                      child: AnimatedContainer(
                          decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          duration: Duration(seconds: 1),
                          child: Image.asset(
                            'assets/images/cartes/retournee.png',
                            height: 100,
                          ))),
              ],
            )));
  }

  Widget buildSpecificCard(String s, Carte carte) {
    if (carte.estRetournee()) {
      return Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1.5),
            borderRadius: BorderRadius.circular(10)),
        child: Image.asset(
          'assets/images/cartes/retournee.png',
          height: MediaQuery.of(context).size.height * 0.10,
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1.5),
            borderRadius: BorderRadius.circular(10)),
        child: Image.asset(
          'assets/images/cartes/$s.png',
          height: MediaQuery.of(context).size.height * 0.10,
        ),
      );
    }
  }

  Widget buildPiocheWidget() {
    if (_partie.getPioche().isEmpty()) {
      return Container(
        width: 82,
        height: globalCardHeight,
        decoration: BoxDecoration(
            border: Border.all(width: 3),
            borderRadius: BorderRadius.circular(13),
            color: Colors.green),
        child: Image.asset("assets/images/cartes/retournee.png"),
      );
    } else {
      return Container(
          height: globalCardHeight,
          decoration: BoxDecoration(
              border: Border.all(width: 3),
              borderRadius: BorderRadius.circular(14),
              color: Colors.transparent),
          child: Stack(
            children: [
              Image.asset("assets/images/cartes/retournee.png",
                  height: globalCardHeight),
              AnimatedContainer(
                height: globalCardHeight,
                duration: Duration(milliseconds: tempTransition),
                curve: Curves.easeInOutBack,
                transform:
                    Matrix4.translationValues(_leftPosition.toDouble(), 0, 0),
                child: FlipCard(
                  onFlip: () {
                    lancerAnimationPioche();
                  },
                  front: buildSpecificCard(
                    _partie.getPioche().getCardInPioche(0).getCarte(),
                    _partie.getPioche().getCardInPioche(0),
                  ),
                  back: buildSpecificCard(
                    _partie.getPioche().getCardInPioche(0).getCarte(),
                    _partie.getPioche().getCardInPioche(0),
                  ),
                ),
              ),
            ],
          ));
    }
  }

  Widget buildFausseWidget() {
    if (_partie.getTable().isEmpty()) {
      return AnimatedContainer(
        height: globalCardHeight,
        duration: const Duration(microseconds: 700),
        child: Container(
          width: 80,
          decoration: BoxDecoration(
              border: Border.all(width: 3),
              borderRadius: BorderRadius.circular(14),
              color: Colors.transparent),
        ),
      );
    } else {
      return Container(
          height: globalCardHeight,
          decoration: BoxDecoration(
              border: Border.all(width: 3),
              borderRadius: BorderRadius.circular(14),
              color: Colors.transparent),
          child: AnimatedContainer(
            height: globalCardHeight,
            duration: const Duration(milliseconds: 700),
            child: GestureDetector(
                child: Image.asset(
                    "assets/images/cartes/${_partie.getTable().getCardOnTable(0).getCarte()}.png")),
          ));
    }
  }

  Widget test() {
    return AnimatedContainer(
      height: globalCardHeight,
      duration: const Duration(seconds: 1),
      child: Container(
        width: 80,
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
        ),
      ),
    );
  }
}
