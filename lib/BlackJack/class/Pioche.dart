import 'Carte.dart';

class Pioche {
  List<Carte> _pioche = [Carte("Trèfle", "As"),Carte("Coeur", "As"),Carte("Carreau", "As"),Carte("Pique", "As"),];
  Pioche();

  void fillPioche(){
    _pioche.add(Carte("Trèfle", "As"));
    _pioche.add(Carte("Trèfle", "2"));
  }

  Carte piocher(){
      return this._pioche.removeAt(0);
  }

  List<Carte> getCards(){
    return this._pioche;
  }

  int getPiocheLengh(){
    return this._pioche.length;
  }

  Carte getCardInPioche(int index) {
    return this._pioche[index];
  }


  void hideAllCard(int i){
    for(Carte cards in _pioche){
      cards.setRetournee(true);
    }
  }

  void revealAllCard(int i){
    for(Carte cards in _pioche){
      cards.setRetournee(false);
    }
  }

  void returnOneCard(int i){
    this._pioche[i].retourner();
  }

  void melanger(){
    this._pioche.shuffle();
  }

  bool isEmpty(){
    return this._pioche.isEmpty;
  }

}
