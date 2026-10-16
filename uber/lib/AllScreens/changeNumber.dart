import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uber/AllScreens/mainscreen.dart';
import 'package:uber/AllScreens/profileTabPage.dart';
import 'package:uber/AllScreens/registerationScreen.dart';

import '../configMaps.dart';
import '../main.dart';

class changePassword extends StatelessWidget {
  static const String idScreen = "passwd";
  TextEditingController phoneTextEditingController = TextEditingController();
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

                Text('Change phone number', style: TextStyle(fontSize: 22.0, fontFamily: 'Brand Bold'),),

                SizedBox(height: 25,),

                TextField(
                      controller: phoneTextEditingController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Phone",
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),

                SizedBox(height: 30,),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: RaisedButton(
                    onPressed: ()
                    {
                      if(phoneTextEditingController.text.isEmpty)
                        {
                          displayToastMessage("You should write a phone number", context);
                        }
                        else{
                         
                         usersRef.child(firebaseUser.uid).child("phone").set(phoneTextEditingController.text.trim());
                         displayToastMessage("Congratulations, your phone number has been changed.", context);
                         Navigator.pop(context);
                         Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
                         
                        }
                         
                    },
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: EdgeInsets.all(17.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Confirm", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),),
                          Icon(Icons.check_box, color: Colors.white, size: 16.0,),
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
