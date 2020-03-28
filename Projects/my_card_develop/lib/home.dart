import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'colors.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: darkPrimary,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/perfil.jpg'),
              ),
              SizedBox(
                child: Divider(),
              ),
              Text(
                'Hilton Santos',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: darkPrimaryPurple,
                ),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  fontFamily: 'Play',
                  color: darkSecondaryText,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 170.0,
                child: Divider(
                  color: darkSecondaryText,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                color: darkSecondary,
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: darkPrimaryPurple,
                  ),
                  title: Text(
                    '+55 86 9 9458 3369',
                    style: TextStyle(
                      color: darkPrimaryPurple,
                      fontFamily: 'Play',
                      fontSize: 15.0,
                    ),
                  ),
                  trailing: Icon(
                    Icons.more_vert,
                    color: darkPrimaryPurple,
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                color: darkSecondary,
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: darkPrimaryPurple,
                  ),
                  title: Text(
                    'jhilton930@gmail.com',
                    style: TextStyle(
                      color: darkPrimaryPurple,
                      fontFamily: 'Play',
                      fontSize: 15.0,
                    ),
                  ),
                  trailing: Icon(
                    Icons.more_vert,
                    color: darkPrimaryPurple,
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                color: darkSecondary,
                child: ListTile(
                  leading: Icon(
                    MdiIcons.github,
                    color: darkPrimaryPurple,
                  ),
                  title: Text(
                    'jhiltonsantos',
                    style: TextStyle(
                      color: darkPrimaryPurple,
                      fontFamily: 'Play',
                      fontSize: 15.0,
                    ),
                  ),
                  trailing: Icon(
                    Icons.more_vert,
                    color: darkPrimaryPurple,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
