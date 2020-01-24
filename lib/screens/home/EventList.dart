import 'package:flutter/material.dart';
import 'package:hogwarts/models/Event.dart';
import 'package:hogwarts/services/events.dart';
import 'package:hogwarts/screens/home/EventTIle.dart';
import 'package:provider/provider.dart';

class EventList extends StatefulWidget {
  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    final events = Provider.of<List<Event>>(context);
    print(events);
    return events == null
        ? Container()
        : ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              print(index);
              return EventTile(index: index, event: events[index]);
            },
          );
  }
}
