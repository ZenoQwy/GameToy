import 'Cartes.dart';

class Immunite extends Carte {
  String _type;

  Immunite(this._type);

  @override
  String getType() {
    return this._type;
  }

  @override
  String infos() {
    // TODO: implement infos
    return super.infos() + this._type;
  }
}
