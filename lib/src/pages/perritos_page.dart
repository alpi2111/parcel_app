import 'package:flutter/material.dart';
import 'package:parcel_app/src/providers/perritos_provider.dart';

class PerritosPage extends StatefulWidget {
  PerritosPage({Key key}) : super(key: key);

  @override
  _PerritosPageState createState() => _PerritosPageState();
}


//TODO https://bit.ly/33H1DrZ

class _PerritosPageState extends State<PerritosPage> {
  final _perrito = PerritosProvider();
  final List<int> indices = List<int>();
  int i = 0;
  @override
  Widget build(BuildContext context) {
    //_perrito.obtenerPerritos(5);
    return Scaffold(
      appBar: AppBar(
        title: Text('Future Perritos'),
      ),
      body: FutureBuilder(
        future: _perrito.obtenerPerritos(10),
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return RefreshIndicator(
              onRefresh: () {
                //print('onRefresh');
                setState(() {});
                return _perrito.obtenerPerritos(10);
              },
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int i) {
                  return FadeInImage(
                    image: NetworkImage(snapshot.data[i]),
                    fit: BoxFit.fitWidth,
                    placeholder: AssetImage('assets/backinout_loading.gif'),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
