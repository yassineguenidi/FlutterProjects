import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uber/AllScreensDriver/carInfosScreen.dart';
import 'package:uber/configMaps.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uber/AllScreensDriver/loginScreen.dart';
import 'package:uber/AllScreens/first.dart';
import 'package:uber/AllScreensDriver/mainscreen.dart';
import 'package:uber/AllWidgetsDriver/progressDialog.dart';
import 'package:uber/main.dart';

// ignore: must_be_immutable
class RegisterationScreenDriver extends StatefulWidget {
  static const String idScreen = "registerDriver";

  @override
  _RegisterationScreenDriverState createState() => _RegisterationScreenDriverState();
}

class _RegisterationScreenDriverState extends State<RegisterationScreenDriver> {
  TextEditingController nametextEditingController = TextEditingController();
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController phonetextEditingController = TextEditingController();
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
            size: 26.0,
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
                height: 20.0,
              ),
              Image(
                image: AssetImage("images/uber.png"),
                width: 100.0,
                height: 100.0,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Register as a Driver",
                style: TextStyle(fontSize: 20.0, fontFamily: "Brand-Bold",color: Colors.black),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(height: 1),
                    TextField(
                      controller: nametextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Name",
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
                      controller: phonetextEditingController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Phone",
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
                    SizedBox(height: 20),
                    // ignore: deprecated_member_use
                    RaisedButton(
                      color: Colors.black,
                      textColor: Colors.white,
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            "Create Account ",
                            style: TextStyle(
                                fontSize: 18.0, fontFamily: "Brand-Bold"),
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24.0),
                      ),
                      onPressed: () {
                        if (nametextEditingController.text.length < 3) {
                          displayToastMessage(
                              "name must be at least 3 characters.", context);
                        } else if (!emailtextEditingController.text
                            .contains("@")) {
                          displayToastMessage(
                              "adress email is not valid !", context);
                        } else if (phonetextEditingController.text.isEmpty) {
                          displayToastMessage(
                              "phone number is  mandatory.", context);
                        } else if (passwordtextEditingController.text.length <
                            6) {
                          displayToastMessage(
                              "Pasword mut be at least 6 characters.", context);
                        } else {
                          registerNewUser(context);
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context,
                            LoginScreenDriver.idScreen, (route) => false);
                      },
                      child: Text(
                        "Already have an Account ?   Login Here.", 
                        style: TextStyle(color: Colors.blue),
                      ),
                      
                    ),
                     SizedBox(height: 10),         
              
                  ],
                ),
              ),
        
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void registerNewUser(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialogDriver(
            message: "Registering, Please wait...",
          );
        });

    // ignore: deprecated_member_use
    final User firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailtextEditingController.text,
                password: passwordtextEditingController.text)
            .catchError((errMsg) {
      Navigator.pop(context);
      displayToastMessage("Error message " + errMsg.toString(), context);
    }))
        .user;

    if (firebaseUser != null) {
      //save user info to db

      Map userDataMap = {
        "name": nametextEditingController.text.trim(),
        "email": emailtextEditingController.text.trim(),
        "password": passwordtextEditingController.text.trim(),
        "phone": phonetextEditingController.text.trim(),
      };

      driversRef.child(firebaseUser.uid).set(userDataMap);

      currentfirebaseUser = firebaseUser;

      displayToastMessage(
          "Congratulation , your account has been created.", context);
      Navigator.pushNamed(context, CarInfoScreen.idScreen);
    } else {
      Navigator.pop(context);
      //error occured
      displayToastMessage("New user account has not been created", context);
    }
  }
}

displayToastMessage(String s, BuildContext context) {
  Fluttertoast.showToast(msg: s);
}
