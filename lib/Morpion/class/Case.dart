class Case {
  String _element;

  Case(this._element);

  String getvaleur() {
    return this._element;
  }

  bool estvide() {
    if (this._element != "") {
      return false;
    } else {
      return true;
    }
  }

  void setelement(element) {
    this._element = element;
  }
}
