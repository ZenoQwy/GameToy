import 'dart:io';
import 'A Functions.dart';

class Carte {
  String _couleur;
  String _valeur;

  Carte(this._couleur, this._valeur);

  void affiche() {
    print("$_valeur de $_couleur");
  }

  String getCarte() {
    return "${_valeur}de${_couleur}";
  }

  String getCouleur() {
    return this._couleur;
  }

  String getValeur() {
    return this._valeur;
  }

  @override
  String toString() {
    return "${_valeur.toString()} de $_couleur";
  }
}
