import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/dashboard.dart';
import 'package:task_app/utils/utils.dart';
import 'loginscreen.dart';

void main() => runApp(MaterialApp(
      home: SplashScreen(),
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
      () => checkUserToken(),
    );
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
            FlutterLogo(
              size: 100,
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Text(
                'DISCOUNT OFFERS SALES',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ],
        )),
      ),
    );
  }

  void checkUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool CheckValue = prefs.containsKey(Utils.accessToken);
    if (CheckValue) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => Dashboard()));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
    }
  }
}
