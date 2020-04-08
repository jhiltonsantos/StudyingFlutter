import 'package:covidinfo/api_covid.dart';
import 'package:flutter/material.dart';
import 'package:covidinfo/colors.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final tabs = [
    FutureBuilder<Map>(
      future: getData(),
      // ignore: missing_return
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(child: buildTextCharger("Carregando Dados..."));
          default:
            if (snapshot.hasError) {
              return Center(child: buildTextCharger("Erro ao carregar dados"));
            } else {
              int confirmed = snapshot.data["confirmed"]["value"];
              int deaths = snapshot.data["deaths"]["value"];
              int sick = confirmed - deaths;
              int recovered = snapshot.data["recovered"]["value"];

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
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        color: darkPrimaryText,
                        child: ListTile(
                          leading: Icon(
                            FontAwesomeIcons.virus,
                            color: Colors.redAccent[100],
                          ),
                          title: Text(
                            '$confirmed Casos',
                            style: TextStyle(color: Colors.redAccent[100]),
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        color: darkPrimaryText,
                        child: ListTile(
                          leading: Icon(
                            FontAwesomeIcons.lungsVirus,
                            color: Colors.redAccent[100],
                          ),
                          title: Text(
                            '$sick Doentes',
                            style: TextStyle(color: Colors.redAccent[100]),
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        color: darkPrimaryText,
                        child: ListTile(
                          leading: Icon(
                            Icons.autorenew,
                            color: Colors.redAccent[100],
                          ),
                          title: Text(
                            '$recovered Recuperados',
                            style: TextStyle(
                              color: Colors.redAccent[100],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        color: darkPrimaryText,
                        child: ListTile(
                          leading: Icon(
                            FontAwesomeIcons.cross,
                            color: Colors.redAccent[100],
                          ),
                          title: Text(
                            '$deaths Mortes',
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
      },
    ),
    FutureBuilder<Map>(
      future: getDataBrazil(),
      // ignore: missing_return
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(child: buildTextCharger("Carregando Dados..."));
          default:
            if (snapshot.hasError) {
              return Center(child: buildTextCharger("Erro ao carregar dados"));
            } else {
              int confirmed = snapshot.data["confirmed"]["value"];
              int deaths = snapshot.data["deaths"]["value"];
              int sick = confirmed - deaths;
              int recovered = snapshot.data["recovered"]["value"];

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
                        backgroundImage: AssetImage('images/brazil.png'),
                        backgroundColor: darkPrimary,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        color: darkPrimaryText,
                        child: ListTile(
                          leading: Icon(
                            FontAwesomeIcons.virus,
                            color: Colors.yellow[400],
                          ),
                          title: Text(
                            '$confirmed Casos',
                            style: TextStyle(color: Colors.yellow[400]),
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        color: darkPrimaryText,
                        child: ListTile(
                          leading: Icon(
                            FontAwesomeIcons.lungsVirus,
                            color: Colors.yellow[400],
                          ),
                          title: Text(
                            '$sick Doentes',
                            style: TextStyle(color: Colors.yellow[400]),
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        color: darkPrimaryText,
                        child: ListTile(
                          leading: Icon(
                            Icons.autorenew,
                            color: Colors.yellow[400],
                          ),
                          title: Text(
                            '$recovered Recuperados',
                            style: TextStyle(
                              color: Colors.yellow[400],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        color: darkPrimaryText,
                        child: ListTile(
                          leading: Icon(
                            FontAwesomeIcons.cross,
                            color: Colors.yellow[400],
                          ),
                          title: Text(
                            '$deaths Mortes',
                            style: TextStyle(color: Colors.yellow[400]),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
        }
      },
    ),
    Scaffold(
      backgroundColor: darkPrimary,
    ),
    FutureBuilder<Map>(
      future: getData(),
      // ignore: missing_return
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(child: buildTextCharger("Carregando Dados..."));
          default:
            if (snapshot.hasError) {
              return Center(child: buildTextCharger("Erro ao carregar dados"));
            } else {
              String lastUpdate = snapshot.data["lastUpdate"];
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
                        backgroundImage: AssetImage('images/github.png'),
                        backgroundColor: darkPrimary,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        color: darkPrimaryText,
                        child: ListTile(
                          leading: Icon(
                            Icons.calendar_today,
                            color: Colors.blue[300],
                          ),
                          title: Text(
                            'Atualizado em... $lastUpdate',
                            style: TextStyle(
                              color: Colors.blue[300],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        color: darkPrimaryText,
                        child: ListTile(
                          leading: Icon(
                            MdiIcons.api,
                            color: Colors.blue[300],
                          ),
                          title: Text(
                            'https://github.com/mathdroid/covid-19-api/tree/master/api',
                            style: TextStyle(
                              color: Colors.blue[300],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        color: darkPrimaryText,
                        child: ListTile(
                          leading: Icon(
                            MdiIcons.github,
                            color: Colors.blue[300],
                          ),
                          title: Text(
                            'jhiltonsantos',
                            style: TextStyle(
                              color: Colors.blue[300],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
        }
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          backgroundColor: darkPrimaryText,
          showElevation: true,
          itemCornerRadius: 8,
          curve: Curves.easeInBack,
          onItemSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavyBarItem(
              icon: Icon(FontAwesomeIcons.globeAmericas),
              title: Text('Mundo'),
              activeColor: Colors.redAccent[100],
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(FontAwesomeIcons.solidFlag),
              title: Text('Brasil'),
              activeColor: Colors.yellow[400],
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(FontAwesomeIcons.chartBar),
              title: Text('Estatísticas'),
              activeColor: Colors.lightGreenAccent,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(MdiIcons.information),
              title: Text('Sobre'),
              activeColor: Colors.blue[300],
              textAlign: TextAlign.center,
            )
          ]),
    );
  }
}

Widget buildTextCharger(String text) {
  return Scaffold(
    backgroundColor: darkPrimary,
    body: Center(
      child: Text(text,
          style: TextStyle(color: darkPrimaryPurple, fontSize: 25.0),
          textAlign: TextAlign.center),
    ),
  );
}
