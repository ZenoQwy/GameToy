import 'Cartes.dart';

class Attaque extends Carte {
  String _type;
  List<String> _lesAttaques = ["panne","feurouge","limitation","crevaison","accident"];

  Attaque(this._type){
    if(!this._type.toString() in _lesAttaques){
      throw ArgumentError("type cannot be null");
    }else{
    }
  }

  @override
  String getType() {
    return this._type;
  }

  @override
  String infos() {
    return super.infos() + this._type;
  }
}

// Panne
// Feu rouge
// Limitation
// Crevaison
// Accident
