import 'package:blendedlearningstarterkit/models/lesson.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:blendedlearningstarterkit/mobile_pdf.dart';

class DetailPage extends StatefulWidget {

  final Lesson lesson;
  DetailPage({Key key, this.lesson}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DetailPageState();
}
  
class _DetailPageState extends State<DetailPage> {

  Future<void> _getData(BuildContext context, String title, String title1) async {
    var data = await FirebaseStorage.instance.ref().child(title).getData(10 * 1024 * 1024);
    LaunchFile().launchPDF(context, title1, data);
  }

  @override
  Widget build(BuildContext context) {
  
    final coursePrice = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text(
        // "$20",
        "\$" + this.widget.lesson.price.toString(),
        style: TextStyle(color: Colors.white),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 60.0),
        Icon(
          Icons.content_copy,
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: 10.0),
        Text(
          this.widget.lesson.title,
          style: TextStyle(color: Colors.white, fontSize: 40.0),
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 5,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                )
              ),
            Expanded(flex: 1, child: coursePrice)
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget> [
        Container(
          height: MediaQuery.of(context).size.height * 0.50,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      this.widget.lesson.content,
      style: TextStyle(fontSize: 18.0),
    );
    final readButton = Container(
        padding: EdgeInsets.symmetric(vertical: 60.0),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () => _getData(context, this.widget.lesson.fileIndicatorValue, this.widget.lesson.title),
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child:
              Text("VIEW THIS DOCUMENT", style: TextStyle(color: Colors.white)),
        ));
    final bottomContent = Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText, readButton],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}
