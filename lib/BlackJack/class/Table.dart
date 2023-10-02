import 'Carte.dart';

class Tablee {
  List<Carte> _table = [];

  Tablee();


  List<Carte> getMain() {
    return this._table;
  }

  void addToMain(Carte carte) {
    this._table.add(carte);
  }

  Carte getCardOnTable(int index) {
    return this._table[index];
  }

  bool isEmpty(){
    return this._table.isEmpty;
  }

  void reset(){
    _table = [];
  }
}
