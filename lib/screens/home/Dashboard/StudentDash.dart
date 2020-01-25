import 'package:flutter/material.dart';

class StudentDash extends StatelessWidget {
  final int studentLength;
  StudentDash({this.studentLength});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 150,
            width: 150,
            child: Column(
              children: <Widget>[
                Text(
                  studentLength.toString(),
                  style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Enrolled",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            height: 150,
            width: 150,
            child: Column(
              children: <Widget>[
                Text(
                  "56",
                  style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Total",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
