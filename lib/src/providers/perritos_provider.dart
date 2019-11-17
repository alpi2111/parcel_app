import 'dart:convert';

import 'package:http/http.dart' as http;

class PerritosProvider {
  List<String> message;
  String status;

  final _url = 'https://dog.ceo/api/breed/husky/images/random';

  PerritosProvider({
    this.message,
    this.status,
  });

  Future<List<String>> obtenerPerritos(int cantidad) async {

    final url = "$_url/$cantidad";

    final response = await http.get(url);

    final Map<String, dynamic> decodedResp = json.decode(response.body);

    if (decodedResp == null) {
      return [];
    }

    //print(decodedResp['status']);

    List<String> listaPerritos = List<String>();
    
    for (var perrito in decodedResp['message']) {
      //print(perrito);
      listaPerritos.add(perrito);
    }

    return listaPerritos;
  }
}
