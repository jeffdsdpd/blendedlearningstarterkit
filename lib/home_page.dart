import 'package:flutter/material.dart';
import 'auth.dart';
import 'package:koukicons/files.dart';
import 'package:koukicons/archive.dart';
import 'package:koukicons/approval.dart';
import 'package:koukicons/shop.dart';


class HomePage extends StatefulWidget {
HomePage({this.auth, this.onSignedOut});

final BaseAuth auth;
final VoidCallback onSignedOut;

@override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

void _signOut() async {
  try {
    await widget.auth.signOut();
    widget.onSignedOut();
  } catch (e) {
    print(e);
  }
}

final List<String> litems = [
    "Definitions",
    "Resources",
    "Certification",
    "Store",
  ];

  final List licons = [
    KoukiconsFiles(width: 75.0),
    KoukiconsArchive(width: 75.0),
    KoukiconsApproval(width: 75.0),
    KoukiconsShop(width: 95.0)
  ];

@override
 Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[dashBg, content],
      ),
    );
  }

  get dashBg => Column(
        children: <Widget>[
          Expanded(
            child: Container(color: Color(0xFF95D03A)),
            flex: 2,
          ),
          Expanded(
            child: Container(color: Colors.transparent),
            flex: 5,
          ),
        ],
      );

  get content => Container(
        child: Column(
          children: <Widget>[
            header,
            grid,
          ],
        ),
      );

  get header => ListTile(
    contentPadding: EdgeInsets.only(left: 20, right: 20, top: 80, bottom: 20),
    title: Column(
          children: <Widget>[
            Text('DSDProfessionalDevelopment',
            style: TextStyle(color: Colors.white, fontSize: 24.0),
          ),
              Text('Blended Learning Starterkit',
              style: TextStyle(color: Colors.white, fontSize: 22.0,),
          )
        ],
        ),
  );

  get grid => Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: GridView.count(
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            crossAxisCount: 2,
            childAspectRatio: .90,
            children: List.generate(litems.length, (index) {
              return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                 child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      licons[index], Text(litems[index],
                      style: TextStyle(fontSize: 25, color: Colors.black),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      );
}