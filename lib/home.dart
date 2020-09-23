import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
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
      backgroundColor: Colors.black,
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
      body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (context, index) {
            return Container(
              height: 140,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                elevation: 5.0,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          child: Image.asset(
                            'assets/images/image.png',
                            fit: BoxFit.cover,width: 100,height: 110,
                          ),
                        ),
                      ),
//                  Image.asset(
//                    'assets/images/image.png',
//                    height: 100,
//                    width: 100,
//                  ),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 7.0),
                                child: Text(
                                  'shop 5',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.0),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 7.0),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: Color(0xff9E9E9E),
                                ),
                                child: Text(
                                  'Dubai',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 7.0, top: 40.0),
                                child: Text(
                                  '50 % discount',
                                  style: TextStyle(color: Color(0xff8FB88F)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 2.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.settings,
                                color: Colors.red,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 14.0),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.location_on,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
//
//  Widget buidList() {
//    return ListView.builder(
//      itemCount: 8,
//      itemBuilder: (context, index) {
//        return listWidget(context);
//      },
//    );
//  }
//
//  Widget listWidget(BuildContext context) {
//    return Container(
//      height: 140,
//      child: Card(
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(6),
//        ),
//        elevation: 5.0,
//        child: Container(
//          padding: EdgeInsets.all(10.0),
//          child: Row(
//            children: [
//              Image.asset(
//                'assets/images/image.png',
//                height: 100,
//                width: 100,
//              ),
//              Expanded(
//                child: Container(
//                  margin: EdgeInsets.only(top: 15.0),
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: [
//                      Container(
//                        margin: EdgeInsets.only(left: 7.0),
//                        child: Text(
//                          'shop 5',
//                          style: TextStyle(
//                              fontWeight: FontWeight.bold, fontSize: 22.0),
//                        ),
//                      ),
//                      Container(
//                        margin: EdgeInsets.only(left: 7.0),
//                        padding: EdgeInsets.all(5),
//                        decoration: BoxDecoration(
//                          borderRadius: BorderRadius.all(Radius.circular(5)),
//                          color: Color(0xff9E9E9E),
//                        ),
//                        child: Text(
//                          'Dubai',
//                          style: TextStyle(
//                            fontWeight: FontWeight.bold,
//                          ),
//                        ),
//                      ),
//                      Container(
//                        margin: EdgeInsets.only(left: 7.0, top: 10.0),
//                        child: Text(
//                          '50 % discount',
//                          style: TextStyle(color: Color(0xffA9CDB1)),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//              Container(
//                margin: EdgeInsets.only(top: 15.0),
//                child: Column(
//                  children: [
//                    IconButton(
//                      onPressed: () {},
//                      icon: Icon(
//                        Icons.settings,
//                        color: Colors.red,
//                      ),
//                    ),
//                    IconButton(
//                      onPressed: () {},
//                      icon: Icon(
//                        Icons.settings,
//                        color: Colors.red,
//                      ),
//                    )
//                  ],
//                ),
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
}
