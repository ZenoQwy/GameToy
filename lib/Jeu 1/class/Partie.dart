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

  String getGagnant(){
    return this._gagnant;
  }

  bool estEgalite(){
    if(this._tours >= 9 && this._plateau.ligne_gagnante() == false){
      return true;
    }else{
      return false;
    }
  }

  int getTours() {
    return this._tours;
  }

  void jouer(int x, int y) {
      if (_plateau.getcase(x, y).getvaleur() == "") {
        if (_player1) {                                    /// Si c'est au tour du J1
          _plateau.getcase(x, y).setelement("X");          /// On le fait jouer à la case demandé et on met le X
          if (estEgalite() == false) {                     /// Si après le coup ne crée pas une égalité ( tableau plein maias pas de ligne gagnante )
            if (_plateau.ligne_gagnante() == false) {      /// Si le coup ne donne pas lieu à un coup gagnant
              _player1 = !_player1;                        /// On change le joueur actuel
              _tours++;                                    /// On augmente le tour
            } else {
              _terminee = true;                            /// Sinon, si le coup du J1 est gagnant, on termine la partie
              _gagnant = "Joueur 1";                       /// Et on déclare le J1 gagnant
            }
          } else {                                         /// Sinon si le coup porte à une égalité
            _terminee = true;                              /// on arrete la partie
            _gagnant = "Egalité";                          /// On déclare match nul
          }

        } else {                                            /// Si c'est au tour du J2
          _plateau.getcase(x, y).setelement("O");           /// On le fait jouer à la case demandé et on met le O
          if (estEgalite() == false) {                      /// Si après le coup ne crée pas une égalité ( tableau plein maias pas de ligne gagnante )
            if (_plateau.ligne_gagnante() == false) {       /// Si le coup ne donne pas lieu à un coup gagnant
              _player1 = !_player1;                         /// On change le joueur actuel
              _tours++;                                     /// On augmente le tour
            } else {
              _terminee = true;                             /// Sinon, si le coup du J2 est gagnant, on termine la partie
              _gagnant = "Joueur 2";                        /// Et on déclare le J2 gagnant
            }
          } else {                                          /// Sinon si le coup porte à une égalité
            _terminee = true;                               /// on arrete la partie
            _gagnant = "Egalité";                           /// On déclare match nul
          }
        }
      }
  }
}
