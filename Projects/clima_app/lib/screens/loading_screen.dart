import 'package:flutter/material.dart';
import 'package:climaapp/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.currentLongitude);
    print(location.currentLatitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: FlatButton(
              onPressed: () {
                getLocation();
              },
              color: Colors.indigoAccent,
              child: Text('Get Location'),
            ),
          )
        ],
      ),
    );
  }
}
