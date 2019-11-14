import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:parcel_app/src/models/login_modelo.dart';

class LoginProvider {
  final _key = 'AIzaSyDQiWJQRK0VwTOT31nwH8iTxH297btAh_I';

  Future registrarUsuario(LoginModelo modelo) async {
    final urlRegistro =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_key';

    final Map<String, dynamic> datos = {
      "email": modelo.usuario,
      "password": modelo.pass,
      "returnSecureToken": true
    };

    final response =
        await http.post(urlRegistro, body: LoginModelo.fromJson(datos));

    final decodedResp = json.decode(response.body);
    print(decodedResp);
  }

  Future<Map<String, dynamic>> loginUsuario(String email, String pass) async {
    final urlRegistro =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_key';

    final Map<String, dynamic> datos = {
      "email": email,
      "password": pass,
      "returnSecureToken": true
    };

    final response = await http.post(urlRegistro, body: json.encode(datos));

    final decodedResp = json.decode(response.body);
    if(decodedResp != null) {
      if(decodedResp['idToken'] != null)
        return {'ok':true, 'token': decodedResp['token']};
    }
    return {'ok': false};
  }
}
