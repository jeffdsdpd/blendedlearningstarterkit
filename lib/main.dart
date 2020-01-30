import 'package:flutter/material.dart';
import 'login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of the application. 
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Blended Learning Starter Kit',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new LoginPage()
    );
  }
}
     