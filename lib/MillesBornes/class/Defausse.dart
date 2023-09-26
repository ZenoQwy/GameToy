import 'TypeOFCartes/Cartes.dart';

class Pioche {
  List<Carte> _pioche = [];

  // Renvoie la pioche
  getPioche() {
    return this._pioche;
  }

  // Ajoute une carte à la pioche
  addCarte(Carte carte) {
    this._pioche.add(carte);
  }

  // Permet de piocher une carte de la pioche.
  // La carte de la pioche retiré afin que celle-ci soit mise dans la main d'un joueur.
  piocher() {
    Carte retire = this._pioche.removeAt(0);
    return retire;
  }

  // Mélanger la pioche
  melanger() {
    this._pioche.shuffle();
  }
}
