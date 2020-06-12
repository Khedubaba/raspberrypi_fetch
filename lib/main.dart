import 'package:flutter/material.dart';
import 'package:raspberrypifetch/pages/home.dart';
import 'package:raspberrypifetch/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
    },
  ));
}
