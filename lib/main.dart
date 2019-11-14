import 'package:flutter/material.dart';
import 'package:parcel_app/src/pages/home_page.dart';

//paginas
import 'package:parcel_app/src/pages/login_page.dart';
import 'package:parcel_app/src/preferencias/preferencias_usuario.dart';

void main() async {
  final prefs = PreferenciasUsuario();
  await prefs.initPrefs();
  //print(prefs.instance);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefe = PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    //print(prefe.instance);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parcel Dashboard',
      initialRoute: prefe.estaLogueado ? 'home' : 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'home': (BuildContext context) => HomePage(),
      },
    );
  }
}
