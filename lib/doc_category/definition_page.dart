import 'package:blendedlearningtoolkit/auth.dart';
import 'package:blendedlearningtoolkit/doc_category/videolist.dart';
import 'package:blendedlearningtoolkit/youtubeplayer_page.dart';
import 'package:flutter/material.dart';

class DefinitionPage extends StatefulWidget {
DefinitionPage({this.auth, this.onSignedOut});

final BaseAuth auth;
final VoidCallback onSignedOut;

@override
  _DefinitionPageState createState() => _DefinitionPageState();
}

class _DefinitionPageState extends State<DefinitionPage> {
  List lessons;
  final List<Video> _allVideos = Video.allCities();


void _signOut() async {
  try {
    await widget.auth.signOut();
    widget.onSignedOut();
    Navigator.popUntil(context, ModalRoute.withName("/"));
  } catch (e) {
    print(e);
  }
}

  @override
  Widget build(BuildContext context) {
   return new Scaffold(
      appBar: AppBar(
      backgroundColor: Color(0xFF95D03A),
      title: RichText(
            text: TextSpan(children: [
              TextSpan(text: 'Blended Learning', style: TextStyle(fontSize: 22.0)
              ),
              TextSpan(text: '\n ', style: TextStyle(fontSize: 28.0)),
              TextSpan( text: 'Training', style: TextStyle(fontSize: 25.0)
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
      body: new Padding(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: getHomePageBody(context)));
}

getHomePageBody(BuildContext context) {
  return ListView.builder(
    itemCount: _allVideos.length,
    itemBuilder: _getItemUI,
    padding: EdgeInsets.all(0.0),
  );
}
  // First Attempt
  Widget _getItemUI(BuildContext context, int index) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new ListTile(
            leading: new Image.asset(
              "assets/images/" + _allVideos[index].image,
              fit: BoxFit.cover,
              width: 100.0,
            ),

            title: new Text(
              _allVideos[index].title,
              style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            subtitle: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(_allVideos[index].description,
                      style: new TextStyle(
                          fontSize: 13.0, fontWeight: FontWeight.normal)),
                ]),
            //trailing: ,
            onTap: () {
              _launchUrlVideo(context, _allVideos[index].url);
            },
          )
        ],
      )
    );
  }

_launchUrlVideo(BuildContext context, String url) {
  Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => YouTubePlayer(url)));
}

}