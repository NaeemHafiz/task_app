import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: HomeScreen()));

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController userNameController, passwordController;
  final _formKey = GlobalKey<FormState>();

  // Initially password is obscure
  bool _obscureText = false;

  // Toggles the password show status
  void _togglePasswordStatus() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userNameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.only(top: 70.0, left: 40.0, right: 40.0),
          child: Center(
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    child: FlutterLogo(
                      size: 70,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(top: 5.0),
                      child: Text(
                        'DISCOUNT OFFERS SALE',
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(top: 40.0),
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        validator: (val) {
                          return val.length < 6
                              ? 'Enter A Password Longer Than 6 Charchters'
                              : null;
                        },
                        controller: userNameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                          ),
                          labelText: 'User Name',
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: _obscureText,
                        onChanged: (val) {
                          setState(() {
                            passwordController.text = val.trim();
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: _togglePasswordStatus,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                          ),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(top: 12.0),
                      width: 300,
                      height: 60,
                      child: RaisedButton(
                        child: Text('Sign in'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(color: Color(0xff9E9E9E))),
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}