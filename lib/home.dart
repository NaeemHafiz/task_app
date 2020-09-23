import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(home: new HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      data = json.decode(response.body);
    });

    print(data[1]["title"]);

    return "Success!";
  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      bottomNavigationBar: BottomNavigationBar(
//        currentIndex: 0, // this will be set when a new tab is tapped
//        backgroundColor: Colors.black,
//        items: [
//          BottomNavigationBarItem(
//            icon: new Icon(
//              Icons.home,
//              color: Colors.white,
//            ),
//            title: new Text(
//              'Home',
//              style: TextStyle(color: Colors.white),
//            ),
//          ),
//          BottomNavigationBarItem(
//            icon: new Icon(
//              Icons.mail,
//              color: Colors.white,
//            ),
//            title: new Text(
//              'Messages',
//              style: TextStyle(color: Colors.white),
//            ),
//          ),
//          BottomNavigationBarItem(
//              icon: Icon(
//                Icons.person,
//                color: Colors.white,
//              ),
//              title: Text(
//                'Profile',
//                style: TextStyle(color: Colors.white),
//              ))
//        ],
//      ),
      appBar: new AppBar(
          centerTitle: true,
          title: new Text(
            "Favourites",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Text(data[index]["title"]),
          );
        },
      ),
    );
  }
}
