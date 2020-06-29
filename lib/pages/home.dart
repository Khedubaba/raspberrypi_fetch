import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  Map data = {};
  String onOrOff = "off";


  bool newStatus = false;
  String ledValue = "0";

  Future sleep1() {
    return new Future.delayed(const Duration(seconds: 2));
  }

  void toggleSwitch(switchStatus){
    setState(() {
      newStatus = !newStatus;
      if (newStatus){
        onOrOff = "on";
        ledValue = "1";
      }
      else{
        onOrOff = "off";
        ledValue = "0";
      };
    });
    sleep1();
    var client = http.Client();
    try {
      var url = 'https://node-red-pritesh.eu-gb.mybluemix.net/LED-$onOrOff';
      client.post(url, body: json.encode({'msg.payload': ledValue}),
          headers: {'Content-type':'application/json'}).then((response){
//            print('msg.payload: ${newStatus.toString()}');
            print('msg.payload: $ledValue');
            print('URL: $url');
      });
    }
    catch(e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {

    //receiving data via routes.
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
//    print("data: " + data.toString());

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[500],
        title: Text(
          "CA6",
          style: TextStyle(
            color: Colors.grey[100],
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Current Temperature',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['currentTemp'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 200.0),
                Text(
                  "LED " + onOrOff,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 20.0),
                Transform.scale(
                  scale: 2.0,
                  child: new Switch(
                    onChanged: toggleSwitch,
                    value: newStatus,
                  ),
                ),

              ],
            ),
          ),
        ),
      )
    );
  }

}