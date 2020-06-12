import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:raspberrypifetch/services/get_raspberry_data.dart';

class Loading extends StatefulWidget {
  @override
  LoadingState createState() => LoadingState();
}

class LoadingState extends State<Loading> {

  void setupTemperature() async{
    GetRaspberryData instance = GetRaspberryData(url: 'current-temperature');
    await instance.getTemperature();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'currentTemp': instance.currentTemp,
    });
  }

  @override
  void initState() {
    super.initState();
    setupTemperature();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.cyan[100], Colors.white],
            )
        ),
        child: Center(
          child: SpinKitPouringHourglass(
            color: Colors.blueGrey[800],
            size: 50.0,
          ),
        ),
      ),
    );
  }

}
