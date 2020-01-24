import 'package:flutter/material.dart';

import 'package:hogwarts/Charts/chartbar_G.dart';
import 'package:hogwarts/Charts/chartbar_h.dart';
import 'package:hogwarts/Charts/chartbar_R.dart';
import 'package:hogwarts/Charts/chartbar_S.dart';
import 'package:hogwarts/models/Points.dart';
import 'package:hogwarts/services/events.dart';

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  var gryffindorPoints = 0;

  var slytherinPoints = 0;

  var ravenclawPoints = 0;

  var hufflepuffPoints = 0;

  var totalPoints = 100;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Points>(
        stream: EventService().pointData,
        builder: (context, snapshot) {
          if (snapshot != null) {
            gryffindorPoints = snapshot.data.g;
            slytherinPoints = snapshot.data.s;
            ravenclawPoints = snapshot.data.r;
            hufflepuffPoints = snapshot.data.h;
            totalPoints = snapshot.data.total;
          }

          return Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            appBar: AppBar(
              title: Text("House Points"),
            ),
            body: Container(
              child: Stack(
                children: <Widget>[
                  // Positioned.fill(
                  //   //
                  //   child: Image(
                  //     image: AssetImage('assets/images/background.jpg'),
                  //     fit: BoxFit.fill,
                  //   ),
                  // ),
                  ListView(
                    children: <Widget>[
                      Column(
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
                                          image: AssetImage(
                                              'assets/images/slytherin.png'),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  ChartBarS(
                                    scoreperc: (slytherinPoints / totalPoints)
                                        .toDouble(),
                                  ),
                                  Text(
                                    "$slytherinPoints",
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
                                          image: AssetImage(
                                              'assets/images/ravenclaw.png'),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  ChartBarR(
                                    scoreperc: (ravenclawPoints / totalPoints)
                                        .toDouble(),
                                  ),
                                  Text(
                                    "$ravenclawPoints",
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
                                          image: AssetImage(
                                              'assets/images/griffindor.png'),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  ChartBarG(
                                    scoreperc: (gryffindorPoints / totalPoints)
                                        .toDouble(),
                                  ),
                                  Text(
                                    "$gryffindorPoints",
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
                                          image: AssetImage(
                                              'assets/images/hufflepuff.png'),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  ChartBarH(
                                    scoreperc: (hufflepuffPoints / totalPoints)
                                        .toDouble(),
                                  ),
                                  Text(
                                    "$hufflepuffPoints",
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
                                  image: AssetImage('assets/images/trophy.png'),
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
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
