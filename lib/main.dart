import 'package:flutter/material.dart';

import './themes/theme.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      theme: appTheme,
      home: Scaffold(
        body: HomeScreen(),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.yellow[700],
            onPressed: () {}),
      ),
    );
  }
}
