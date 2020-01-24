import 'package:flutter/material.dart';
import 'package:hogwarts/services/auth.dart';
import 'package:provider/provider.dart';

import 'screens/splashscreen/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Hogwarts',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Spla(),
      ),
    );
  }
}
