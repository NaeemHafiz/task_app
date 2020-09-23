import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_app/dashboard.dart';
import 'package:task_app/models/basemodel.dart';

import 'models/loginparams.dart';
import 'network/api.dart';

void main() => runApp(MaterialApp(home: LoginScreen()));

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController, passwordController;
  final _formKey = GlobalKey<FormState>();
  LoginParams loginParams;

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
    loginParams = LoginParams();
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
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 70.0),
            child: Column(
              children: [
                Container(
                  child: FlutterLogo(
                    size: 70,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text(
                    'DISCOUNT OFFERS SALE',
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    width: 410,
                    height: 70,
                    margin: EdgeInsets.only(top: 60.0),
                    child: TextFormField(
                      validator: (val) {
                        return val.isEmpty ? 'Enter username' : null;
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
                        labelText: 'Username',
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 18.0),
                    width: 410,
                    height: 70,
                    child: TextFormField(
                      controller: passwordController,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Enter A Password';
                        }
                        if (val.length < 6) {
                          return 'Password shuld be at least 6 characters';
                        }
                      },
                      obscureText: _obscureText,
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
                    margin: EdgeInsets.only(top: 18.0),
                    width: 410,
                    height: 70,
                    child: RaisedButton(
                      child: Text(
                        'Sign in',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Color(0xff9E9E9E))),
                      onPressed: () {
                        setState(() {
                          _formKey.currentState.validate()
                              ? userLogin()
                              : Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text('This is not valid')));
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  prefix0.Error err = prefix0.Error();
  userLogin() async {
    loginParams.username = userNameController.text;
    loginParams.password = passwordController.text;
    ApiClass apiClass = ApiClass(Dio());
    await apiClass.login(loginParams).then((value) {
      BaseModel baseModel = value;
      if (baseModel.code == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      }
    }).catchError((error) {
      //TODO: handle errors
      err.message = jsonDecode(error.toString())["message"];
      throw("some arbitrary error");
    });
  }
}
