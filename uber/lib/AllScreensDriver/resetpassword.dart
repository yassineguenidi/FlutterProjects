import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uber/AllScreens/registerationScreen.dart';
import 'package:uber/AllScreensDriver/loginScreen.dart';
import 'package:uber/AllWidgets/progressDialog.dart';

class resetpasswordDriver extends StatelessWidget {
  static const String idScreen = "password";
  TextEditingController emailTextEditingController = TextEditingController();
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
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                 GestureDetector(
                   onTap: ()
                   {
                      Navigator.pushNamedAndRemoveUntil(context,
                              LoginScreenDriver.idScreen, (route) => false);
                   },
                   child: Icon(
                             Icons.keyboard_arrow_left,
                             size: 26.0,
                           ),
                 ),
                    SizedBox(width :30.0),
                    Text(
                  'Reset Password',
                  style: TextStyle(fontSize: 22.0, fontFamily: 'Brand Bold'),),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Divider(
                  height: 2.0,
                  thickness: 2.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: emailTextEditingController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Your email",
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
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Your Password will be send to your email, ",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
                Text(
                  "  please check your account email ",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 2.0,
                  thickness: 2.0,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      if (emailTextEditingController.text.isEmpty ||
                          !emailTextEditingController.text.contains("@")) {
                        displayToastMessage("Email invalid !", context);
                      } else {
                        resetPassword(context);
                        Navigator.pushNamedAndRemoveUntil(context,
                            LoginScreenDriver.idScreen, (route) => false);
                      }
                    },
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: EdgeInsets.all(17.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            " Confirm ",
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 0,
                          ),
                          Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 16.0,
                          ),
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

   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void resetPassword(BuildContext context) async {
    if (emailTextEditingController.text.isEmpty ||
        !emailTextEditingController.text.contains("@")) {
      Fluttertoast.showToast(msg: "Enter valid email ");
      return;
    } else {
     

      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailTextEditingController.text);
          Fluttertoast.showToast(msg: "Reset password link has been sent, please use it to change your password ");
      Navigator.pop(context);
    }
  }
}
