import 'package:flutter/material.dart';
import 'class/Plateau.dart';

class MorpionGamePage extends StatefulWidget {
  const MorpionGamePage({super.key, required this.title});

  final String title;
  @override
  State<MorpionGamePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MorpionGamePage> {
  bool _player1 = true;
//------------------------------------------------------------------------------------------//
  // Bleu transparant et pas transparent afin d'alterner
  // la transparance des cotés selon le joueur actif.
  List<int> _bluetransparent = [255, 110, 190, 255];
  List<int> _bluepastransparent = [255, 0, 130, 236];

  //Coté actif ( bleu pas transparant pour le premier tour )
  List<int> _cotebleuAgarder = [255, 0, 140, 255];
//------------------------------------------------------------------------------------------//
  // Rouge transparant et pas transparent afin d'alterner
  // la transparance des cotés selon le joueur actif.
  List<int> _redtransparent = [255, 250, 140, 140];
  List<int> _redtpasransparent = [255, 255, 0, 0];
  //Coté actif ( rouge  transparant pour le premier tour )
  List<int> _coterougeAgarder = [255, 250, 140, 140];
//------------------------------------------------------------------------------------------//

  void _resetJeu() {
    setState(() {
      _jeu = new Plateau();
      _player1 = true;
      _cotebleuAgarder = _bluepastransparent;
      _coterougeAgarder = _redtransparent;
    });
  }

  Plateau _jeu = Plateau();
  void _buttonPressedd(x, y) {
    setState(() {
      if (_jeu.getcase(x, y).getvaleur() == "") {
        if (_player1) {
          _cotebleuAgarder = _bluetransparent;
          _coterougeAgarder = _redtpasransparent;
          _jeu.getcase(x, y).setelement("X");
          if (_jeu.ligne_gagnante() == true) {
            _resetJeu();
          } else {
            _player1 = !_player1;
          }
        } else {
          _cotebleuAgarder = _bluepastransparent;
          _coterougeAgarder = _redtransparent;
          _jeu.getcase(x, y).setelement("O");
          if (_jeu.ligne_gagnante() == true) {
            _resetJeu();
          } else {
            _player1 = !_player1;
          }
        }
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
            // bleu transparant : 255, 110, 190, 255
            // bleu pas transparant : 255, 0, 140, 255
            color: Color.fromARGB(_cotebleuAgarder[0], _cotebleuAgarder[1],
                _cotebleuAgarder[2], _cotebleuAgarder[3]),

            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            // rouge transparant : 255, 250, 130, 130
            // rouge pas transparant : 255, 255, 0, 0

            color: Color.fromARGB(_coterougeAgarder[0], _coterougeAgarder[1],
                _coterougeAgarder[2], _coterougeAgarder[3]),
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height,
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width / 2),
          ),
          Expanded(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: MediaQuery.of(context).size.height * 0.50,
                        color: Colors.green,
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.20,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.10,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: _jeu
                                                                .getcase(0, 0)
                                                                .getvaleur() ==
                                                            "X"
                                                        ? Colors.blue
                                                        : _jeu
                                                                    .getcase(
                                                                        0, 0)
                                                                    .getvaleur() ==
                                                                "O"
                                                            ? Colors.red
                                                            : Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    _buttonPressedd(0, 0);
                                                  },
                                                  child: Text(
                                                    '${_jeu.getcase(0, 0).getvaleur()}',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 45,
                                                    ),
                                                  )),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.all(5),
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.20,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.10,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: _jeu
                                                                .getcase(0, 1)
                                                                .getvaleur() ==
                                                            "X"
                                                        ? Colors.blue
                                                        : _jeu
                                                                    .getcase(
                                                                        0, 1)
                                                                    .getvaleur() ==
                                                                "O"
                                                            ? Colors.red
                                                            : Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    _buttonPressedd(0, 1);
                                                  },
                                                  child: Text(
                                                    '${_jeu.getcase(0, 1).getvaleur()}',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 45,
                                                    ),
                                                  )),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.all(5),
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.20,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.10,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: _jeu
                                                                .getcase(0, 2)
                                                                .getvaleur() ==
                                                            "X"
                                                        ? Colors.blue
                                                        : _jeu
                                                                    .getcase(
                                                                        0, 2)
                                                                    .getvaleur() ==
                                                                "O"
                                                            ? Colors.red
                                                            : Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    _buttonPressedd(0, 2);
                                                  },
                                                  child: Text(
                                                    '${_jeu.getcase(0, 2).getvaleur()}',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 45,
                                                    ),
                                                  )),
                                            )),
                                      ]),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.20,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.10,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: _jeu
                                                                .getcase(1, 0)
                                                                .getvaleur() ==
                                                            "X"
                                                        ? Colors.blue
                                                        : _jeu
                                                                    .getcase(
                                                                        1, 0)
                                                                    .getvaleur() ==
                                                                "O"
                                                            ? Colors.red
                                                            : Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    _buttonPressedd(1, 0);
                                                  },
                                                  child: Text(
                                                    '${_jeu.getcase(1, 0).getvaleur()}',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 45,
                                                    ),
                                                  )),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.all(5),
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.20,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.10,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: _jeu
                                                                .getcase(1, 1)
                                                                .getvaleur() ==
                                                            "X"
                                                        ? Colors.blue
                                                        : _jeu
                                                                    .getcase(
                                                                        1, 1)
                                                                    .getvaleur() ==
                                                                "O"
                                                            ? Colors.red
                                                            : Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    _buttonPressedd(1, 1);
                                                  },
                                                  child: Text(
                                                    '${_jeu.getcase(1, 1).getvaleur()}',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 45,
                                                    ),
                                                  )),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.all(5),
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.20,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.10,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: _jeu
                                                                .getcase(1, 2)
                                                                .getvaleur() ==
                                                            "X"
                                                        ? Colors.blue
                                                        : _jeu
                                                                    .getcase(
                                                                        1, 2)
                                                                    .getvaleur() ==
                                                                "O"
                                                            ? Colors.red
                                                            : Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    _buttonPressedd(1, 2);
                                                  },
                                                  child: Text(
                                                    '${_jeu.getcase(1, 2).getvaleur()}',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 45,
                                                    ),
                                                  )),
                                            )),
                                      ]),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.all(5),
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.20,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.10,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: _jeu
                                                                .getcase(2, 0)
                                                                .getvaleur() ==
                                                            "X"
                                                        ? Colors.blue
                                                        : _jeu
                                                                    .getcase(
                                                                        2, 0)
                                                                    .getvaleur() ==
                                                                "O"
                                                            ? Colors.red
                                                            : Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    _buttonPressedd(2, 0);
                                                  },
                                                  child: Text(
                                                    '${_jeu.getcase(2, 0).getvaleur()}',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 45,
                                                    ),
                                                  )),
                                            )),
                                        Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.20,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.10,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: _jeu
                                                                .getcase(2, 1)
                                                                .getvaleur() ==
                                                            "X"
                                                        ? Colors.blue
                                                        : _jeu
                                                                    .getcase(
                                                                        2, 1)
                                                                    .getvaleur() ==
                                                                "O"
                                                            ? Colors.red
                                                            : Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    _buttonPressedd(2, 1);
                                                  },
                                                  child: Text(
                                                    '${_jeu.getcase(2, 1).getvaleur()}',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 45,
                                                    ),
                                                  )),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.all(5),
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.20,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.10,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: _jeu
                                                                .getcase(2, 2)
                                                                .getvaleur() ==
                                                            "X"
                                                        ? Colors.blue
                                                        : _jeu
                                                                    .getcase(
                                                                        2, 2)
                                                                    .getvaleur() ==
                                                                "O"
                                                            ? Colors.red
                                                            : Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    _buttonPressedd(2, 2);
                                                  },
                                                  child: Text(
                                                    '${_jeu.getcase(2, 2).getvaleur()}',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 45,
                                                    ),
                                                  )),
                                            )),
                                      ]),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                            padding: const EdgeInsets.fromLTRB(0,25,0,0),
                                            child: TextButton(
                                                onPressed: _resetJeu,
                                                child: const Text('REJOUER',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 30,
                                                    ))))
                                      ])
                                ])))
                  ])
            ]),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {}, child: const Icon(Icons.person)),
    );
  }
}
