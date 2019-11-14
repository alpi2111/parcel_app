import 'package:flutter/material.dart';

mostrarCargando(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    child: AlertDialog(
      title: Text('Cargando...'),
      content: CircularProgressIndicator(),
    ),
  );
}

mostrarInicioCorrecto(BuildContext context, String mensaje, bool correcto) {
  showDialog(
    context: context,
    barrierDismissible: false,
    child: AlertDialog(
      title: Text('Información'),
      content: Text(mensaje),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Ok'),
        ),
      ],
    ),
  );
}
