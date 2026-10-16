import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:uber/AllScreens/changeNumber.dart';
import 'package:uber/AllScreens/condition.dart';
import 'package:uber/AllScreens/first.dart';
import 'package:uber/AllScreens/howToUse.dart';
import 'package:uber/AllScreens/loginScreen.dart';
import 'package:uber/AllScreens/mainscreen.dart';
import 'package:uber/AllScreens/profileTabPage.dart';
import 'package:uber/AllScreens/registerationScreen.dart';
import 'package:uber/AllScreens/resetpasswordRider.dart';
import 'package:uber/AllScreensDriver/carDriver.dart';
import 'package:uber/AllScreensDriver/changeNumber.dart';
import 'package:uber/AllScreensDriver/historyScreen.dart';
import 'package:uber/AllScreensDriver/resetpassword.dart';
import 'package:uber/DataHandler/appData.dart';
import 'package:uber/tabsPagesDriver/profileTabPage.dart';
import 'AllScreens/conditionab.dart';
import 'AllScreensDriver/carInfosScreen.dart';
import 'AllScreensDriver/loginScreen.dart';
import 'AllScreensDriver/mainscreen.dart';
import 'AllScreensDriver/registrationScreen.dart';
import 'configMaps.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  currentfirebaseUser = FirebaseAuth.instance.currentUser;
  runApp(MyApp());
}

DatabaseReference usersRef = FirebaseDatabase.instance.reference().child("users");
DatabaseReference driversRef = FirebaseDatabase.instance.reference().child("drivers");
DatabaseReference rideRequestRef = FirebaseDatabase.instance.reference().child("Ride Requests");
DatabaseReference newRequestsRef = FirebaseDatabase.instance.reference().child("Ride Requests");   

DatabaseReference rideRequestRefd = FirebaseDatabase.instance
    .reference()
    .child("drivers")
    .child(currentfirebaseUser.uid)
    .child("newRide");

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        title: 'Uber App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
         /*FirebaseAuth.instance.currentUser == usersRef.child("users") ? 
         initialRoute:  ? LoginScreen().idScreen  : MainScreen.idScreen,
         : initialRoute: FirebaseAuth.instance.currentUser == driverRef.child("drivers") ? LoginScreenDriver().idScreen ,*/
         initialRoute: firstPage.idScreen,
        // initialRoute:  ConditionabScreen.idScreen ,
        /*initialRoute: FirebaseAuth.instance.currentUser == null 
                      ? ConditionabScreen.idScreen 
                     
                      : (FirebaseAuth.instance.currentUser == driversRef.child("drivers") 
                                    ? MainScreenDriver.idScreen
                                    : MainScreen.idScreen),*/
                                   
        routes:
        {
          firstPage.idScreen :(context)=> firstPage(),
          MainScreenDriver.idScreen: (context) => MainScreenDriver(),
          LoginScreenDriver.idScreen: (context) => LoginScreenDriver(),
          RegisterationScreenDriver.idScreen: (context) => RegisterationScreenDriver(),
          RegisterationScreen.idScreen: (context) => RegisterationScreen(),
          LoginScreen.idScreen: (context) => LoginScreen(),
          MainScreen.idScreen: (context) => MainScreen(),
          ConditionScreen.idScreen: (context) => ConditionScreen(),
          ConditionabScreen.idScreen: (context) => ConditionabScreen(),
          HowToUseScreen.idScreen: (context) => HowToUseScreen(),
          CarInfoScreen.idScreen: (context) => CarInfoScreen(),
          changePassword.idScreen: (context) => changePassword(),
          changePasswordDriver.idScreen: (context) => changePasswordDriver(),
          ProfileTabPage.idScreen: (context) => ProfileTabPage(),
          CarDriver.idScreen: (context) => CarDriver(),
          ProfileTabPageDriver.idScreen: (context) => ProfileTabPageDriver(),
          resetpasswordDriver.idScreen: (context) => resetpasswordDriver(),
           resetpasswordRider.idScreen: (context) => resetpasswordRider(),
           historyScreenDriver.idScreen: (context) => historyScreenDriver(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
