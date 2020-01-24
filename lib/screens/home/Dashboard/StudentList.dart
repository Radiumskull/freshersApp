import 'package:flutter/material.dart';
import 'package:hogwarts/models/Student.dart';
import 'package:hogwarts/screens/home/Dashboard/StudentDash.dart';
import 'package:hogwarts/screens/home/Dashboard/StudentTile.dart';
import 'package:provider/provider.dart';

class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  @override
  Widget build(BuildContext context) {
    final students = Provider.of<List<Student>>(context);
    return students == null
        ? Container()
        : Column(
            children: <Widget>[
              StudentDash(studentLength: students.length),
              Expanded(
                child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    return StudentTile(index: index, student: students[index]);
                  },
                ),
              ),
            ],
          );
  }
}
