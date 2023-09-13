import 'dart:io';
import 'A Functions.dart';
import 'Case.dart';

class Plateau {
  List<List<Case>> _plateau = List.generate(3, (i) => List.generate(3, (j) => Case("")));

  int getlongueur() {
    return _plateau.length;
  }

  Case getcase(x, y) {
    return _plateau[x][y];
  }

  afficher() {
    print("   Morpion");
    print("┏━━━┳━━━┳━━━┓");
    for (int i = 0; i < _plateau.length; i++) {
      stdout.write("┃ ");
      for (int j = 0; j < _plateau.length; j++) {
        if (_plateau[i][j].estvide() == true) {
          stdout.write(" ");
          stdout.write(" ┃ ");
        } else {
          stdout.write(_plateau[i][j].getvaleur());
          stdout.write(" ┃ ");
        }
      }
      print("");
      if (i != 2) {
        print("┣━━━╋━━━╋━━━┫");
      } else {
        print("┗━━━┻━━━┻━━━┛");
      }
    }
  }

  bool ligne_gagnante() {
    bool reponse = false;
    /*Si l'une des 3 colonnes est gagnante
  -------------------------------------------------------------------------------------------------------------------------------------------------------*/
    if (_plateau[0][0].getvaleur() == "X" && _plateau[1][0].getvaleur() == "X" && _plateau[2][0].getvaleur() == "X" ||
        _plateau[0][0].getvaleur() == "O" && _plateau[1][0].getvaleur() == "O" && _plateau[2][0].getvaleur() == "O") {
      reponse = true;
    }
    if (_plateau[0][1].getvaleur() == "X" && _plateau[1][1].getvaleur() == "X" && _plateau[2][1].getvaleur() == "X" ||
        _plateau[0][1].getvaleur() == "O" && _plateau[1][1].getvaleur() == "O" && _plateau[2][1].getvaleur() == "O") {
      reponse = true;
    }
    if (_plateau[0][2].getvaleur() == "X" && _plateau[1][2].getvaleur() == "X" && _plateau[2][2].getvaleur() == "X" ||
        _plateau[0][2].getvaleur() == "O" && _plateau[1][2].getvaleur() == "O" && _plateau[2][2].getvaleur() == "O") {
      reponse = true;
    } /*
  -------------------------------------------------------------------------------------------------------------------------------------------------------
                                              Si l'une des 3 lignes est gagnante
  -------------------------------------------------------------------------------------------------------------------------------------------------------*/
    if (_plateau[0][0].getvaleur() == "X" && _plateau[0][1].getvaleur() == "X" && _plateau[0][2].getvaleur() == "X" ||
        _plateau[0][0].getvaleur() == "O" && _plateau[0][1].getvaleur() == "O" && _plateau[0][2].getvaleur() == "O") {
      reponse = true;
    }
    if (_plateau[1][0].getvaleur() == "X" && _plateau[1][1].getvaleur() == "X" && _plateau[1][2].getvaleur() == "X" ||
        _plateau[1][0].getvaleur() == "O" && _plateau[1][1].getvaleur() == "O" && _plateau[1][2].getvaleur() == "O") {
      reponse = true;
    }
    if (_plateau[2][0].getvaleur() == "X" && _plateau[2][1].getvaleur() == "X" && _plateau[2][2].getvaleur() == "X" ||
        _plateau[2][0].getvaleur() == "O" && _plateau[2][1].getvaleur() == "O" && _plateau[2][2].getvaleur() == "O") {
      reponse = true;
    } /*
  --------------------------------------------------------------------------------------------------------------------------------------------------------
                                              Si l'une des 2 diagonales est gagnante
  -------------------------------------------------------------------------------------------------------------------------------------------------------*/
    if (_plateau[0][0].getvaleur() == "X" && _plateau[1][1].getvaleur() == "X" && _plateau[2][2].getvaleur() == "X" ||
        _plateau[0][0].getvaleur() == "O" && _plateau[1][1].getvaleur() == "O" && _plateau[2][2].getvaleur() == "O") {
      reponse = true;
    }
    if (_plateau[0][2].getvaleur() == "X" && _plateau[1][1].getvaleur() == "X" && _plateau[2][0].getvaleur() == "X" ||
        _plateau[0][2].getvaleur() == "O" && _plateau[1][1].getvaleur() == "O" && _plateau[2][0].getvaleur() == "O") {
      reponse = true;
    } /*
  --------------------------------------------------------------------------------------------------------------------------------------------------------*/
    return reponse;
  }
}
