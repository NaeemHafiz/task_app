import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(
    MaterialApp(home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    ));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(top: 240),
        child: Center(
            child: Column(
          children: [
            FlutterLogo(size: 100,),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Text(
                'DISCOUNT OFFERS SALES',
                style: TextStyle(fontSize: 20.0,color: Colors.white),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
