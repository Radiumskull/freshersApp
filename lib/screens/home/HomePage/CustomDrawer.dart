import 'package:flutter/material.dart';
import 'package:hogwarts/models/user.dart';
import 'package:hogwarts/screens/home/Dashboard/DashboardHome.dart';
import 'package:hogwarts/screens/home/HomePage/ChartHome.dart';
import 'package:hogwarts/services/auth.dart';
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Card(
                  child: Container(
                    color: Colors.blue,
                    height: 200,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.portrait,
                          size: 128,
                        ),
                        Text(
                          userData == null ? "null" : userData.name,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                FlatButton(
                  child: Container(
                      width: double.infinity,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.dashboard),
                            Text(
                              "StudentDashboard",
                              style: TextStyle(fontSize: 18),
                            ),
                          ])),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => DashboardHome()));
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
                  child: Container(
                      width: double.infinity,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.chevron_left),
                            Text(
                              "Logout",
                              style: TextStyle(fontSize: 18),
                            ),
                          ])),
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
