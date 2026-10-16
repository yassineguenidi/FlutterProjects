import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uber/AllScreens/loginScreen.dart';
import 'package:uber/AllScreens/mainscreen.dart';
import 'package:uber/AllScreens/registerationScreen.dart';
import 'package:uber/AllScreensDriver/loginScreen.dart';
import 'package:uber/AllScreensDriver/mainscreen.dart';
import 'package:uber/AllWidgets/progressDialog.dart';
import 'package:uber/configMaps.dart';
import 'package:uber/main.dart';

class firstPage extends StatefulWidget {
  static const String idScreen = "first";

  @override
  _firstPageState createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[520],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 110.0,
              ),
              Text(
                "Choose Your Account ",
                style: TextStyle(fontSize: 30.0, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40.0,
              ),
              Image(
                image: AssetImage("images/user2.png"),
                width: 200.0,
                height: 200.0,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 0.0,
              ),
              RaisedButton(
                color: Colors.black,
                textColor: Colors.white,
                child: Container(
                  height: 50.0,
                  child: Center(
                    child: Text(
                      "Login as a Rider",
                      style:
                          TextStyle(fontSize: 18.0, fontFamily: "Brand Bold"),
                    ),
                  ),
                ),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(24.0),
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context,
                      FirebaseAuth.instance.currentUser == null
                          ? LoginScreen.idScreen
                          : MainScreen.idScreen,
                      (route) => false);
                },
              ),
              SizedBox(
                height: 35.0,
              ),
              Image(
                image: AssetImage("images/driver2.png"),
                width: 140.0,
                height: 140.0,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 30.0,
              ),
              RaisedButton(
                  color: Colors.black,
                  textColor: Colors.white,
                  child: Container(
                    height: 50.0,
                    child: Center(
                      child: Text(
                        "Login as a Driver",
                        style:
                            TextStyle(fontSize: 18.0, fontFamily: "Brand Bold"),
                      ),
                    ),
                  ),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(24.0),
                  ),
                  onPressed: () {
                         FirebaseAuth.instance.signOut();
                        Navigator.pushNamedAndRemoveUntil(
                      context,
                      FirebaseAuth.instance.currentUser == null
                          ? LoginScreenDriver.idScreen
                          : MainScreenDriver.idScreen,
                      (route) => false);
                  }),
            
            ],
          ),
        ),
      ),
    );
  }
}
