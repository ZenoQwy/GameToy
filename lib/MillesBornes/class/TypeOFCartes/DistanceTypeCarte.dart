import 'Cartes.dart';

class Distance extends Carte {
  int _valeur;

  Distance(this._valeur);

  int getValeur() {
    return this._valeur;
  }

  @override
  String infos() {
    return super.infos() + this._valeur.toString();
  }
}

// 25
// 50
// 75
// 100
// 200
