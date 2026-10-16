import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uber/AllScreensDriver/resetpassword.dart';
import 'package:uber/configMaps.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uber/AllScreensDriver/mainscreen.dart';
import 'package:uber/AllScreensDriver/registrationScreen.dart';
import 'package:uber/AllWidgetsDriver/progressDialog.dart';
import 'package:uber/main.dart';
import 'package:uber/AllScreens/first.dart';

// ignore: must_be_immutable
class LoginScreenDriver extends StatefulWidget {
  static const String idScreen = "loginDriver";

  @override
  _LoginScreenDriverState createState() => _LoginScreenDriverState();
}

class _LoginScreenDriverState extends State<LoginScreenDriver> {
  TextEditingController emailtextEditingController = TextEditingController();

  TextEditingController passwordtextEditingController = TextEditingController();

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, firstPage.idScreen, (route) => false);
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 30.0,
            color: Colors.black,
          ),
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 65.0,
              ),
              Image(
                image: AssetImage("images/uber.png"),
                width: 100.0,
                height: 100.0,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "login as a Driver",
                style: TextStyle(fontSize: 22.0, fontFamily: "Brand-Bold"),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(height: 1),
                    TextField(
                      controller: emailtextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 1),
                    TextField(
                      controller: passwordtextEditingController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                        suffixIcon: InkWell(
                          onTap: _toggle,
                          child: Icon(
                            _obscureText
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            size: 15.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),

                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, resetpasswordDriver.idScreen, (route) => false);
                      },
                      child: Text(
                        "                                            Forgot Password ?",
                        style: TextStyle( color: Colors.blue,),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  
                    RaisedButton(
                      color: Colors.black,
                      textColor: Colors.white,
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 18.0, fontFamily: "Brand-Bold"),
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24.0),
                      ),
                      onPressed: () {
                        if (!emailtextEditingController.text.contains("@")) {
                          displayToastMessage(
                              "adress email is not valid !", context);
                        } else if (passwordtextEditingController.text.isEmpty) {
                          displayToastMessage("Pasword is mandatory.", context);
                        } else {
                          loginAndAuthenticateUser(context);
                        }
                      },
                    ),
                    SizedBox(
                      height: 0.0,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context,
                            RegisterationScreenDriver.idScreen,
                            (route) => false);
                      },
                      child: Text(
                        "Do not have an Account ?   Register Here.",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                   
                  ],
                ),
              ),

              // ignore: deprecated_member_use
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void loginAndAuthenticateUser(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialogDriver(
            message: "Authenticating,Please wait...",
          );
        });

    // ignore: deprecated_member_use
    final User firebaseUser = (await _firebaseAuth
            .signInWithEmailAndPassword(
                email: emailtextEditingController.text,
                password: passwordtextEditingController.text)
            .catchError((errMsg) {
      Navigator.pop(context);
      displayToastMessage("Error message " + errMsg.toString(), context);
    }))
        .user;

    if (firebaseUser != null) {
      driversRef.child(firebaseUser.uid).once().then((DataSnapshot snap) {
        if (snap.value != null) {
          currentfirebaseUser = firebaseUser;
          Navigator.pushNamedAndRemoveUntil(
              context, MainScreenDriver.idScreen, (route) => false);
          displayToastMessage("You are logged-in now .", context);
        } else {
          Navigator.pop(context);
          _firebaseAuth.signOut();
          displayToastMessage(
              "No record exists  for this user . Please create new account ",
              context);
        }
      });
    } else {
      Navigator.pop(context);

      displayToastMessage("Error Occured, can not ", context);
    }
  }
}
