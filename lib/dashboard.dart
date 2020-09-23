import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'accountscreen.dart';
import 'favouritescreen.dart';
import 'homescreen.dart';

void main() {
  runApp(new MaterialApp(home: new Dashboard()));
}

class Dashboard extends StatefulWidget {
  @override
  DashboardState createState() => new DashboardState();
}

class DashboardState extends State<Dashboard> {
  List data;
  int _currentIndex = 0;
  List<Widget> _children = [];

  @override
  void initState() {
    _children = [
      HomeScreen(),
      FavouriteScreen(),
      AccountScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        onTap: onTabTapped,
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: new Text(
              'Home',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.mail,
              color: Colors.white,
            ),
            title: new Text(
              'Messages',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: Text(
                'Profile',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: _children[_currentIndex],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
