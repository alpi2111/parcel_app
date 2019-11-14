import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _estaVisible = false;
  final _estiloTituloTxt = TextStyle(
    fontSize: 50.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  final TextStyle _estiloSubtituloTxt = TextStyle(
      fontSize: 30.0,
      color: Colors.white70,
      fontStyle: FontStyle.italic);
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
                fit: BoxFit.fitHeight
              ),
            ),
          ),
          //Aqui comienza todo lo que no es la imagen
          SafeArea(
            child: Container(
              child: Column(
                children: <Widget>[
                  _crearTitulos(),
                  _crearForm(),
                  _crearCuenta(),
                ],
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
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            _crearInputLogin(),
            SizedBox(height: 20.0),
            _crearInputPassword(),
            FlatButton(
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
    return TextField(
      //col
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Correo',
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget _crearInputPassword() {
    return TextField(
      obscureText: _estaVisible ? false : true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          labelText: 'Contraseña',
          prefixIcon: Icon(Icons.lock),
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
    );
  }

  Widget _crearCuenta() {
    return Column(
      children: <Widget>[
        Text(
          '¿No tienes una cuenta?',
          style: TextStyle(color: Colors.white),
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
}
