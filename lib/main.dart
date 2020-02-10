import 'package:blendedlearningstarterkit/auth.dart';
import 'package:flutter/material.dart';
import 'auth.dart';
import 'root_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blended Learning Starter Kit',
      theme: ThemeData(primaryColor: Color(0xFF95D03A),
      ),
      home: RootPage(auth: Auth())
    );
  }
}