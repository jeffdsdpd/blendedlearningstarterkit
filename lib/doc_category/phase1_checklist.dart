import 'package:blendedlearningtoolkit/auth.dart';
import 'package:flutter/material.dart';
import 'package:blendedlearningtoolkit/detail_page.dart';
import 'package:blendedlearningtoolkit/models/lesson.dart';

class Phase1Page extends StatefulWidget {
Phase1Page({this.auth, this.onSignedOut});

final BaseAuth auth;
final VoidCallback onSignedOut;

@override
  _Phase1PageState createState() => _Phase1PageState();
}

class _Phase1PageState extends State<Phase1Page> {
  List lessons;

  @override
  void initState() {
    lessons = getLessons();
    super.initState();
  }

void _signOut() async {
  try {
    await widget.auth.signOut();
    widget.onSignedOut();
  } catch (e) {
    print(e);
  }
}

@override
  Widget build(BuildContext context) {
    ListTile makeListTile(Lesson lesson) => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 11.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24)
                  )
              ),
            child: Icon(Icons.picture_as_pdf, color: Colors.white),
          ),
          title: Text(
            lesson.title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22.0),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                  )
                ),
            ],
          ),
          onTap:() {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(lesson: lesson)));
          },
        );

    Card makeCard(Lesson lesson) => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: makeListTile(lesson),
          ),
        );


    final makeBody = Container(
      color: Color(0xFF95D03A),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: lessons.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(lessons[index]);
        },
      ),
    );


    final topAppBar = AppBar(
      backgroundColor: Color(0xFF95D03A),
      title: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: 'Blended Learning',
              ),
              TextSpan(text: "\n"),
              TextSpan(
                text: 'Resources',
              )
            ],
            style: TextStyle(color: Color.fromRGBO(58, 66, 86, 1), fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
          textAlign: TextAlign.center),
      actions: <Widget>[
        FlatButton(
          child: Text('Logout', style: TextStyle(fontSize: 15.0, color: Colors.white)), 
          onPressed: _signOut
        )
      ],
    );

    return Scaffold(
      backgroundColor: Color(0xFF95D03A),
      appBar: topAppBar,
      body: makeBody,
    );
  }
}

List getLessons() {
  return [
    Lesson(
        title: "Phase1 & Phase2 Checklist",
        fileIndicatorValue: "BlendedLearningDocuments/Phase1Checklist/Phase1ChecklistV2.pdf",
        price: 0,
        content: "This document includes both a Phase 1 and Phase 2 Checlist template for a Blended Learning Classroom"),

    Lesson(
        title: "Phase1 Checklist",
        fileIndicatorValue: "BlendedLearningDocuments/Phase1Checklist/Phase1ChecklistV3.pdf",
        price: 0,
        content: "This is a Phase 1 Checklist which can be used to transform a classroom into a Phase 1 Blended Learning Classroom"),
  ];
}
