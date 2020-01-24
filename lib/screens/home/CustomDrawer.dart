import 'package:flutter/material.dart';
import 'package:hogwarts/models/user.dart';
import 'package:hogwarts/screens/home/HomePage/ChartHome.dart';
import 'package:hogwarts/services/auth.dart';
import 'package:hogwarts/screens/home/StudentsDashboard.dart';
import 'package:hogwarts/services/database.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          UserData userData = snapshot.data;
          return Drawer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.person_pin,
                          size: 64,
                        ),
                        Text(userData == null ? "null" : userData.name),
                      ],
                    ),
                  ),
                ),
                FlatButton(
                  child: Text("StudentDashboard"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => StudentDashboard()));
                  },
                ),
                FlatButton(
                  child: Container(
                      width: double.infinity,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.videogame_asset),
                            Text(
                              "House Points",
                              style: TextStyle(fontSize: 18),
                            ),
                          ])),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => Chart()));
                  },
                ),
                FlatButton(
                  child: Text("Logout"),
                  onPressed: () {
                    _auth.signOut();
                  },
                ),
              ],
            ),
          );
        });
  }
}
