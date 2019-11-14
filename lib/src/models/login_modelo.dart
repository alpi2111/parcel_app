// To parse this JSON data, do
//
//     final loginModelo = loginModeloFromJson(jsonString);

import 'dart:convert';

LoginModelo loginModeloFromJson(String str) => LoginModelo.fromJson(json.decode(str));

String loginModeloToJson(LoginModelo data) => json.encode(data.toJson());

class LoginModelo {
    String usuario;
    String pass;
    String idUsuario;

    LoginModelo({
        this.usuario,
        this.pass,
        this.idUsuario,
    });

    factory LoginModelo.fromJson(Map<String, dynamic> json) => LoginModelo(
        usuario: json["usuario"],
        pass: json["pass"],
        idUsuario: json["id_usuario"],
    );

    Map<String, dynamic> toJson() => {
        "usuario": usuario,
        "pass": pass,
        "id_usuario": idUsuario,
    };
}
