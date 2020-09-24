import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
//  DetailScreen({Key key, @required this.listWordsDetail}) : super(key: key);
  List listWordsDetail;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            "Detail",
            style: TextStyle(color: Colors.white),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          height: 150,
          width: 420,
          child: Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Title: ',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 5.0),
                          child: Text(
                            'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Description: ',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 5.0),
                          child: Text(
                            'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
