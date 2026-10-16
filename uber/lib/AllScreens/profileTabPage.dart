import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:uber/AllScreens/changeNumber.dart';
import 'package:uber/configMaps.dart';

import '../main.dart';
import 'loginScreen.dart';

class ProfileTabPage extends StatefulWidget {
  static const String idScreen = "profil";
  @override
  _ProfileTabPageState createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {
  File _image;
   var im=usersRef.child(firebaseUser.uid).child("imageUrl").toString();
   NetworkImage tempFile = NetworkImage(usersRef.child(firebaseUser.uid).child("imageUrl").path);
   
  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print('Image Path $_image');
      });
    //  uploadPic(context,_image);
    }

    return Scaffold(
      appBar: AppBar(
    
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 26.0,
          ),
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.black,
                    child: ClipOval(
                      child: new SizedBox(
                        width: 100.0,
                        height: 100.0,
                        child:/* (im != null)
                            ? Image.(
                                "$tempFile",
                                fit: BoxFit.fill,
                              )
                            :
                            */ Image.asset(
                                "images/user_icon.png",
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 80.0),
                  child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.camera,
                      color: Colors.white,
                      size: 20.0,
                    ),
                    onPressed: () {
                      getImage();
                    },
                  ),
                ),
              ],
            ),
            Text(
              userCurrentInfo?.name ?? "",
              style: TextStyle(
                fontSize: 65.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Signatra',
              ),
            ),
            SizedBox(
              height: 20,
              width: 200,
              child: Divider(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            InfoCard(
              text: userCurrentInfo?.phone ?? "",
              icon: Icons.phone,
              iconChange: Icons.border_color,
              onPressed: () async {
                Navigator.pushNamedAndRemoveUntil(
                    context, changePassword.idScreen, (route) => false);
              },
            ),
            InfoCard(
              text: userCurrentInfo?.email ?? "",
              icon: Icons.email,
              onPressed: () async {
                print("this is email.");
              },
            ),

            /* RaisedButton(
                    color: Color(0xffFF0000),
                    onPressed: () {
                     uploadPic(context);
                    },
                                     
                    elevation: 4.0,
                    splashColor: Colors.blueGrey,
                    child: Text(
                      'Save image',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),*/
            SizedBox(
              height: 20.0,
            ),
            //signout
            GestureDetector(
              onTap: () {
                Geofire.removeLocation(currentfirebaseUser?.uid);
                rideRequestRef.onDisconnect();
                rideRequestRef.remove();
                rideRequestRef = null;

                FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginScreen.idScreen, (route) => false);
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
/*
  Future uploadPic(BuildContext context, var a) async {
    String fileName = basename(a);
   StorageReference firebaseStorageRef =  usersRef.child(firebaseUser.uid).child("imageUrl").set(fileName);
    //  StorageReference firebaseStorageRef = usersRef.child(currentfirebaseUser.uid).child("profilUrl").set(fileName);
    //   StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    // ignore: unused_local_variable
    // StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
    setState(() {
      print("Profile Picture uploaded");
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
    });
  }*/
}

class InfoCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final IconData iconChange;
  Function onPressed;

  InfoCard({
    this.text,
    this.icon,
    this.iconChange,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.black,
          ),
          title: Text(
            text,
            style: TextStyle(
              color: Colors.black,
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
