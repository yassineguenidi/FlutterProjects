import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uber/Models/allUsers.dart';

import 'Models/drivers.dart';

String mapKey = "AIzaSyBnpo2B3F-Ka2fJkNvPgCGj9gxHrcl5zZg";
String mapkey = "AIzaSyBnpo2B3F-Ka2fJkNvPgCGj9gxHrcl5zZg";

User firebaseUser;
User currentfirebaseUser;
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


StreamSubscription<Position> homeTabPageStreamSubscription;
StreamSubscription<Position> rideStreamSubscription;

final assetsAudioPlayer = AssetsAudioPlayer();
Position currentPosition;
Drivers driversInformation;
String rideType="";