import 'Carte.dart';

class Croupier {
  List<Carte> _main = [];
  Croupier();

  List<Carte> getMain() {
    return this._main;
  }

  void addToMain(Carte carte) {
    this._main.add(carte);
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
