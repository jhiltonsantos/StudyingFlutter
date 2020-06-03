import 'package:climaapp/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:climaapp/services/location.dart';
import 'package:climaapp/utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.currentLatitude;
    longitude = location.currentLongitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();
  }

  void getData() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: FlatButton(
              onPressed: () {
                getLocationData();
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
