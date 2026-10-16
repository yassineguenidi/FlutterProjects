import 'package:driver_app/Models/history.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:driver_app/Assistants/requestAssistant.dart';
import 'package:driver_app/DataHandler/appData.dart';
import 'package:driver_app/Models/adress.dart';
import 'package:driver_app/Models/allUsers.dart';
import 'package:driver_app/Models/directDetails.dart';
import 'package:driver_app/configMaps.dart';

import '../main.dart';

class AssistantMethods {
  
  /*static Future<String> searchCoordinateAdress(
      Position position, context) async {
    String placeAdress = "";
    // ignore: unused_local_variable
    String st1, st2, st3, st4;
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapkey";

    var response = await RequestAssistant.getRequest(url);

    if (response != "failed") {
       placeAdress = response["results"][0]["formatted_adress"];
     /*    st1 = response["results"][0]["adress_components"][0]["long_name"];
      st2 = response["results"][0]["adress_components"][1]["long_name"];
      st3 = response["results"][0]["adress_components"][5]["long_name"];
      */st4 = response["results"][0]["adress_components"][6]["long_name"];
      //placeAdress = st1 + ", " + st2 + ", " + st3 + ", " + st4;
      Address userPickUpAdress = new Address();
      userPickUpAdress.longitude = position.longitude;
      userPickUpAdress.latitude = position.latitude;
      userPickUpAdress.placeName = placeAdress;

      Provider.of<AppData>(context, listen: false)
          .updatePickUpLocationAddress(userPickUpAdress);
    }
    return placeAdress;
  }
*/

  static Future<DirectionDetails> obtainPlaceDirectionDetails(
      LatLng initialPosition, LatLng finalPosition) async {
    String directionUrl =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${initialPosition.latitude},${initialPosition.longitude}&destination=${finalPosition.latitude},${finalPosition.longitude}&key=$mapkey";

    var res = await RequestAssistant.getRequest(directionUrl);
    if (res == "failed") {
      return null;
    }
    DirectionDetails directionDetails = DirectionDetails();
    directionDetails.encodedPoints =
        res["routes"][0]["overview_polyline"]["points"];

    directionDetails.distanceText =
        res["routes"][0]["legs"][0]["distance"]["text"];
    directionDetails.distanceValue =
        res["routes"][0]["legs"][0]["distance"]["value"];

    directionDetails.durationText =
        res["routes"][0]["legs"][0]["duration"]["text"];
    directionDetails.durationValue =
        res["routes"][0]["legs"][0]["duration"]["value"];

    return directionDetails;
  }

 static int calculateFares(DirectionDetails directionDetails) {
    double timeTraveledFare = (directionDetails.durationValue / 60) * 0.20;
    double distanceTraveledFare =
        (directionDetails.durationValue / 1000) * 0.20;
    double totalFareAmount = timeTraveledFare + distanceTraveledFare;

    // ignore: unused_local_variable
    double totalLocalAmount = totalFareAmount * 3.2;
    
    if(rideType == "uber-x")
    {
      double result = (totalFareAmount.truncate()) * 2.0;
      return result.truncate();
    }
    else if(rideType == "uber-go")
    {
      return totalFareAmount.truncate();
    }
    else if(rideType == "bike")
    {
      double result = (totalFareAmount.truncate()) / 2.0;
      return result.truncate();
    }
    else
    {
      return totalFareAmount.truncate();
    }  
  }

  static void getCurrentOnlineUserInfo() async {
    // ignore: await_only_futures
    firebaseUser = await FirebaseAuth.instance.currentUser;
    String userId = firebaseUser.uid;
    DatabaseReference reference =
        FirebaseDatabase.instance.reference().child("users").child(userId);

    reference.once().then((DataSnapshot dataSnapShot) {
      if (dataSnapShot.value != null) {
       userCurrentInfo = Users.fromSnapshot(dataSnapShot); 
      }
    });
  }

  static void disableHomeTabLiveLocationUpdates() {
    homeTabPageStreamSubscription.pause();
    Geofire.removeLocation(currentfirebaseUser.uid);
  }

  static void enableHomeTabLiveLocationUpdates() {
    homeTabPageStreamSubscription.resume();
    Geofire.setLocation(currentfirebaseUser.uid, currentPosition.latitude,
        currentPosition.longitude);
  }

  static void retrieveHistoryInfo(context) {
   
    //retrieve and display Earnings
    driversRef
        .child(currentfirebaseUser.uid)
        .child("earnings")
        .once()
        .then((DataSnapshot dataSnapshot) {
      if (dataSnapshot.value != null) {
        String earnings = dataSnapshot.value.toString();
        Provider.of<AppData>(context, listen: false).updateEarnings(earnings);
      }
    });

    //retrieve and display Trip History
    driversRef
        .child(currentfirebaseUser.uid)
        .child("history")
        .once()
        .then((DataSnapshot dataSnapshot) {
      if (dataSnapshot.value != null) {
        //update total number of trip counts to provider
        Map<dynamic, dynamic> keys = dataSnapshot.value;
        int tripCounter = keys.length;
        Provider.of<AppData>(context, listen: false)
            .updateTripsCounter(tripCounter);

        //update trip keys to provider
        List<String> tripHistoryKeys = [];
        keys.forEach((key, value) {
          tripHistoryKeys.add(key);
        });
        Provider.of<AppData>(context, listen: false)
            .updateTripKeys(tripHistoryKeys);
        obtainTripRequestsHistoryData(context);
      }
    });
  }

  static void obtainTripRequestsHistoryData(context) {
    var keys = Provider.of<AppData>(context, listen: false).tripHistoryKeys;

    for (String key in keys) {
      newRequestsRef.child(key).once().then((DataSnapshot snapshot) {
        if (snapshot.value != null) {
          var history = History.fromSnapshot(snapshot);
          Provider.of<AppData>(context, listen: false)
              .updateTripHistoryData(history);
        }
      });
    }
  }

  static String formatTripDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate =
        "${DateFormat.MMMd().format(dateTime)}, ${DateFormat.y().format(dateTime)} - ${DateFormat.jm().format(dateTime)}";

    return formattedDate;
  }
}
