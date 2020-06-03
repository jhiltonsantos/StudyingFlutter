import 'package:flutter/material.dart';
import 'package:climaapp/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.currentLongitude);
    print(location.currentLatitude);
  }

  void getData() async {
    http.Response getAPI = await http.get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02');
    print(getAPI.body);
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
                getData();
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
