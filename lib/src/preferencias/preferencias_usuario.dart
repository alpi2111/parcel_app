import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del usuario

  bool get estaLogueado {
    return _prefs.getBool('isLogin') ?? false;
  }
  
  set estaLogueado(bool valor) {
    _prefs.setBool('isLogin', valor);
  }
}
