import 'package:flutter/material.dart';
import 'package:hogwarts/models/Event.dart';

class EventTile extends StatelessWidget {
  final Event event;
  final int index;

  EventTile({this.index, this.event});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: Card(
          child: ListTile(
              title: Center(
                child: Text(
                  event.headline,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              subtitle: Column(
                children: <Widget>[
                  Text(event.eventDetails),
                  Text(
                      "Start Date : ${event.startDate} End Date : ${event.endDate}"),
                ],
              )),
        ));
  }
}
