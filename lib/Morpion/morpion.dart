import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'class/Partie.dart';

class MorpionGamePage extends StatefulWidget {
  const MorpionGamePage({super.key, required this.title});

  final String title;
  @override
  State<MorpionGamePage> createState() => _MyHomePageState();

}
final player = AudioPlayer();



class _MyHomePageState extends State<MorpionGamePage> {
  Color _backgroundColor = Colors.blue.withOpacity(1);
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
      _backgroundColor = Colors.blue.withOpacity(1);
    });
  }

  void _buttonPressedd(int x, int y) {
    setState(() {
      if (!_partie.estTerminee()) {
        _playSound();
        _partie.jouer(x, y);
        if (_partie.estTerminee()) {
          _playwin();
        }
        _backgroundColor =
        _partie.getPlayer1() ? Colors.blue.withOpacity(1) : Colors.red
            .withOpacity(1);
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                color: Colors.green, // Fond vert pour grille du morpion
                width: MediaQuery.of(context).size.width * 0.85, // Largeur de la grille
                height: MediaQuery.of(context).size.height * 0.75, // Hauteur de la grille
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
                                color: _partie.getPlayer1() ? const Color.fromRGBO(0, 128, 255, 1) : Colors.redAccent,
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
                    for (int row = 0; row < 3; row++)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (int col = 0; col < 3; col++)
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.23,
                                height: MediaQuery.of(context).size.height * 0.13,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: _partie.getPlateau().getcase(row, col).getvaleur() == "X"
                                        ? Colors.blue
                                        : _partie.getPlateau().getcase(row, col).getvaleur() == "O"
                                        ? Colors.red
                                        : Colors.white,
                                  ),
                                  onPressed: () {
                                    _buttonPressedd(row, col);
                                  },
                                  child: Text(
                                    '${_partie.getPlateau().getcase(row, col).getvaleur()}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 45,
                                    ),
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