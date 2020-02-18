import 'package:blendedlearningstarterkit/doc_category/category.dart';
import 'package:blendedlearningstarterkit/doc_category/future_ready.dart';
import 'package:blendedlearningstarterkit/doc_category/phase1_checklist.dart';
import 'package:blendedlearningstarterkit/doc_category/phase2_checklist.dart';
import 'package:flutter/material.dart';
import 'auth.dart';

class ResourcePage extends StatefulWidget {
ResourcePage({this.auth, this.onSignedOut});

final BaseAuth auth;
final VoidCallback onSignedOut;

@override
  _ResourcePageState createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  List categories;

  @override
  void initState() {
    categories = getCategories();
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
    ListTile makeListTile(Category category) => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          //creates leading icon for each tile
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24)
                  )
              ),
            child: Icon(Icons.collections, color: Colors.white),
          ),
          //creates trailing icon for each tile
          trailing: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24)
                  )
              ),
            child: Icon(Icons.keyboard_arrow_right, color: Colors.white),
          ),
          //uses the lesson widget to create text on the tiles
          title: Text(
            category.title,
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
                    builder: (context) => category.pagename));
          },
        );

    Card makeCard(Category category) => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: makeListTile(category),
          ),
        );


    final makeBody = Container(
      color: Color(0xFF95D03A),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(categories[index]);
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

    final makeBottom = BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.picture_as_pdf),title: Text('BL Docs')),
          BottomNavigationBarItem(icon: Icon(Icons.videocam),title: Text('BL Videos')),
          BottomNavigationBarItem(icon: Icon(Icons.video_label),title: Text('Misc')),
        ],
      );
    
    
    return Scaffold(
      backgroundColor: Color(0xFF95D03A),
      appBar: topAppBar,
      body: makeBody,
      bottomNavigationBar: makeBottom,
    );
  }
}

List getCategories() {
  return [
     Category(
        title: "Future Ready Activities",
        pagename: FutureReadyPage()),

    Category(
        title: "Phase 1 Checklists",
        pagename: Phase1Page()),

    Category(
        title: "Phase 2 Checklists",
        pagename: Phase2Page()),
  ];
}