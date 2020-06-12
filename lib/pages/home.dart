import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    //receiving data via routes.
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print("data: " + data.toString());

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
                  "LED",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 20.0),
                new RaisedButton(
                  //Add LED OFF code in the onPressed below
                  onPressed: (){},
                  child: Text("ON"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.green[300])
                  ),
                  color: Colors.greenAccent[100],
                ),
                SizedBox(height: 10,),
                new RaisedButton(
                  //Add LED OFF code in the onPressed below
                  onPressed: (){},
                  child: Text("OFF"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red[300])
                  ),
                  color: Colors.redAccent[100],
                ),

              ],
            ),
          ),
        ),
      )
    );
  }

}