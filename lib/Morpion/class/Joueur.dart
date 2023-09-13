import 'dart:io';
import 'A Functions.dart';

class Joueur {
  int _numero;
  String _symbole;

  Joueur(this._numero, this._symbole);

  String getsymbole() {
    return this._symbole;
  }

  int getnumero() {
    return this._numero;
  }

  void setsymbole(symbole) {
    this._symbole = symbole;
  }
}
