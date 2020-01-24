import 'package:flutter/material.dart';
import 'package:hogwarts/models/user.dart';
import 'package:hogwarts/screens/autheticate/authenticate.dart';
import 'package:hogwarts/screens/home/HomePage/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
