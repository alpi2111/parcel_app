import 'package:flutter/material.dart';

//paginas
import 'package:parcel_app/src/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parcel Dashboard',
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
      },
    );
  }
}
