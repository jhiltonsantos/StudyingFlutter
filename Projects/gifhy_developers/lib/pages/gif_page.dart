import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gifhydevelopers/colors.dart';
import 'package:share/share.dart';


class GifPage extends StatelessWidget {
  final Map _gifData;

  GifPage(this._gifData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          _gifData["title"],
          textAlign: TextAlign.center,
          style: TextStyle(
            color: darkPrimaryPurple,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            color: darkPrimaryPurple,
            onPressed: (){
              Share.share(_gifData["images"]["fixed_height"]["url"]);
            },
          )
        ],
      ),
      backgroundColor: darkPrimary,
      body: Center(
        child: Image.network(_gifData["images"]["fixed_height"]["url"]),
      ),
    );
  }
}
