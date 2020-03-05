import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request_finance = "https://api.hgbrasil.com/finance?key=c012f8b5";

void main() async {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
        hintColor: Colors.amber,
        primaryColor: Colors.black,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amberAccent)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          hintStyle: TextStyle(color: Colors.amber),
        )),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double dollar;
  double euro;

  final realController = TextEditingController();
  final dollarController = TextEditingController();
  final euroController = TextEditingController();

  void _realChanged(String text){

  }
  void _dollarChanged(String text){

  }
  void _euroChanged(String text){

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
          title: Text("Conversor de Moedas",
              style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.amberAccent,
          centerTitle: true),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                  child: Text(
                "Carregando Dados...",
                style: TextStyle(color: Colors.black, fontSize: 25.0),
                textAlign: TextAlign.center,
              ));
            default:
              if (snapshot.hasError) {
                return Center(
                    child: Text(
                  "Error ao Carregar os Dados...",
                  style: TextStyle(color: Colors.black, fontSize: 25.0),
                  textAlign: TextAlign.center,
                ));
              } else {
                dollar = snapshot.data["results"]["currencies"]["USD"]["buy"];
                euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];
                return SingleChildScrollView(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Icon(Icons.attach_money,
                          size: 150, color: Colors.amberAccent),
                      builderTextField("Reais", "R\$", realController),
                      Divider(),
                      builderTextField("Dolares", "US\$", dollarController),
                      Divider(),
                      builderTextField("Euro", "€", euroController),
                    ],
                  ),
                );
              }
          }
        },
      ),
    );
  }
}

Future<Map> getData() async {
  http.Response response = await http.get(request_finance);
  return json.decode(response.body);
}

Widget builderTextField(
    String text, String prefix, TextEditingController control) {
  return TextFormField(
      controller: control,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: text,
          labelStyle: TextStyle(color: Colors.amberAccent, fontSize: 30.0),
          border: OutlineInputBorder(),
          prefixText: prefix),
      style: TextStyle(color: Colors.amberAccent, fontSize: 25.0));
}
