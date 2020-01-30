import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget { 

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  bool validateAndSave() {
    final form = formKey.currentState;
    if(form.validate()) {
      form.save();
      return true;
    }
      return false;
  }

  void validateAndSubmit() async {
    if(validateAndSave()) {
      try {
        FirebaseUser firebaseuser = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        print('Signed in: ${firebaseuser.uid}');
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF95D03A),
        title: Column(
          children: <Widget>[
            Text('DSDProfessionalDevelopment',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          Padding(
            padding: EdgeInsets.all(3.0)),
              Text('Blended Learning Starterkit',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
          )
        ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                style: TextStyle(fontSize: 25.0),
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
                onSaved: (value) => _email = value,
              ),
              TextFormField(
                style: TextStyle(fontSize: 25.0),
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
                onSaved: (value) => _password = value,
              ),
              RaisedButton(
                child: Text('Login', style: TextStyle(fontSize: 25.0)),
                onPressed: validateAndSubmit,
                )
            ],
          ),
      )
    )
    );
  }
}