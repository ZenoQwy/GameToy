import 'package:flutter/material.dart';

import 'Carte.dart';

class Joueur {
  List<Carte> _main = [
    Carte("Coeur", "As"),
    Carte("Coeur", "2"),
    Carte("Coeur", "3"),
    Carte("Coeur", "4"),
    Carte("Coeur", "5"),
    Carte("Coeur", "6"),
    Carte("Coeur", "7"),
    Carte("Coeur", "8"),
    Carte("Coeur", "9"),
    Carte("Coeur", "10"),
    Carte("Coeur", "Valet"),
    Carte("Coeur", "Reine     "),
    Carte("Coeur", "Roi"),];
  Joueur();

  List<Carte> getMain() {
    return this._main;
  }

  void addToMain(Carte carte) {
    this._main.add(carte);
  }

  Carte getCardInMain(int index) {
    return this._main[index];
  }

  int getNbrPoints() {
    int result = 0;
    for (Carte cartes in _main) {
      if (int.tryParse(cartes.getValeur()) == null) {
        if (cartes.getValeur() == "As") {
          result += 11;
        }
        if (cartes.getValeur() == "Valet") {
          result += 10;
        }
        if (cartes.getValeur() == "Dame") {
          result += 10;
        }
        if (cartes.getValeur() == "Roi") {
          result += 10;
        }
      } else {
        result += int.parse(cartes.getValeur());
      }
    }
    return result;
  }
}
