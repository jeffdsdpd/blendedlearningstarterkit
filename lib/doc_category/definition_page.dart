import 'package:blendedlearningstarterkit/doc_category/videolist.dart';
import 'package:blendedlearningstarterkit/youtubeplayer_page.dart';
import 'package:flutter/material.dart';


class DefinitionPage extends StatefulWidget {

@override
  _DefinitionPageState createState() => _DefinitionPageState();
}

class _DefinitionPageState extends State<DefinitionPage> {
  List lessons;
  final List<Video> _allVideos = Video.allCities();

  @override
  Widget build(BuildContext context) {
   return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Blended Learning Explained",
          style: new TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87),
        ),
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