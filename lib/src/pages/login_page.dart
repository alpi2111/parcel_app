import 'package:flutter/material.dart';

import 'dart:ui';

import 'package:parcel_app/src/models/login_modelo.dart';
import 'package:parcel_app/src/preferencias/preferencias_usuario.dart';
import 'package:parcel_app/src/providers/login_provider.dart';

import 'package:parcel_app/src/utils/utils.dart' as utils;

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _keyFormLogin = GlobalKey<FormState>();
  final _provider = LoginProvider();
  final _modelo = LoginModelo();

  final pref = new PreferenciasUsuario();

  bool _estaVisible = false;

  final _estiloTituloTxt = TextStyle(
    fontSize: 50.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  final TextStyle _estiloSubtituloTxt = TextStyle(
      fontSize: 30.0, color: Colors.white70, fontStyle: FontStyle.italic);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bg_login.jpg'),
                  fit: BoxFit.fitHeight),
            ),
          ),
          //Aqui comienza todo lo que no es la imagen
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: SafeArea(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(height: 40.0),
                    _crearTitulos(),
                    _crearForm(),
                    _crearCuenta(),
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      child: FlatButton(
                        color: Colors.deepOrange,
                        child: Text(
                          'Iniciar Sesión',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          _hacerSubmit();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearTitulos() {
    return Column(
      children: <Widget>[
        Text(
          'Travelers',
          style: _estiloTituloTxt,
        ),
        Text(
          'Travel Community App',
          style: _estiloSubtituloTxt,
        )
      ],
    );
  }

  Widget _crearForm() {
    return Form(
      key: _keyFormLogin,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            _crearInputLogin(),
            SizedBox(height: 20.0),
            _crearInputPassword(),
            FlatButton(
              color: Colors.orange.withOpacity(0.5),
              child: Text(
                '¿Olvidaste tu contraseña?',
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearInputLogin() {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: Colors.orange),
      child: TextFormField(
        onSaved: (valor) {
          _modelo.usuario = valor;
        },
        validator: (valor) {
          if (valor == '')
            return 'Debe ingresar datos';
          else
            return null;
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          fillColor: Colors.blue[50].withOpacity(0.5),
          filled: true,
          labelText: 'Correo',
          prefixIcon: Icon(
            Icons.email,
            color: Colors.orange,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  Widget _crearInputPassword() {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: Colors.orange),
      child: TextFormField(
        onSaved: (valor) {
          _modelo.pass = valor;
        },
        validator: (valor) {
          if (valor == '')
            return 'Debe ingresar datos';
          else
            return null;
        },
        obscureText: _estaVisible ? false : true,
        decoration: InputDecoration(
            fillColor: Colors.blue[50].withOpacity(0.5),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            labelText: 'Contraseña',
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.orange,
            ),
            suffixIcon: IconButton(
              icon: _estaVisible
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
              onPressed: () {
                _estaVisible
                    ? setState(() {
                        _estaVisible = false;
                      })
                    : setState(() {
                        _estaVisible = true;
                      });
              },
            )),
      ),
    );
  }

  Widget _crearCuenta() {
    return Column(
      children: <Widget>[
        Text(
          '¿No tienes una cuenta?',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              backgroundColor: Colors.orange.withOpacity(0.5)),
        ),
        FlatButton(
          child: Text(
            'Crear una',
            style: TextStyle(
                color: Colors.deepOrange,
                fontStyle: FontStyle.italic,
                fontSize: 20.0),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Future<bool> _hacerSubmit() async {
    if(!_keyFormLogin.currentState.validate()) return false;

    _keyFormLogin.currentState.save();

    utils.mostrarCargando(context);
    Map<String, dynamic> respuesta = await _provider.loginUsuario(_modelo.usuario, _modelo.pass);

    if(respuesta['ok']) {
      pref.estaLogueado = true;
      Navigator.pop(context);
      utils.mostrarInicioCorrecto(context, 'Correcto', true);
      Navigator.pop(context);
      Navigator.of(context).pushReplacementNamed('home');
    } else {
      pref.estaLogueado = false;
      Navigator.pop(context);
      utils.mostrarInicioCorrecto(context, 'Incorrecto', true);
    }
    //(pref.estaLogueado);
    //await utils.mostrarInicioCorrecto(context, 'mensaje', true);

    return true;
  }
}
