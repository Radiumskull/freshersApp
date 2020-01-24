import 'package:flutter/material.dart';
import 'package:hogwarts/services/auth.dart';
import 'package:hogwarts/shared/color_loader.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String userName = '';
  String password = '';
  String error = '';
  dynamic result;

  final AuthService _auth = AuthService();
  bool loading = false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return loading
        ? ColorLoader(colors: [
            Colors.amber,
            Colors.red,
            Colors.blue,
            Colors.green,
          ], duration: Duration(seconds: 2))
        : Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.amber[50],
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.amber,
              title: Text("Sign In"),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                      decoration: InputDecoration(labelText: 'Username'),
                      onChanged: (val) {
                        userName = val;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val.length < 6 ? 'Enter an Password 6+ chars' : null,
                      decoration: InputDecoration(labelText: 'Password'),
                      onChanged: (val) {
                        password = val;
                      },
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      error,
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      child: Text("Sign In"),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() => loading = true);
                          result = await _auth.signInWithEmailAndPassword(
                              userName, password);
                          if (result == null) {
                            setState(() {
                              loading = false;
                              error = "Username or Password is Incorrect";
                            });
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
