import 'package:blendedlearningtoolkit/auth.dart';
import 'package:blendedlearningtoolkit/doc_category/teachathomevideolist.dart';
import 'package:blendedlearningtoolkit/doc_category/webview_page.dart';
import 'package:blendedlearningtoolkit/youtubeplayer_page.dart';
import 'package:flutter/material.dart';

class TeachingFromHomeDefinitionPage extends StatefulWidget {
TeachingFromHomeDefinitionPage({this.auth, this.onSignedOut});

final BaseAuth auth;
final VoidCallback onSignedOut;

@override
  _TeachingFromHomeDefinitionPageState createState() => _TeachingFromHomeDefinitionPageState();
}

class _TeachingFromHomeDefinitionPageState extends State<TeachingFromHomeDefinitionPage> {
  List lessons;
  final List<TeachAtHomeVideo> _allVideos = TeachAtHomeVideo.allVideos();

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
              TextSpan( text: 'Teach At Home', style: TextStyle(fontSize: 22.0)
              )
            ],
            style: TextStyle(color: Color.fromRGBO(58, 66, 86, 1), fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          textAlign: TextAlign.center),
    ),
      body: 
          new Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: getHomePageBody(context),
      )
   );
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
              style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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
              if (index != 6) {
              _launchUrlVideo(context, _allVideos[index].url);
              } else {
                Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebViewContainer('https://www.blendedlearningpd.com/', 'Getting Started')));
              }
            },
          ),
        ],
      ),
    );
  }

_launchUrlVideo(BuildContext context, String url) {
  Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => YouTubePlayer(url)));
}

}