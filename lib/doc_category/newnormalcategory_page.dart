import 'package:blendedlearningtoolkit/doc_category/category.dart';
import 'package:blendedlearningtoolkit/doc_category/covidslidedefinitionpage.dart';
import 'package:blendedlearningtoolkit/doc_category/deployment_plan_page.dart';
import 'package:blendedlearningtoolkit/doc_category/newnormaldefinitionpage.dart';
import 'package:blendedlearningtoolkit/doc_category/planningguidedefinitionpage.dart';
import 'package:blendedlearningtoolkit/doc_category/zoomdefinitionpage.dart';
import 'package:flutter/material.dart';
import '../auth.dart';


class NewNormalCategoryPage extends StatefulWidget {
NewNormalCategoryPage({this.auth, this.onSignedOut});

final BaseAuth auth;
final VoidCallback onSignedOut;

@override
  _NewNormalCategoryPageState createState() => _NewNormalCategoryPageState();
}

class _NewNormalCategoryPageState extends State<NewNormalCategoryPage> {
  List categories;

  @override
  void initState() {
    categories = getCategories();
    super.initState();
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
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
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
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
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
              TextSpan(text: 'Blended Learning', style: TextStyle(fontSize: 22.0)
              ),
              TextSpan(text: '\n ', style: TextStyle(fontSize: 28.0)),
              TextSpan( text: 'Resources', style: TextStyle(fontSize: 25.0)
              )
            ],
            style: TextStyle(color: Color.fromRGBO(58, 66, 86, 1), fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          textAlign: TextAlign.center),
    );

    return Scaffold(
      backgroundColor: Color(0xFF95D03A),
      appBar: topAppBar,
      body: makeBody,
    );
  }
}

List getCategories() {
  return [
    Category(
        title: "Teaching in the New Norm",
        pagename: NewNormalDefinitionPage()),
    
    Category(
        title: "Fix to the COVID Slide",
        pagename: CovidSlideDefinitionPage()),

    Category(
        title: "Planning Guide Lessons",
        pagename: PlanningGuideDefinitionPage()),

    Category(
        title: "Deployment Plan",
        pagename: DeploymentPlanPage()),

    Category(
    title: "Getting Started with ZOOM",
    pagename: ZOOMDefinitionPage()),
  ];
}