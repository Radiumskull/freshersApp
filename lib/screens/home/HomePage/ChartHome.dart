import 'package:flutter/material.dart';

import 'package:hogwarts/Charts/chartbar_G.dart';
import 'package:hogwarts/Charts/chartbar_h.dart';
import 'package:hogwarts/Charts/chartbar_R.dart';
import 'package:hogwarts/Charts/chartbar_S.dart';

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  var GryffindorPoints = 85;

  var SlytherinPoints = 15;

  var RavenclawPoints = 36;

  var HufflepuffPoints = 51;

  var TotalPoints = 100;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Card(
        elevation: 6,
        margin: EdgeInsets.all(10),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              //
              child: Image(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            ListView(children: <Widget>[ Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Text(
                  "House Points",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    letterSpacing: 6,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text("  "),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 70.0,
                          height: 70.0,
                          alignment: Alignment.center,
                          decoration: new BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/slytherin.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        ChartBarS(
                          scoreperc: (SlytherinPoints / TotalPoints).toDouble(),
                        ),
                        Text(
                          "$SlytherinPoints",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("  "),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 70.0,
                          height: 70.0,
                          alignment: Alignment.center,
                          decoration: new BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/raven.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        ChartBarR(
                          scoreperc: (RavenclawPoints / TotalPoints).toDouble(),
                        ),
                        Text(
                          "$RavenclawPoints",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("  "),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 70.0,
                          height: 70.0,
                          alignment: Alignment.center,
                          decoration: new BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/gryffindor.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        ChartBarG(
                          scoreperc:
                              (GryffindorPoints / TotalPoints).toDouble(),
                        ),
                        Text(
                          "$GryffindorPoints",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("  "),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 70.0,
                          height: 70.0,
                          alignment: Alignment.center,
                          decoration: new BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/hufflepuff.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        ChartBarH(
                          scoreperc:
                              (HufflepuffPoints / TotalPoints).toDouble(),
                        ),
                        Text(
                          "$HufflepuffPoints",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                          width: 90.0,
                          height: 90.0,
                          alignment: Alignment.center,
                          decoration: new BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/trophy.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        SizedBox(
                  height: 10,
                ),
                Text(
                  "Draco Dormiens Nunquam Titillandus",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    
                  ),
                ),
                Text(
                  "May the best House Win!",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    
                  ),
                ),
              ],
            ),
            ],)
          ],
        ),
        
      ),
    );
  }
}


