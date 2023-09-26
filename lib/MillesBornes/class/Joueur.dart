import 'TypeOFCartes/Cartes.dart';

class Joueur {
  int _numero;
  String _pseudo;
  List<Carte> _main = [];

  // Malus
  bool _feurouge = false;
  bool _accident = false;
  bool _panne = false;
  bool _crevaison = false;
  bool _limitation = false;

  // Immunité
  bool _Immuneaccident = false;
  bool _Immunepanne = false;
  bool _Immunecrevaison = false;
  bool _Immunelimitation = false;

  Joueur(this._pseudo, this._numero);

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
}
