import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import './main.dart';
class SplachScreen extends StatefulWidget {
  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 10,
      navigateAfterSeconds: new MyApp(),
      title: new Text('Welcome In SplashScreen'),
      //image: new Image.asset('screenshot.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
     // photoSize: 10010
      loaderColor: Colors.red
    );
  }
}
