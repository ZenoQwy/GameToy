import 'Cartes.dart';

class Defense extends Carte {
  String _type;

  Defense(this._type);

  @override
  String getType() {
    return this._type;
  }

  @override
  String infos() {
    return super.infos() + this._type;
  }
}

// reparation
// roue de secours
// fin de limitation
// feu vert
// essence