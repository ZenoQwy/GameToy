import 'package:audioplayers/audioplayers.dart';
import 'package:game_toy/navigation.dart';
import 'package:flutter/material.dart';
import 'class/Partie.dart';

class PuissanceIVGamePage extends StatefulWidget {
  const PuissanceIVGamePage({super.key, required this.title});

  final String title;
  @override
  State<PuissanceIVGamePage> createState() => _MyHomePageState();

}
final player = AudioPlayer();



class _MyHomePageState extends State<PuissanceIVGamePage> {
  Color _backgroundColor = Colors.red.withOpacity(1);
  Partie _partie = Partie();

  void _playSound() {
    player.play(AssetSource('sounds/clic.mp3'));
  }

  void _playwin() {
    player.play(AssetSource('sounds/win.mp3'));
  }

  void _stopsound() {
    player.stop();
  }

  void _resetJeu() {
    setState(() {
      _partie = Partie();
      _backgroundColor = Colors.red.withOpacity(1);
    });
  }

  void _buttonPressedd(int col,) {
    setState(() {
      if (!_partie.estTerminee()) {
        _playSound();
        _partie.jouer(col);
        if (_partie.estTerminee()) {
          _playwin();
        }
        _backgroundColor =
        _partie.getPlayer1() ? Colors.red.withOpacity(1) : Colors.yellow
            .withOpacity(1);
      }
    });
  }



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
      body: Stack(
        children: [
          Container(
            color: _backgroundColor,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Center(
            child: ClipRRect( // Ajouter des bords arrondis
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                color: Color.fromRGBO(0, 100, 255, 1), // Fond vert pour grille du morpion
                width: MediaQuery.of(context).size.width * 1, // Largeur de la grille
                height: MediaQuery.of(context).size.height * 0.80, // Hauteur de la grille
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start  ,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Au tour du ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.black, // Couleur constante ( qui ne changera pas ) pour "Au tour du"
                              ),
                            ),
                            TextSpan(
                              text: "${_partie.getPlayer1() ? "Joueur 1" : "Joueur 2"}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: _partie.getPlayer1() ? Colors.red : Colors.yellow,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ), // Espacement entre les deux textes
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    RichText(
                        text:  TextSpan(
                            children: [
                              TextSpan( text : _partie.estTerminee()
                                  ? _partie.getGagnant() == "Egalité"
                                  ? "Match nul"
                                  : "${_partie.getGagnant() == "Joueur 1" ? "Joueur 1" : "Joueur 2"} remporte la partie"
                                  : "",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15  ,
                                  color: Colors.black,
                                ),
                              ),])),
                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                    for (int row = 0; row < 6; row++)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (int col = 0; col < 7; col++)
                            SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.14,
                                  height: MediaQuery.of(context).size.height * 0.08,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(), // Définir la forme du bouton en cercle
                                      primary: _partie.getPlateau().getcase(row, col).getvaleur() == "X"
                                          ? Colors.red
                                          : _partie.getPlateau().getcase(row, col).getvaleur() == "O"
                                          ? Colors.yellow
                                          : Colors.white,
                                    ),
                                    onPressed: () {
                                      _buttonPressedd(col);
                                    },
                                    child: Text(
                                      '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 45,
                                      ),
                                    ),
                                  ),
                                ),
                          ],
                        ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color?>(Colors.black),
                      ),
                      onPressed: () {
                        _resetJeu();
                        _stopsound();
                      },
                      child: const Text(
                        'REJOUER',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}