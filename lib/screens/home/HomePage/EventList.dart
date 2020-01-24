import 'package:flutter/material.dart';
import 'package:hogwarts/models/Event.dart';
import 'package:hogwarts/screens/home/HomePage/EventTile.dart';
import 'package:provider/provider.dart';

class EventList extends StatefulWidget {
  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    final events = Provider.of<List<Event>>(context);
    return events == null
        ? Container()
        : ListView.builder(
            itemCount: events.length - 1,
            itemBuilder: (context, index) {
              if (events[index].headline != null) {
                return EventTile(index: index, event: events[index]);
              } else {
                return null;
              }
            },
          );
  }
}
