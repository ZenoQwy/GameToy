import 'dart:io';
import 'A Functions.dart';
import 'Plateau.dart';

class Partie {
  bool _terminee = false;
  String _gagnant = "";
  bool _player1 = true;
  Plateau _plateau = new Plateau();
  int _tours = 1;

  Plateau getPlateau() {
    return this._plateau;
  }

  bool getPlayer1() {
    return this._player1;
  }

  bool estTerminee() {
    return this._terminee;
  }

  String getGagnant() {
    return this._gagnant;
  }

  bool estEgalite() {
    if (this._tours >= 42 && this._plateau.ligne_gagnante() == false) {
      return true;
    } else {
      return false;
    }
  }

  int getTours() {
    return this._tours;
  }

  void jouer(int col) {
    for (int row = _plateau.getHauteur(); row >= 0; row--) {
      if (_plateau.getcase(row, col).estvide()) {
        if (_player1) {
          _plateau.getcase(row, col).setelement("X");
        } else {
          _plateau.getcase(row, col).setelement("O");
        }

        if (_plateau.ligne_gagnante()) {
          _terminee = true;
          _gagnant = _player1 ? "Joueur 1" : "Joueur 2";
        } else if (estEgalite()) {
          _terminee = true;
          _gagnant = "Egalité";
        } else {
          _player1 = !_player1;
          _tours++;
        }
        break; // Sortez de la boucle après avoir placé le pion
      }
    }
  }
}



