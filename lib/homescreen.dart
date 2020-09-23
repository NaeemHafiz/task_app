import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
        headers: {"Accept": "application/json"});

    this.setState(() {
//      Navigator.of(context).pop();
      showAlertDialog(context);
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
      appBar: new AppBar(
          automaticallyImplyLeading: false,
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
                            fit: BoxFit.cover,
                            width: 90,
                            height: 100,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 7.0),
                                child: Text(
                                  'Title: ' + data[index]["title"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 7.0),
                                padding: EdgeInsets.all(5),
//                                decoration: BoxDecoration(
//                                  borderRadius:
//                                      BorderRadius.all(Radius.circular(5)),
//                                  color: Color(0xff9E9E9E),
//                                ),
                                child: Text(
                                  'Description: ' + data[index]["title"],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
//                              Container(
//                                margin: EdgeInsets.only(left: 7.0, top: 40.0),
//                                child: Text(
//                                  '50 % discount',
//                                  style: TextStyle(color: Color(0xff8FB88F)),
//                                ),
//                              ),
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

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 5), child: Text("Loading")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
