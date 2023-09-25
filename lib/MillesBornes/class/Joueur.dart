import 'dart:io';
import 'A Functions.dart';
import 'a revoir/TypeOFCartes/Cartes.dart';

class Joueur {
  int _numero;
  String _pseudo;
  List<Carte> _main = [];

  Joueur(this._pseudo,this._numero);

  String getPseudo() {
    return this._pseudo;
  }

  void setPseudo(pseudo) {
    this._pseudo = pseudo;
  }

  int getnumero() {
    return this._numero;
  }

  void setNumero(num) {
    this._numero = num;
  }
}
