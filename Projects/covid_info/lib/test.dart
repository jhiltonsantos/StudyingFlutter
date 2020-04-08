import 'package:flutter/material.dart';
import 'package:covidinfo/colors.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkPrimary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage('images/covid.png'),
              backgroundColor: darkPrimary,
            ),
            SizedBox(
              height: 20.0,
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              color: darkPrimaryText,
              child: ListTile(
                leading: Icon(
                  Icons.calendar_today,
                  color: Colors.redAccent[100],
                ),
                title: Text(
                  'Atualizado em... 7 de abril, 2020',
                  style: TextStyle(
                    color: Colors.redAccent[100],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              color: darkPrimaryText,
              child: ListTile(
                leading: Icon(
                  Icons.album,
                  color: Colors.redAccent[100],
                ),
                title: Text(
                  '1.388.591 Casos',
                  style: TextStyle(color: Colors.redAccent[100]),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              color: darkPrimaryText,
              child: ListTile(
                leading: Icon(
                  Icons.adjust,
                  color: Colors.redAccent[100],
                ),
                title: Text(
                  '1.018.027 Doentes',
                  style: TextStyle(color: Colors.redAccent[100]),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              color: darkPrimaryText,
              child: ListTile(
                leading: Icon(
                  Icons.autorenew,
                  color: Colors.redAccent[100],
                ),
                title: Text(
                  '289.113 Recuperados',
                  style: TextStyle(
                    color: Colors.redAccent[100],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              color: darkPrimaryText,
              child: ListTile(
                leading: Icon(
                  Icons.cancel,
                  color: Colors.redAccent[100],
                ),
                title: Text(
                  '81.451 Mortes',
                  style: TextStyle(color: Colors.redAccent[100]),
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
