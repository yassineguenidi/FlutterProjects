import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uber/AllScreens/first.dart';

class HowToUseScreen extends StatefulWidget {
  static const String idScreen = "howToUse";

  @override
  _HowToUseScreenState createState() => _HowToUseScreenState();
}

class _HowToUseScreenState extends State<HowToUseScreen> {
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
                height: 110.0,
              ),
               Text(
                " How to use our application ?",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30.0,
              ),
              Image(
                image: AssetImage("images/im1.png"),
                width: 390.0,
                height: 250.0,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                " Create an account.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "All you need is an email address and a phone number."
                " You can order a ride from your Uber app.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50.0,
              ),
              Image(
                image: AssetImage("images/im2.png"),
                width: 390.0,
                height: 250.0,
                alignment: Alignment.center,
              ),
               SizedBox(
                height: 20.0,
              ),
              Text(
                " Enter your destination. ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                " Open the app and enter your destination in the Where are you going field ?"
                " Press Confirm to confirm your pick-up location,"
                " then press this button again to find a nearby driver.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50.0,
              ),
              Image(
                image: AssetImage("images/im3.png"),
                width: 390.0,
                height: 250.0,
                alignment: Alignment.center,
              ),

               SizedBox(
                height: 20.0,
              ),
              Text(
                " Find your driver.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                " You can follow its arrival on the map. "
                " When it's just a few minutes away,"
                " wait for it at the pick-up point. ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,
              ),
               SizedBox(
                height: 50.0,
              ),
              Image(
                image: AssetImage("images/im4.png"),
                width: 390.0,
                height: 250.0,
                alignment: Alignment.center,
              ),
               SizedBox(
                height: 20.0,
              ),
              Text(
                " Check the details of the race.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                " For each ride made with Uber,"
                " make sure you get in the correct car "
                " driven by the right driver. "
                " For it, "
                " compare the registration,"
                " the make and model of the car as well as the photo of the driver"
                " with the information indicated in the application. "
                " Uber rides can only be ordered from the app."
                "Also, never get into a vehicle if it "
                " or driver identity is different from what is in your application.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,
              ),
               SizedBox(
                height: 50.0,
              ),
              Image(
                image: AssetImage("images/im5.png"),
                width: 390.0,
                height: 250.0,
                alignment: Alignment.center,
              ),
               SizedBox(
                height: 20.0,
              ),
              Text(
                " Relax. ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                " When you arrive, you can easily pay for the ride. "
                " Depending on your region, several options are available to you."
                " You can pay in cash at the moment",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,
              ),
               SizedBox(
                height: 50.0,
              ),
              Image(
                image: AssetImage("images/im6.png"),
                width: 390.0,
                height: 250.0,
                alignment: Alignment.center,
              ),
               SizedBox(
                height: 20.0,
              ),
              Text(
                " Note your run. ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                " Tell us how your race went."
                " You can also pay your driver a compliment or tip them in the app.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,
              ),
               SizedBox(
                height: 50.0,
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
                            "      I get it      ",
                            style: TextStyle(
                                fontSize: 18.0, fontFamily: "Brand Bold"),
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24.0),
                      ),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, firstPage.idScreen, (route) => false);
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
