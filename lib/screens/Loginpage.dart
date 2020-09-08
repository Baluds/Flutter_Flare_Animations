//Here the Bear's eyes look at the cursor on textfields
import 'package:White_Bear/components/signinbutton.dart';
import 'package:White_Bear/services/teddy_controller.dart';
import 'package:White_Bear/services/tracking_text_input.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Loginpg extends StatefulWidget {
  Loginpg({Key key}) : super(key: key);

  @override
  _LoginpgState createState() => _LoginpgState();
}

class _LoginpgState extends State<Loginpg> {
  TeddyController _teddyController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _password;

  @override
  initState() {
    _teddyController = TeddyController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromRGBO(93, 142, 155, 1.0),
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned.fill(
                child: Container(
              decoration: BoxDecoration(
                // Box decoration takes a gradient
                gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.0, 1.0],
                  colors: [
                    Colors.lightBlue[200],
                    Colors.blue[700],
                  ],
                ),
              ),
            )),
            Positioned.fill(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    left: 20.0, right: 20.0, top: devicePadding.top + 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: _height * 0.37,
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: FlareActor(
                        "assets/Am_bearv1.flr",
                        shouldClip: false,
                        alignment: Alignment.bottomCenter,
                        fit: BoxFit.fitHeight,
                        controller: _teddyController,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              TrackingTextInput(
                                label: "Email",
                                hint: 'Enter Your Email ID',
                                onCaretMoved: (Offset caret) {
                                  _teddyController.lookAt(caret);
                                },
                                onTextChanged: (String value) {
                                  //_teddyController.setPassword(value);
                                  // _email = value;
                                },
                                func: (value) {
                                  //for validation
                                  Pattern pattern =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  RegExp regex = new RegExp(pattern);
                                  if (value.trim().isEmpty) {
                                    // setState(() {}); add a loading functionality
                                    return 'Email can\'t be empty';
                                  } else if (!regex.hasMatch(value.trim()))
                                    return 'wrong email id';
                                  return null;
                                },
                              ),
                              TrackingTextInput(
                                label: "Password",
                                hint: "Enter Your password",
                                isObscured: true,
                                onCaretMoved: (Offset caret) {
                                  _teddyController.lookAt(caret);
                                },
                                onTextChanged: (String value) {
                                  //_teddyController.setPassword(value);
                                  _password = value;
                                },
                                func: (value) {
                                  if (value.isEmpty) {
                                    // setState(() {}); add a loading functionality
                                    return 'Password can\'t be empty';
                                  }
                                  return null;
                                },
                              ),
                              SigninButton(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontFamily: "RobotoMedium",
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                                onPressed: () {
                                  if (_password == 'login') {
                                    _teddyController.submitPassword(
                                        true, context);
                                  } else {
                                    _teddyController.submitPassword(
                                        false, context);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
