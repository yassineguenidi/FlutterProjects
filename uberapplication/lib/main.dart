// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uberapplication/AllScreens/loginScreen.dart';
import 'package:uberapplication/AllScreens/mainscreen.dart';
import 'package:uberapplication/DataHandler/appData.dart';

import 'AllScreens/registerationScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

DatabaseReference usersRef =
    FirebaseDatabase.instance.reference().child("users");
DatabaseReference driversRef =
    FirebaseDatabase.instance.reference().child("drivers");
DatabaseReference rideRequestRef =
    FirebaseDatabase.instance.reference().child("Ride Requests");

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  var registerationScreen = RegisterationScreen;
    return  ChangeNotifierProvider(
         create:  (context)=>AppData(),
      child :  MaterialApp(
      title: 'Rider App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MainScreen.idScreen,
      routes: {
        RegisterationScreen.idScreen: (context) => RegisterationScreen(),
        LoginScreen.idScreen: (context) => LoginScreen(),
        MainScreen.idScreen: (context) => MainScreen(),
      },
      debugShowCheckedModeBanner: false,
      ),
    );
  }
}
