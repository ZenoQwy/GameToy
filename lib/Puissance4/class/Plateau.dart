import 'dart:io';
import 'A Functions.dart';
import 'Case.dart';

class Plateau {
  List<List<Case>> _plateau = List.generate(
      6, (i) => List.generate(7, (j) => Case("")));

  int getHauteur() {
    return _plateau.length - 1;
  }

  Case getcase(x, y) {
    return _plateau[x][y];
  }

  afficher() {
    for (int x = 0; x < _plateau.length; x++) {
      for (int y = 0; y < _plateau.length + 1; y++) {
        if (_plateau[x][y].estvide()) {
          stdout.write(" . ");
        } else {
          stdout.write(' ${_plateau[x][y].getvaleur()} ');
        }
      }
      print("");
    }
    print("");
    print("------------------------------------------------------------");
    print("");
  }

  bool ligne_gagnante() {
    int lignes = _plateau.length;
    int colonnes = _plateau[0].length;

    // Vérification des lignes horizontales
    for (int row = 0; row < lignes; row++) {
      for (int col = 0; col <= colonnes - 4; col++) {
        String couleur = _plateau[row][col].getvaleur();
        if (couleur != "") {
          bool ligneGagnante = true;
          for (int i = 1; i < 4; i++) {
            if (_plateau[row][col + i].getvaleur() != couleur) {
              ligneGagnante = false;
              break;
            }
          }
          if (ligneGagnante) {
            return true;
          }
        }
      }
    }

    // Vérification des lignes verticales
    for (int col = 0; col < colonnes; col++) {
      for (int row = 0; row <= lignes - 4; row++) {
        String couleur = _plateau[row][col].getvaleur();
        if (couleur != "") {
          bool ligneGagnante = true;
          for (int i = 1; i < 4; i++) {
            if (_plateau[row + i][col].getvaleur() != couleur) {
              ligneGagnante = false;
              break;
            }
          }
          if (ligneGagnante) {
            return true;
          }
        }
      }
    }

    // Vérification des lignes diagonales (de haut en bas à gauche)
    for (int row = 0; row <= lignes - 4; row++) {
      for (int col = 0; col <= colonnes - 4; col++) {
        String couleur = _plateau[row][col].getvaleur();
        if (couleur != "") {
          bool ligneGagnante = true;
          for (int i = 1; i < 4; i++) {
            if (_plateau[row + i][col + i].getvaleur() != couleur) {
              ligneGagnante = false;
              break;
            }
          }
          if (ligneGagnante) {
            return true;
          }
        }
      }
    }

    // Vérification des lignes diagonales (de haut en bas à droite)
    for (int row = 0; row <= lignes - 4; row++) {
      for (int col = 3; col < colonnes; col++) {
        String couleur = _plateau[row][col].getvaleur();
        if (couleur != "") {
          bool ligneGagnante = true;
          for (int i = 1; i < 4; i++) {
            if (_plateau[row + i][col - i].getvaleur() != couleur) {
              ligneGagnante = false;
              break;
            }
          }
          if (ligneGagnante) {
            return true;
          }
        }
      }
    }

    return false; // Aucune ligne gagnante trouvée
  }
}