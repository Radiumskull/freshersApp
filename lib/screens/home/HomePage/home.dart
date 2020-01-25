import 'package:flutter/material.dart';
import 'package:hogwarts/models/Event.dart';
import 'package:hogwarts/screens/home/HomePage/CustomDrawer.dart';
import 'package:hogwarts/screens/home/HomePage/EventList.dart';
import 'package:hogwarts/services/events.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Event>>.value(
      value: EventService().events,
      child: Scaffold(
        appBar: AppBar(
          title: Text("HomePage"),
        ),
        drawer: CustomDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 30),
              child: Center(
                child: Text(
                  "Events",
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Expanded(child: EventList()),
          ],
        ),
      ),
    );
  }
}
