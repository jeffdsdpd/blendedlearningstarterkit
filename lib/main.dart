import 'package:blendedlearningtoolkit/auth.dart';
import 'package:blendedlearningtoolkit/doc_category/teachingfromhomedefinition.dart';
import 'package:blendedlearningtoolkit/home_page.dart';
import 'package:flutter/material.dart';
import 'auth.dart';

void main() => runApp(MyApp());

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      initialRoute: '/',
      routes: {
        '/teachingfromhome': (context) => TeachingFromHomeDefinitionPage(),
      },
      title: 'Blended Learning Starter Kit',
      theme: ThemeData(primaryColor: Color(0xFF95D03A),
      ),
      //This is if we want to add functionality to create an account -> home: RootPage(auth: Auth())
      home: HomePage(auth: Auth())
    );
  }
}