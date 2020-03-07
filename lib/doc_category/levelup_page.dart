import 'package:blendedlearningtoolkit/auth.dart';
import 'package:blendedlearningtoolkit/mobile_pdf.dart';
import 'package:blendedlearningtoolkit/models/lesson.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class LevelUpPage extends StatefulWidget {
LevelUpPage({this.auth, this.onSignedOut});

final BaseAuth auth;
final VoidCallback onSignedOut;

@override
  _LevelUpPageState createState() => _LevelUpPageState();
}
class _LevelUpPageState extends State<LevelUpPage> {
  String _myActivityResult;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivityResult = '';
  }

  Future<void> _getData(BuildContext context, String title, String title1) async {
    var data = await FirebaseStorage.instance.ref().child('/BlendedLearningDocuments/LevelUpDocuments/'+title).getData(10 * 1024 * 1024);
    LaunchFile().launchPDF(context, title1, data);
  }

  void _signOut() async {
  try {
    await widget.auth.signOut();
    widget.onSignedOut();
  } catch (e) {
    print(e);
  }
}

List<String> _categories = [
    'Planning',
    'Assessment & Data',
    'Path',
    'Place',
    'Pace',
    'Classroom Mgmt.',
    'Teacher Role',
    'Student Engagement',
    'Student Collaboration',
    'Technology'
  ];

  List<String> _levels = [
    'Phase Level 1',
    'Phase Level 2',
    'Phase Level 3'
  ];

  var _currentItemSelected = 'Planning';
  var _currentLevelSelected = 'Phase Level 1';
  var lesson = Lesson(
        title: "LevelUp Data",
        fileIndicatorValue: "BlendedLearningDocuments/Phase1Checklist/Phase1ChecklistV2.pdf",
        price: 0,
        content: "This document includes ideas and activites for Leveling Up your Classroom");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF95D03A),
      appBar: AppBar(
      backgroundColor: Color(0xFF95D03A),
       title: RichText(
            text: TextSpan(children: [
              TextSpan(text: 'Blended Learning', style: TextStyle(fontSize: 22.0)
              ),
              TextSpan(text: '\n ', style: TextStyle(fontSize: 28.0)),
              TextSpan( text: 'Level Up', style: TextStyle(fontSize: 25.0)
              )
            ],
            style: TextStyle(color: Color.fromRGBO(58, 66, 86, 1), fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          textAlign: TextAlign.center),
      actions: <Widget>[
        FlatButton(
          child: Text('Logout', style: TextStyle(fontSize: 15.0, color: Colors.white)), 
          onPressed: _signOut
        )
      ],
    ),
      body: Center(
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Color.fromRGBO(58, 66, 86, 1),),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Color.fromRGBO(58, 66, 86, 1),
                padding: EdgeInsets.all(8),
                child: DropdownButtonFormField<String>(
                  iconSize: 50.0,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0, color: Colors.white),
                    labelText: 'Select a Category',
                  ),
                  iconEnabledColor: Colors.white,
                  items: _categories.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(
                        dropDownStringItem, 
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
                        ),
                    );
                  }).toList(),
                  onChanged: (String newValueSelected) {
                    _onDropDownItemSelected(newValueSelected);
                  },
                  value: _currentItemSelected,
                )
              ),
              Divider(
                height: 10.0,
                color: Theme.of(context).primaryColor),
                Container(
                color: Color.fromRGBO(58, 66, 86, 1),
                padding: EdgeInsets.all(8),
                child: DropdownButtonFormField<String>(
                  iconSize: 50.0,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0, color: Colors.white),
                    labelText: 'Select a Level',
                  ),
                  iconEnabledColor: Colors.white,
                  items: _levels.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(
                        dropDownStringItem, 
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
                        ),
                    );
                  }).toList(),
                  onChanged: (String newValueSelected) {
                    _onDropDownValueSelected(newValueSelected);
                  },
                  value: _currentLevelSelected,
                )
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: RaisedButton(
                  child: Text('Display'),
                  onPressed: () => _getData(context, _currentItemSelected+_currentLevelSelected+'.pdf', lesson.title),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text(_myActivityResult),
              )
            ],
          ),
        ),
      ),
    )
    );
  }

  _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }

  _onDropDownValueSelected(String newValueSelected) {
    setState(() {
      this._currentLevelSelected = newValueSelected;
    });
  }
}