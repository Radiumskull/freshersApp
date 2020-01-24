import 'package:flutter/material.dart';
import 'package:hogwarts/models/Event.dart';
import 'package:hogwarts/screens/home/CustomDrawer.dart';
import 'package:hogwarts/screens/home/EventList.dart';
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
            Card(
              child: Container(
                color: Colors.yellowAccent,
                height: 200,
                width: double.infinity,
              ),
            ),
            Expanded(child: EventList()),
          ],
        ),
      ),
    );
  }
}
