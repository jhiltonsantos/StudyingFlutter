import 'package:flutter/material.dart';
import 'package:gifhydevelopers/pages/api.dart';
import 'package:gifhydevelopers/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;
  int _offset;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkPrimaryText,
        title: Image.network(
            'https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif'),
        centerTitle: true,
      ),
      backgroundColor: darkPrimary,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  fillColor: darkPrimaryPurple,
                  labelText: 'Pesquisar',
                  labelStyle:
                      TextStyle(color: darkPrimaryPurple, fontSize: 18.0),
                  border: OutlineInputBorder(),
                  focusColor: darkPrimaryPurple,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: darkPrimaryPurple))),
              style: TextStyle(color: Colors.blueAccent[200], fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: getGifs(_search, _offset),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return Container(
                      width: 70.0,
                      height: 70.0,
                      alignment: Alignment.center,
                      child: Image.asset("images/loading.gif"),
                    );
                  default:
                    if (snapshot.hasError) {
                      return Container();
                    } else {
                      return _createGifTable(context, snapshot);
                    }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _createGifTable(BuildContext context, AsyncSnapshot snapshot) {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
    ),
    itemCount: snapshot.data["data"].length,
    itemBuilder: (context, index) {
      return GestureDetector(
        child: Image.network(
          snapshot.data["data"][index]["images"]["fixed_height"]["url"],
          width: 300.0,
          fit: BoxFit.cover,
        ),
      );
    },
  );
}
