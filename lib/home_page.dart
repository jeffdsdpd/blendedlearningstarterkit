import 'package:blendedlearningtoolkit/doc_category/definition_page.dart';
import 'package:blendedlearningtoolkit/doc_category/resource_page.dart';
import 'package:flutter/material.dart';
import 'package:koukicons/collaboration.dart';
import 'package:koukicons/vid3.dart';
import 'package:koukicons/write.dart';
import 'auth.dart';
import 'package:koukicons/archive.dart';
import 'package:koukicons/approval.dart';
import 'package:koukicons/shop.dart';

import 'doc_category/webview_page.dart';

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
    "Training",
    "Resources",
    "Certification",
    "Store",
    "Blog",
    "Contact"
  ];

final List licons = [
  KoukiconsVid3(width: 85.0),
  KoukiconsArchive(width: 85.0),
  KoukiconsApproval(width: 85.0),
  KoukiconsShop(width: 95.0),
  KoukiconsWrite(width: 85.0),
  KoukiconsCollaboration(width: 85.0)
];

void _onButtonPressed(int index) {
  switch(index) { 
      case 0: { Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DefinitionPage(auth: widget.auth, onSignedOut: widget.onSignedOut)));
                    }
      break; 
     
      case 1: { Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResourcePage()));
                    }
      break; 
     
      case 2: { Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebViewContainer('https://www.dsdcoaching.com/', 'Certification')));
                    }
      break; 
     
      case 3: { Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebViewContainer('https://www.dsdprofessionaldevelopment.com/store.html', 'Store')));
                    }
      break;

      case 4: { Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebViewContainer('https://www.dsdprofessionaldevelopment.com/blended-learning-blog', 'Blog')));
                    }
      break;

      case 5: { Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebViewContainer('https://www.dsdprofessionaldevelopment.com/contact-us.html', 'Contact Us')));
                    }
      break; 
     
      default: { print("Invalid choice"); } 
      break; 
   } 
}

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

  get header => AppBar(
      backgroundColor: Color(0xFF95D03A),
      title: RichText(
            text: TextSpan(children: [
              TextSpan(text: 'DSD Professional Development', style: TextStyle(fontSize: 15.0)
              ),
              TextSpan(text: '\n ', style: TextStyle(fontSize: 10.0)),
              TextSpan( text: 'Blended Learning Guide', style: TextStyle(fontSize: 20.0)
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
                    children: <Widget>[IconButton(icon:
                      licons[index],
                      iconSize: 85.0,
                      onPressed: (){_onButtonPressed(index);}
                      ), 
                      Padding(padding: EdgeInsets.all(12.0),
                      ), 
                      Text(litems[index], style: TextStyle(fontSize: 21, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      );
}