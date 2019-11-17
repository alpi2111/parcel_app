import 'package:flutter/material.dart';

//paginas
import 'package:parcel_app/src/pages/home_page.dart';
import 'package:parcel_app/src/pages/animated_container_page.dart';
import 'package:parcel_app/src/pages/login_page.dart';
import 'package:parcel_app/src/pages/perritos_page.dart';
import 'package:parcel_app/src/pages/swiper_page.dart';

import 'package:parcel_app/src/preferencias/preferencias_usuario.dart';

void main() async {
  final prefs = PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefe = PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parcel Dashboard',
      initialRoute: prefe.estaLogueado ? 'home' : 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'home': (BuildContext context) => HomePage(),
        'animated_container': (BuildContext context) => AnimatedContainerPage(),
        'swiper': (BuildContext context) => SwiperPage(),
        'perritos': (BuildContext context) => PerritosPage(),
      },
      theme: ThemeData(
        primaryColor: Color.fromRGBO(13, 102, 38, 1.0),
        primaryColorLight: Color.fromRGBO(242, 178, 54, 1.0),
        primaryColorDark: Color.fromRGBO(25, 25, 25, 1.0),
        accentColor: Color.fromRGBO(240, 144, 55, 1.0),
        textTheme: TextTheme(
          display1: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          subtitle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
