import 'package:flutter/material.dart';
import 'package:hogwarts/screens/autheticate/register.dart';
import 'package:hogwarts/screens/autheticate/sign_in.dart';

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.amber[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text("SignIn"),
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => SignIn()));
            },
          ),
          RaisedButton(
            child: Text("Register"),
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => Register()));
            },
          ),
        ],
      ),
    );
  }
}
