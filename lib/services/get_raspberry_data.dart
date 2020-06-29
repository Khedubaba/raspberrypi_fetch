import 'package:http/http.dart';
import 'dart:convert';

class GetRaspberryData{
  String currentTemp;
  String url;

  GetRaspberryData({this.url});

  Future<void> getTemperature() async {
    try {
      //make the request
//      print("URL: $url");
      Response response = await get('http://node-red-pritesh.eu-gb.mybluemix.net/$url');
      Map data = jsonDecode(response.body);
//      print(data);

      //get properties from data
      currentTemp = data['Current Temperature'];
    }
    catch(e) {
      print("Caught Error: $e");
      currentTemp = "No Internet";
    }
  }

}