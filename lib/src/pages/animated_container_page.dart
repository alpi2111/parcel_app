import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  _AnimatedContainerPageStatePage createState() => _AnimatedContainerPageStatePage();
}

class _AnimatedContainerPageStatePage extends State<AnimatedContainerPage> {
  double _width = 100.0;
  double _height = 100.0;
  Color _color = Colors.brown;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(20.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
      ),
      body: Center(child: _crearFigura()),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: _animarFigura,
      ),
    );
  }

  Widget _crearFigura() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: _width,
      height: _height,
      decoration: BoxDecoration(
        color: _color,
        borderRadius: _borderRadius,
      ),
      curve: Curves.bounceOut
    );
  }

  void _animarFigura() {
    final random = Random();
    setState(() {
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(256), random.nextInt(256), random.nextInt(256), 1
          );
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}