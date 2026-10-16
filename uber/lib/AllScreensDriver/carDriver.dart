import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uber/AllScreens/profileTabPage.dart';
import 'package:uber/AllScreens/registerationScreen.dart';
import 'package:uber/AllScreensDriver/mainscreen.dart';
import 'package:uber/tabsPagesDriver/profileTabPage.dart';

import '../configMaps.dart';
import '../main.dart';

class CarDriver extends StatelessWidget {
  static const String idScreen = "car";

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding:  EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10,),

                Text('Car Details', style: TextStyle(fontSize: 22.0, fontFamily: 'Brand Bold'),),
                SizedBox(
                        height: 20.0,
                      ),
                Divider(
                        height: 2.0,
                        thickness: 2.0,
                      ),
                SizedBox(
                        height: 20.0,
                      ), 
           
                Text(
                  "Model : "+ driversInformation?.car_model ??" " 
                  ,style: TextStyle(color: Colors.black,fontSize: 16),
                ),
                SizedBox(
                        height: 20.0,
                      ),
                Divider(
                        height: 2.0,
                        thickness: 2.0,
                      ),
                SizedBox(
                        height: 20.0,
                      ),
                Text(
                  
                   "Matricule : "+driversInformation?.car_number  ?? " " 
                 ,style: TextStyle(color: Colors.black,fontSize: 16),
                ),
                SizedBox(height: 25,),
                Divider(
                        height: 2.0,
                        thickness: 2.0,
                      ),
                SizedBox(height: 25,),
                Text(
                   
                  "Color : "+ driversInformation?.car_color ?? " ",style: TextStyle(color: Colors.black,fontSize: 16),
                ),
                

                SizedBox(height: 20,),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: RaisedButton(
                    onPressed: ()
                    {
                      
                         Navigator.pushNamedAndRemoveUntil(context, ProfileTabPageDriver.idScreen, (route) => false);
                        
                         
                    },
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: EdgeInsets.all(17.0),
                      child: Row(
                        
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          
                          Text("Close", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),),
                          SizedBox(width: 0,),
                          Icon(Icons.close, color: Colors.white, size: 16.0,),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
