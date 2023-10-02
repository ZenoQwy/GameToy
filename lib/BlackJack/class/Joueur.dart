import 'Carte.dart';

class Joueur {
  List<Carte> _main = [
Carte("Pique", "As"),
Carte("Pique", "Valet"),
  ];

  Joueur();

  int getLongueurMain(){
    return this._main.length;
  }

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

  void retournerCarte(int i){
    this._main[i].retourner();
  }

  void melangerMain(){
    this._main.shuffle();
  }
}
