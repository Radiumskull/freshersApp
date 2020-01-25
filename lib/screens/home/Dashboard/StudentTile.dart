import 'package:flutter/material.dart';
import 'package:hogwarts/models/Student.dart';

class StudentTile extends StatelessWidget {
  final Student student;
  final int index;

  StudentTile({this.index, this.student});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: CircleAvatar(
          child: Text(
            (index + 1).toString(),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          radius: 25,
        ),
        title: Text(
          student.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        subtitle:
            Text("Email: ${student.email}\nInterest: ${student.interests}"),
      ),
    );
  }
}
