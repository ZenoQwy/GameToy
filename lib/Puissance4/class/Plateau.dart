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
  }

  bool ligne_gagnante() {
    int lignes = _plateau.length;
    int colonnes = _plateau[0].length;

    // Vérification des horizontales gagnantes
    for (int x = 0; x < lignes; x++) {
      for (int y = 0; y <= colonnes - 4; y++) {
        String couleur = _plateau[x][y].getvaleur();
        if (couleur != "") {
          bool ligneGagnante = true;
          for (int i = 1; i < 4; i++) {
            if (_plateau[x][y + i].getvaleur() != couleur) {
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

    // Vérification des verticales gagnantes
    for (int x = 0; x < colonnes; x++) {
      for (int y = 0; y <= lignes - 4; y++) {
        String couleur = _plateau[y][x].getvaleur();
        if (couleur != "") {
          bool ligneGagnante = true;
          for (int i = 1; i < 4; i++) {
            if (_plateau[y + i][x].getvaleur() != couleur) {
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

    // Vérification des diagonales gagnantes (de haut en bas à gauche)
    for (int x = 0; x <= lignes - 4; x++) {
      for (int y = 0; y <= colonnes - 4; y++) {
        String couleur = _plateau[x][y].getvaleur();
        if (couleur != "") {
          bool ligneGagnante = true;
          for (int i = 1; i < 4; i++) {
            if (_plateau[x + i][y + i].getvaleur() != couleur) {
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

    // Vérification des diagonales gagnantes (de haut en bas à droite)
    for (int x = 0; x <= lignes - 4; x++) {
      for (int y = 3; y < colonnes; y++) {
        String couleur = _plateau[x][y].getvaleur();
        if (couleur != "") {
          bool ligneGagnante = true;
          for (int i = 1; i < 4; i++) {
            if (_plateau[x + i][y - i].getvaleur() != couleur) {
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