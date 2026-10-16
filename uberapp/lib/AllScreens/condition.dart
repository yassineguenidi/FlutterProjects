import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uberapp/AllScreens/registerationScreen.dart';

class ConditionScreen extends StatefulWidget {
  static const String idScreen = "condition";

  @override
  _ConditionScreenState createState() => _ConditionScreenState();
}

class _ConditionScreenState extends State<ConditionScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 35.0,
              ),
              Image(
                image: AssetImage("images/logo.png"),
                width: 390.0,
                height: 250.0,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 1.0,
              ),
              Text(
                "Login as a Rider",
                style: TextStyle(fontSize: 24.0, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.0,
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            "Accepter les conditions d'utilisation ",
                            style: TextStyle(
                                fontSize: 18.0, fontFamily: "Brand Bold"),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context,
                            RegisterationScreen.idScreen, (route) => false);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
