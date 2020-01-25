import 'package:flutter/material.dart';
import 'package:hogwarts/models/Student.dart';
import 'package:hogwarts/screens/home/Dashboard/StudentList.dart';
import 'package:hogwarts/services/database.dart';
import 'package:provider/provider.dart';

class DashboardHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Student>>.value(
      value: DatabaseService().students,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: StudentList(),
      ),
    );
  }
}
