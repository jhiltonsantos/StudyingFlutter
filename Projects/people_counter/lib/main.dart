import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "People Counter", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Tem Vaga";

  void _changePeople(int delta) {
    setState(() {
      if (!(_people == 0 && delta == -1)) {
        if (_people < 20) {
          _people += delta;
          if (_people == 20) {
            _infoText = "Lotado!!!";
          } else {
            _infoText = "Tem Vaga";
          }
        } else if (_people >= 20 && delta != 1) {
          _people += delta;
        } else {
          _infoText = "Lotado!!!";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/bgApp.png",
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    child: Text("+1",
                        style:
                            TextStyle(fontSize: 40.0, color: Colors.redAccent)),
                    onPressed: () {
                      _changePeople(1);
                    },
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(15.0),
                    child: FlatButton(
                      child: Text("-1",
                          style: TextStyle(
                              fontSize: 40.0, color: Colors.lightGreenAccent)),
                      onPressed: () {
                        _changePeople(-1);
                      },
                    ))
              ],
            ),
            Text(_infoText,
                style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontSize: 30.0))
          ],
        )
      ],
    );
  }
}
