import 'package:flutter/material.dart';
import 'Carte.dart';
import 'package:game_toy/BlackJack/class/Croupier.dart';
import 'package:game_toy/BlackJack/class/Joueur.dart';
import 'package:game_toy/BlackJack/class/Pioche.dart';
import 'package:game_toy/BlackJack/class/Table.dart';

class Partie {
  bool _terminee = false;
  String _gagnant = "";
  Joueur _joueur = new Joueur();
  Croupier _croupier = new Croupier();
  Pioche _pioche = new Pioche();
  Tablee _table = new Tablee();

  void initialisation(){
    this._pioche.fillPioche();
  }

  Pioche getPioche() {
    return this._pioche;
  }

  Joueur getJoueur() {
    return this._joueur;
  }

  Croupier getCroupier() {
    return this._croupier;
  }

  bool estTerminee() {
    return this._terminee;
  }

  String getGagnant(){
    return this._gagnant;
  }

  Tablee getTable() {
    return this._table;
  }

  void TableePioche(){
    this._table.addToMain(_pioche.piocher());
  }
}

