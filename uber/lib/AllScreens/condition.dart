import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uber/AllScreens/first.dart';
import 'package:uber/AllScreens/howToUse.dart';
import 'package:uber/AllScreens/registerationScreen.dart';

class ConditionScreen extends StatefulWidget {
  static const String idScreen = "condition";

  @override
  _ConditionScreenState createState() => _ConditionScreenState();
}

class _ConditionScreenState extends State<ConditionScreen> {


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
                width: 350.0,
                height: 250.0,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 1.0,
              ),
               
               Text(" These Terms apply to the extent that they do not conflict with the terms of use and additional terms that apply specifically to mobile applications.",
                style: TextStyle(  color: Colors.white ,fontSize: 15.50, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,  
              ),
              SizedBox(
                height: 20.0,
              ),

              SizedBox(
                height: 10.0,
              ),
               Text(" You will be asked to agree to these types of conditions separately.",
                style: TextStyle(  color: Colors.white ,fontSize: 15.50, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,  
              ),
              SizedBox(
                height: 20.0,
              ),
               Text( " Services provided to you by Uber include:",
                style: TextStyle(  color: Colors.white ,fontSize: 17.0, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,  
              ),
              SizedBox(
                height: 30.0,
              ),
               Text(" Access and use of mobile applications that allow you to request and receive Third Party Services and / or Services Provided by Uber ",
                style: TextStyle(  color: Colors.white ,fontSize: 15.5, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,  
              ),
              SizedBox(
                height: 10.0,
              ),
               Text( "you may need to agree to separate general conditions ",
                style: TextStyle(  color: Colors.white ,fontSize: 15.5, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,  
              ),
              SizedBox(
                height: 10.0,
              ),
               Text( " You must provide us with certain personal information to register,",
                style: TextStyle(  color: Colors.white ,fontSize: 15.5, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,  
              ),
              SizedBox(
                height: 10.0,
              ),

               Text(" including your phone number and email address.",
                style: TextStyle(  color: Colors.white ,fontSize: 15.50, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,  
              ),
              SizedBox(
                height: 10.0,
              ),
               Text("We may temporarily restrict, ",
                style: TextStyle(  color: Colors.white ,fontSize: 15.5, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,  
              ),

              SizedBox(
                height: 40.0,
              ),
               Text("Your obligations",
                style: TextStyle(  color: Colors.white ,fontSize: 18.0, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,  
              ),
              SizedBox(
                height: 20.0,
              ),
               Text("When you use the Services App (s), ",
                style: TextStyle(  color: Colors.white ,fontSize: 15.5, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,  
              ),
              SizedBox(
                height: 10.0,
              ),
               Text(" you must comply with all applicable legislation." ,
                style: TextStyle(  color: Colors.white ,fontSize: 15.50, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,  
              ),
              SizedBox(
                height: 10.0,
              ),
               Text("You may only use the Services App (s) for lawful purposes" ,
                style: TextStyle(  color: Colors.white ,fontSize: 15.50, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,  
              ),
               Text(" For which they were designed, as set out in these Terms.",
                style: TextStyle(  color: Colors.white ,fontSize: 15.50, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,  
              ),
              SizedBox(
                height: 10.0,
              ),
               Text("You must not misuse Uber's mobile applications or attempt to commit fraudulent acts against us or the Third Party Providers.",
                style: TextStyle(  color: Colors.white ,fontSize: 15.50, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,  
              ),
              SizedBox(
                height: 10.0,
              ),
               Text(" You must provide accurate and complete information when registering an account and when using the Services App (s)",
                style: TextStyle(  color: Colors.white ,fontSize: 15.50, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,  
              ),
              SizedBox(
                height: 10.0,
              ),
               Text( "Your account is personal. It cannot be rented or shared,",
                style: TextStyle(  color: Colors.white ,fontSize: 15.50, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,  
              ),
              SizedBox(
                height: 20.0,
              ),
               Text(" Once you have created an account:",
                style: TextStyle(  color: Colors.white ,fontSize: 15.50, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,  
              ),
              SizedBox(
                height: 10.0,
              ),
               Text( "You cannot register more than one account, ",
                style: TextStyle(  color: Colors.white ,fontSize: 15.50, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,  
              ),
              SizedBox(
                height: 10.0,
              ),
               Text(" You cannot authorize third parties to use your account, ",
                style: TextStyle(  color: Colors.white ,fontSize: 15.50, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,  
              ),
              SizedBox(
                height: 10.0,
              ),
               Text(" Don't transfer your account to a third party;",
                style: TextStyle(  color: Colors.white ,fontSize: 15.50, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,  
              ),
              SizedBox(
                height: 10.0,
              ),
               Text(" You must not divulge your confidential login information;",
                style: TextStyle(  color: Colors.white ,fontSize: 15.5, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,  
              ),
              SizedBox(
                height: 30.0,
              ),
               Text("By accepting these Terms, you agree to be bound by them.",
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
                    RaisedButton(
                      color: Colors.white,
                      textColor: Colors.black,
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            "  I agree and accept all  ",
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
