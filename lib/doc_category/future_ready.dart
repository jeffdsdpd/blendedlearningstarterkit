import 'package:blendedlearningstarterkit/auth.dart';
import 'package:flutter/material.dart';
import 'package:blendedlearningstarterkit/detail_page.dart';
import 'package:blendedlearningstarterkit/lesson.dart';

class FutureReadyPage extends StatefulWidget {
FutureReadyPage({this.auth, this.onSignedOut});

final BaseAuth auth;
final VoidCallback onSignedOut;

@override
  _FutureReadyPageState createState() => _FutureReadyPageState();
}

class _FutureReadyPageState extends State<FutureReadyPage> {
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
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
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
            style: TextStyle(color: Color.fromRGBO(58, 66, 86, 1), fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
          textAlign: TextAlign.center),
      actions: <Widget>[
        FlatButton(
          child: Text('Logout', style: TextStyle(fontSize: 15.0, color: Colors.white)), 
          onPressed: _signOut
        )
      ],
    );

    final makeBottom = Container(
        height: 55.0,
        child: BottomAppBar(
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.picture_as_pdf, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.videocam, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.video_label, color: Colors.white),
                onPressed: () {},
              )
            ],
          ),
        ),
      );


    return Scaffold(
      backgroundColor: Color(0xFF95D03A),
      appBar: topAppBar,
      body: makeBody,
      bottomNavigationBar: makeBottom,
    );
  }
}

List getLessons() {
  return [
     Lesson(
      title: "ELA Future Ready Task Cards",
      fileIndicatorValue: "BlendedLearningDocuments/FutureReadyActivities/ela_future_ready_task_cards_.pdf",
      price: 0,
      content: "This set of 8 activites (including directions, lessons, level up, etc...) and 10 cafe questions can be used in many ELA Novel Study Activities."),

    Lesson(
      title: "Pipe Cleaner Activity Cards",
      fileIndicatorValue: "BlendedLearningDocuments/FutureReadyActivities/stem_pipe_cleaner_activities.pdf",
      price: 0,
      content: "This set of 20 STEM PIPE Cleaner activity cards that can be used in many Future Ready Studio Activites."),

    Lesson(
      title: "Ozobot Color Codes Explained",
      fileIndicatorValue: "BlendedLearningDocuments/FutureReadyActivities/OzobotCodes.pdf",
      price: 0,
      content: "This document will help you understand what the different color codes will make the ozobots do."),

    Lesson(
      title: "Ozobot Fraction Activities",
      fileIndicatorValue: "BlendedLearningDocuments/FutureReadyActivities/OzobotFractions.pdf",
      price: 0,
      content: "This lesson will divide squares to create new tracks for Ozobot to travel on! To start, the class will shade gridded squares to explore various fractions, dividing a square to make a track for Ozobot."),
  ];
}
