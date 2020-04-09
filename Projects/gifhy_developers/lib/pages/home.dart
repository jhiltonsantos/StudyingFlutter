import 'package:flutter/material.dart';
import 'package:gifhydevelopers/pages/api.dart';
import 'package:gifhydevelopers/colors.dart';
import 'package:gifhydevelopers/pages/gif_page.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;
  int _offset = 0;

  @override
  void initState() {
    super.initState();

    getGifs(_search, _offset).then((map) {
      print(map);
    });
  }

  Future<Null> _refreshList() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      _offset += 20;
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          'images/giphy_logo.gif',
          width: 500,
          height: 100,
          alignment: Alignment.centerLeft,
        ),
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
                labelStyle: TextStyle(color: darkPrimaryPurple, fontSize: 18.0),
                border: OutlineInputBorder(),
                focusColor: darkPrimaryPurple,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  borderSide: BorderSide(color: darkPrimaryPurple),
                ),
              ),
              style: TextStyle(color: Colors.blueAccent[200], fontSize: 18.0),
              textAlign: TextAlign.center,
              onSubmitted: (text) {
                setState(() {
                  _search = text;
                  _offset = 0;
                });
              },
            ),
          ),
          Expanded(
            child: RefreshIndicator(
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
              onRefresh: _refreshList,
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
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: snapshot.data["data"][index]["images"]["fixed_height"]["url"],
          height: 300.0,
          fit: BoxFit.cover,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GifPage(snapshot.data["data"][index]),
            ),
          );
        },
        onLongPress: () {
          Share.share(
              snapshot.data["data"][index]["images"]["fixed_height"]["url"]);
        },
      );
    },
  );
}
