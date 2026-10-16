import 'package:firebase_auth/firebase_auth.dart';
import 'package:uberapp/Models/allUsers.dart';

String mapKey = "AIzaSyCBu7IACBj75_XOTu9lsPVJhhzbl2rrv1Q";

User firebaseUser;

Users userCurrentInfo;

int driverRequestTimeOut = 40;
String statusRide = "";
String rideStatus = "Driver is Coming";
String carDetailsDriver = "";
String driverName = "";
String driverphone = "";

double starCounter=0.0;
String title="";
String carRideType="";

String serverToken = "key=AAAACNCIolg:APA91bHKZ6_Hbh77ynqPLQzkboTh16kHgBhUKq8gZ9VeKfQfUjJT2q4guz-gKXqIcCyHoIVPWRSYAVXq_7dov7h33Dfm6pd_bywbfzLeBnTB-qUPHg5yJ4KN7BMsTBH6an6cH93A-ART";
