
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'lesson.dart';
import 'auth.dart';

class HomePage extends StatefulWidget {
HomePage({this.auth, this.onSignedOut});

final BaseAuth auth;
final VoidCallback onSignedOut;

@override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

Future<void> _getData(String title) async {
  print('about to get file - '+title);
  var data = await FirebaseStorage.instance.ref().child(title).getData(10 * 1024 * 1024);
   print('return from getting file - '+title);
  var text = new String.fromCharCodes(data);
  print(data);
  print(text);
}

@override
  Widget build(BuildContext context) {
    ListTile makeListTile(Lesson lesson) => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
          //onTap: () => _getData(lesson.fileIndicatorValue),
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
            style: TextStyle(color: Color.fromRGBO(58, 66, 86, 1), fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
          textAlign: TextAlign.center),
      actions: <Widget>[
        FlatButton(
          child: Text('Logout', style: TextStyle(fontSize: 25.0, color: Colors.white)), 
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
        title: "ELA Future Ready Task Card",
        fileIndicatorValue: "FutureReadyTaskCards/ela_future_ready_task_cards_.pdf",
        price: 0,
        content:
            "This set of 8 activites (including directions, lessons, level up, etc...) and 10 cafe questions can be used in many ELA Novel Study Activities."),

    Lesson(
        title: "Phase1 Checklist\n(Coming Soon!)",
        price: 0,
        content:
            "Coming Very Soon!"),
    Lesson(
        title: "Phase2 Checklist\n(Coming Soon!)",
        price: 0,
        content:
            "Coming Very Soon!"),

    Lesson(
        title: "Phase3 Checklist\n(Coming Soon!)",
        price: 0,
        content:
            "Coming Very Soon!"),
  ];
}
