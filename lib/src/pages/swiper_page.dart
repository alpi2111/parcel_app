import 'package:flutter/material.dart';
import 'package:liquid_swipe/Constants/Helpers.dart';

import 'package:liquid_swipe/liquid_swipe.dart';

class SwiperPage extends StatefulWidget {
  @override
  _SwiperPageState createState() => _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage> {
  //AQUI ESTARAN TODAS LAS PAGINAS QUE QUIERO VER
  static final _style = TextStyle(color: Colors.white, fontSize: 30.0);
  final _pages = [
    Container(
      color: Colors.cyan,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(),
            Text(
              'Primer Pagina',
              style: _style,
            )
          ],
        ),
      ),
    ),
    Container(
      color: Colors.deepPurple,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(),
            Text(
              'Segunda Pagina',
              style: _style,
            )
          ],
        ),
      ),
    ),
    Container(
      color: Colors.deepOrange,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(),
            Text(
              'Tercera Pagina',
              style: _style,
            )
          ],
        ),
      ),
    ),
    Container(
      color: Colors.deepOrangeAccent,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(),
            Text(
              'Cuarta Pagina',
              style: _style,
            )
          ],
        ),
      ),
    ),
    Container(
      color: Colors.pink,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(),
            Text(
              'Quinta Pagina',
              style: _style,
            )
          ],
        ),
      ),
    ),
    Container(
      color: Colors.brown,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(),
            Text(
              'Sexta Pagina',
              style: _style,
            )
          ],
        ),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LiquidSwipe(
        waveType: WaveType.liquidReveal,
        currentUpdateTypeCallback: (tipo) {
          //print(tipo);
          if(tipo == UpdateType.animating) {
            print('animating');
          } else if (tipo == UpdateType.doneAnimating) {
            print('done animating');
          }
        },
        pages: _pages,
        fullTransitionValue: 500.0,
        enableLoop: true,
        enableSlideIcon: true,
        positionSlideIcon: 0.25,
        slideIconWidget: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 60.0,
        ),
        onPageChangeCallback: (indice) {
          print(indice);
        },
      ),
    );
  }
}
