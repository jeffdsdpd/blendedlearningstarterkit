import 'package:blendedlearningtoolkit/doc_category/webview_page.dart';
import 'package:flutter/material.dart';

class DeploymentPlanPage extends StatefulWidget {

  DeploymentPlanPage();

  @override
  State<StatefulWidget> createState() => _DeploymentPlanPageState();
}
  
class _DeploymentPlanPageState extends State<DeploymentPlanPage> {

  @override
  Widget build(BuildContext context) {
  
    final coursePrice = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text(
        "\$0.00",
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
          'Deployment Plan',
          style: TextStyle(color: Colors.white, fontSize: 40.0),
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 4,
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
      'This month by month guide will guide any teacher, coach, or administrator through the rollout process of Blended Learning.',
      style: TextStyle(fontSize: 18.0),
    );
    final readButton = Container(
        padding: EdgeInsets.symmetric(vertical: 60.0),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () => { Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebViewContainer('https://www.blendedlearningpd.com/deployment-plan.html', 'Deployment Plan')))
                    },
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
