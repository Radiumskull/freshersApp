import 'package:flutter/material.dart';
import 'package:hogwarts/services/auth.dart';
import 'package:hogwarts/shared/color_loader.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String name = '';
  String email = '';
  String password = '';
  String interests = '';
  String error = '';

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

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
              title: Text("Register"),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? 'Enter your Name' : null,
                      decoration: InputDecoration(labelText: 'Name'),
                      onChanged: (val) {
                        name = val;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                      decoration: InputDecoration(labelText: 'Email'),
                      onChanged: (val) {
                        email = val;
                      },
                    ),
                    SizedBox(
                      height: 10,
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
                      height: 10,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? 'Enter your Interests' : null,
                      decoration: InputDecoration(labelText: 'Interests'),
                      onChanged: (val) {
                        interests = val;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      error,
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      child: Text("Register"),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() => loading = true);

                          dynamic result =
                              await _auth.registerwithEmailandPassword(
                                  name, email, password, interests);
                          if (result == null) {
                            setState(() {
                              loading = false;
                              error = "Please Enter valid Email and Password.";
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
