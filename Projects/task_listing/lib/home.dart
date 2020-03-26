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

  final _addStringValue = TextEditingController();

  List _toDoList = [];
  Map<String, dynamic> _lastRemoved;
  int _lastRemovedPosition;

  // Retornar os valores salvos no JSON
  @override
  void initState() {
    super.initState();

    _readData().then((data) {
      setState(() {
        _toDoList = json.decode(data);
      });
    });
  }

  void _addToList() {
    setState(() {
      Map<String, dynamic> newAddToList = Map();
      newAddToList["title"] = _addStringValue.text;
      newAddToList["ok"] = false;

      _addStringValue.text = "";
      _toDoList.add(newAddToList);
      _saveTask(_toDoList);
    });
  }

  Future<Null> _refreshList() async {
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      _toDoList.sort((v1, v2) {
      if (v1["ok"] && !v2["ok"])
        return 1;
      else if (v1["ok"] && v2["ok"])
        return 0;
      else
        return -1;
    });

    _saveTask(_toDoList);
    });
    
    return null;
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
                    
                    
                    controller: _addStringValue,
                    decoration: InputDecoration(
                      labelText: "Nova Tarefa",
                      labelStyle: TextStyle(color: orangeTx),
                    ),
                    style: TextStyle(color: orangeTx),
                  ),
                ),
                RaisedButton(
                  color: orangeTx,
                  child: Text("ADD"),
                  textColor: purpleBG,
                  onPressed: _addToList,
                )
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
                child: ListView.builder(
                    padding: EdgeInsets.only(top: 10.0),
                    itemCount: _toDoList.length,
                    itemBuilder: builItem),
                onRefresh: _refreshList),
          )
        ],
      ),
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/tasks.json");
  }

  Future<File> _saveTask(listData) async {
    String data = json.encode(listData);
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

  Widget builItem(context, index) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(
            Icons.delete,
            color: purpleBG,
          ),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: CheckboxListTile(
        title: Text(
          _toDoList[index]["title"],
          style: TextStyle(color: orangeTx),
        ),
        value: _toDoList[index]["ok"],
        secondary: CircleAvatar(
          child: _toDoList[index]["ok"]
              ? Icon(Icons.check, color: purpleBG)
              : Icon(Icons.error, color: purpleBG),
        ),
        onChanged: (check) {
          setState(() {
            _toDoList[index]["ok"] = check;
            _saveTask(_toDoList);
          });
        },
      ),
      onDismissed: (direction) {
        setState(() {
          // auxiliar para salvar a posição do item
          _lastRemoved = Map.from(_toDoList[index]);
          _lastRemovedPosition = index;
          _toDoList.removeAt(index);

          _saveTask(_toDoList);

          final snack = SnackBar(
            content: Text("Tarefa: \"${_lastRemoved["title"]}\" removida!"),
            action: SnackBarAction(
                label: "Undo",
                onPressed: () {
                  setState(() {
                    _toDoList.insert(_lastRemovedPosition, _lastRemoved);
                    _saveTask(_toDoList);
                  });
                }),
            duration: Duration(seconds: 2),
          );
          Scaffold.of(context).removeCurrentSnackBar();
          Scaffold.of(context).showSnackBar(snack);
        });
      },
    );
  }
}
