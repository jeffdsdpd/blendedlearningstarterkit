import 'package:flutter/material.dart';
import 'auth.dart';

class LoginPage extends StatefulWidget {

  LoginPage({this.auth, this.onSignedIn});

  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

enum FormType {
  login,
  register
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>(); 
  String _email;
  String _password;
  FormType _formType = FormType.login;

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
        if (_formType == FormType.login) {
          await widget.auth.signInWithEmailAndPassword(_email, _password);
        } else {
          await widget.auth.createUserWithEmailAndPassword(_email, _password);
        }
        widget.onSignedIn();
      } catch (e) {
        print(e);
      }
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() { //when you call setState, the 'build' method gets called again
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF95D03A),
        title: Column(
          children: <Widget>[
            Text('DSDProfessionalDevelopment',
            style: TextStyle(color: Colors.white, fontSize: 25.0),
          ),
              Text('Blended Learning Resources',
              style: TextStyle(color: Colors.white, fontSize: 20.0,),
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
            children: buildInputs() + buildSubmitButtons(), //call the methods below to paint the inputs and buttons accordingly
          ),
      ),

        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment(0.1, 0.3),
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
            image: AssetImage(
                'assets/images/dsdpdlogo.png'),
            fit: BoxFit.scaleDown,
          ),
          shape: BoxShape.circle,
        ),
      
    )


    );
  }

  List<Widget> buildInputs() {
    return [
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
    ];
  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login) {
      return [
        RaisedButton(
          child: Text('Login', style: TextStyle(fontSize: 25.0)),
          onPressed: validateAndSubmit,
          ),
        FlatButton(
          child: Text('Create an Account', style: TextStyle(fontSize: 25.0)),
          onPressed: moveToRegister,
        )
      ];
    } else {
      return [
        RaisedButton(
          child: Text('Create an Account', style: TextStyle(fontSize: 25.0)),
          onPressed: validateAndSubmit,
          ),
        FlatButton(
          child: Text('Have an Account? Login', style: TextStyle(fontSize: 25.0)),
          onPressed: moveToLogin,
        )
      ];
    }
  }
}