import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color purpleBG = Color.fromRGBO(40, 20, 44, 20);
  Color orangeTx = Color.fromRGBO(238, 165, 64, 20);

  List _toDoList = [];

  void _addToList() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleBG,
      appBar: AppBar(
        title: Text(
          "Listagem de Tarefas",
          style: TextStyle(color: orangeTx),
        ),
        backgroundColor: purpleBG.withRed(45),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Nova Tarefa",
                      labelStyle: TextStyle(color: orangeTx),
                    ),
                  ),
                ),
                RaisedButton(
                  color: orangeTx,
                  child: Text("ADD"),
                  textColor: purpleBG,
                  onPressed: () {},
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 10.0),
                itemCount: _toDoList.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(_toDoList[index]["title"]),
                    value: _toDoList[index]["ok"],
                    secondary: CircleAvatar(
                      child: Icon(
                          _toDoList[index]["ok"] ? Icons.check : Icons.error),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/tasks.json");
  }

  Future<File> _saveTask() async {
    String data = json.encode(_toDoList);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsStringSync();
    } catch (e) {
      return null;
    }
  }
}
