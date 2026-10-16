import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uber/AllScreens/first.dart';
import 'package:uber/AllScreens/howToUse.dart';
import 'package:uber/AllScreens/registerationScreen.dart';

import 'condition.dart';

class ConditionabScreen extends StatefulWidget {
  static const String idScreen = "conditionab";

  @override
  _ConditionabScreenState createState() => _ConditionabScreenState();
}

class _ConditionabScreenState extends State<ConditionabScreen> {


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
                height: 0.0,
              ),
              Image(
                image: AssetImage("images/uberb.jpg"),
                width: 390.0,
                height: 250.0,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 1.0,
              ),
              Text(
                " These Terms apply to the extent that they do not conflict" 
                " with the conditions of use and additional conditions that apply"
                " specifically for mobile applications."
               
             ,
                style: TextStyle(  color: Colors.white ,fontSize: 16.0, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,
                
              ),
               SizedBox(
                height: 30.0,
              ),
              Text(
                 " You will be asked to accept this type of conditions separately."
             ,
                style: TextStyle(  color: Colors.white ,fontSize: 17.0, fontFamily: "Brand Bold"),
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
                    FlatButton(
                      color: Colors.black,
                      textColor: Colors.white,
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            "        See more...      ",
                            style: TextStyle(
                                fontSize: 18.0, fontFamily: "Brand Bold"),
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24.0),
                      ),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context,
                            ConditionScreen.idScreen, (route) => false);
                      },
                    ),
                
                     SizedBox(
                      height: 100.0,
                    ),
                    RaisedButton(
                      color: Colors.white,
                      textColor: Colors.black,
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            "  I agree and Accept all",
                            style: TextStyle(
                                fontSize: 18.0, fontFamily: "Brand Bold"),
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24.0),
                      ),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context,
                            HowToUseScreen.idScreen, (route) => false);
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
