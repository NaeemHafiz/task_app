import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_app/dashboard.dart';
import 'package:task_app/models/basemodel.dart';
import 'package:task_app/utils/preferencutils.dart';
import 'package:task_app/utils/utils.dart';

import 'models/loginparams.dart';
import 'network/api.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController, passwordController;
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
    nameController = TextEditingController();
    passwordController = TextEditingController();
    loginParams = LoginParams();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.all(30),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: FlutterLogo(
                    size: 70,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text(
                    'DISCOUNT OFFERS SALE',
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40.0),
                  child: TextFormField(
                    validator: (val) {
                      return val.isEmpty ? 'Enter Username' : null;
                    },
                    controller: nameController,
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
                      hintText: 'Username',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 18.0),
                  child: TextFormField(
                    controller: passwordController,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Enter  Password';
                      }
                      if (val.length < 6) {
                        return 'Password should be at least 6 characters';
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
                      hintText: 'Password',
                    ),
                  ),
                ),
                Container(
                  width: 410,
                  height: 70,
                  margin: EdgeInsets.only(top: 18.0),
                  child: RaisedButton(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff3E3E3E)),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: Color(0xff9E9E9E))),
                    onPressed: () {
                      setState(() {
                        if (_formKey.currentState.validate()) {
                          userLogin();
                        }
                      });
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 30.0),
                  child: Text(
                    'Dont have an Account? Sign Up',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 150.0,
                        child: Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Color(0xff818181),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 7.0),
                        child: Text(
                          'OR',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        width: 150.0,
                        child: Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Color(0xff818181),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 18.0),
                  width: 410,
                  height: 70,
                  child: RaisedButton(
                    child: Text(
                      'Sign In As Guest',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: Color(0xff3E3E3E)),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: Color(0xff9E9E9E))),
                    onPressed: () {},
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 30.0),
                  child: Text(
                    'Want to Register company? Click Here',
                    style: TextStyle(
                        color: Color(0xffC7C7C7), fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  userLogin() async {
    showAlertDialog(context);
    loginParams.username = nameController.text;
    loginParams.password = passwordController.text;
    ApiClass apiClass = ApiClass(Dio());

    try {
      await apiClass.login(loginParams).then((value) {
        Navigator.of(context).pop();
        PreferencUtils.setUserToken(
            Utils.accessToken, value.data.user.access_token);
        BaseModel baseModel = value;
        if (baseModel.code == 200) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
          );
        }
      });
    } catch (o) {
      Navigator.of(context).pop();
      Fluttertoast.showToast(
        msg: "Either username or password is incorrect.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
      nameController.clear();
      passwordController.clear();
    }
  }
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
    useRootNavigator: true,
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
