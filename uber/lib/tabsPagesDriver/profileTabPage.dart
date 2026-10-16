import 'package:uber/AllScreens/changeNumber.dart';
import 'package:uber/AllScreensDriver/carDriver.dart';
import 'package:uber/AllScreensDriver/changeNumber.dart';
import 'package:uber/AllScreensDriver/loginScreen.dart';
import 'package:uber/configMaps.dart';
import 'package:uber/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geofire/flutter_geofire.dart';

class ProfileTabPageDriver extends StatelessWidget {
  static const String idScreen = "profilDriver";
  
//String info = driversInformation?.car_model ??" "  + driversInformation?.car_number  ?? " "  + driversInformation?.car_color ?? " ";
  @override
  Widget build(BuildContext context)
  {
       //carDetailsDriver = driversRef.child(firebaseUser.uid).child("car details").onValue(phoneTextEditingController.text.trim());
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              driversInformation?.name??"",
              style: TextStyle(
                fontSize: 65.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Signatra',
              ),
            ),

            Text(
              title + " driver",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blueGrey[200],
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Brand-Regular'
              ),
            ),

            SizedBox(
              height: 20,
              width: 200,
              child: Divider(
                color: Colors.white,
              ),
            ),

            SizedBox(height: 40.0,),

            InfoCard(
              text: driversInformation?.phone ?? "",
              icon: Icons.phone,
              iconChange: Icons.border_color,
              onPressed: () async {
                Navigator.pushNamedAndRemoveUntil(context, changePasswordDriver.idScreen, (route) => false);
              },
            ),

            InfoCard(
              
              text: driversInformation?.email ?? "",
              icon: Icons.email,
              onPressed: () async {
                print("this is email.");
              },
            ),
              
            InfoCard(
         
           text: "Car  Details",
             // text: driversInformation?.car_model ??" " + " " + driversInformation?.car_number  ?? " " + " " + driversInformation?.car_color ?? " " ,
              icon: Icons.car_repair,
              iconChange: Icons.remove_red_eye_outlined ,
              onPressed: () async {
               Navigator.pushNamedAndRemoveUntil(context, CarDriver.idScreen, (route) => false);
              },
            ),

            GestureDetector(
              onTap: ()
              {
                Geofire.removeLocation(currentfirebaseUser?.uid);
                rideRequestRefd.onDisconnect();
                rideRequestRefd.remove();
                rideRequestRefd = null;
                

                FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(context, LoginScreenDriver.idScreen, (route) => false);
              },
              child: Card(
                color: Colors.red,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 110.0),
                child: ListTile(
                  trailing: Icon(
                    Icons.follow_the_signs_outlined,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Sign out",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontFamily: 'Brand Bold',
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class InfoCard extends StatelessWidget
{
  final String text;
  final String text2;
  final String text3;
  final IconData icon;
  final IconData iconChange;
  Function onPressed;

  InfoCard({
    this.text,
    this.text2,
    this.text3,
    this.icon,
    this.iconChange,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.black87,
          ),
          
          title: Text(
            text,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16.0,
              fontFamily: 'Brand Bold',
            ),
          ),
           trailing: Icon(
            iconChange,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

