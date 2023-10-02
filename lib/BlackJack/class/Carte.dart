import 'dart:io';
import 'A Functions.dart';

class Carte {
  String _couleur;
  String _valeur;
  bool _retournee = true ;

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

  bool estRetournee(){
    return this._retournee;
  }

  void setRetournee(bool choice){
    this._retournee = choice;
  }


  void retourner(){
    this._retournee = !_retournee;
  }

  @override
  String toString() {
    return "${_valeur.toString()} de $_couleur";
  }
}
