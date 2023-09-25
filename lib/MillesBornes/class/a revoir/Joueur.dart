
import 'dart:io';

import 'TypeOFCartes/Cartes.dart';
import 'TypeOFCartes/AttaqueCarte.dart';
import 'TypeOFCartes/DistanceTypeCarte.dart';
import 'TypeOFCartes/ImmuniteTypeCarte.dart';

class Joueur {
  int _num;

  bool _feurouge = false;
  bool _accident = false;
  bool _panne = false;
  bool _crevaison = false;
  bool _limitation = false;

  List<Carte> _main = [Attaque("panne")];

  Joueur(this._num);

  int getNum() {
    return this._num;
  }

  setNum(int i) {
    this._num = i;
  }

  bool getFeuRouge() {
    return this._feurouge;
  }

  bool getAccident() {
    return this._accident;
  }

  bool getPanne() {
    return this._panne;
  }

  bool getCrevaison() {
    return this._crevaison;
  }

  bool getLimitation() {
    return this._limitation;
  }

  List<Carte> getMain() {
    return this._main;
  }

  afficherMain() {
    for (Carte carte in this._main) {
      stdout.writeln("${carte.infos()}");
      print("");
    }
  }

  Carte tirerCarte(int i){
    Carte cartee = this._main.removeAt(i);
    print(cartee.infos());
    return cartee; 
  }
}
