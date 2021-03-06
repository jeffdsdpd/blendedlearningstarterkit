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

  Future<void> _getData(BuildContext context, String filename, String title1) async {
    var data = await FirebaseStorage.instance.ref().child('/BlendedLearningDocuments/LevelUpDocuments/'+filename).getData(10 * 1024 * 1024);
    print('filename is '+filename);
    LaunchFile().launchPDF(context, title1, data);
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

  var _currentItemSelected = 'Planning';

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
                margin: EdgeInsets.only(top: 25),
                color: Color.fromRGBO(58, 66, 86, 1),
                padding: EdgeInsets.all(18),
                child: DropdownButtonFormField<String>(
                  iconSize: 50.0,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0, color: Colors.white),
                    labelText: 'Select a Level Up Item',
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
                padding: EdgeInsets.all(8),
                child: RaisedButton(
                  child: Text('Display'),
                  onPressed: () => _getData(context, _currentItemSelected+'.pdf', lesson.title),
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
}