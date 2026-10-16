import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uber/AllScreens/loginScreen.dart';
import 'package:uber/AllScreens/first.dart';
import 'package:uber/AllScreens/mainscreen.dart';
import 'package:uber/AllWidgets/progressDialog.dart';
import 'package:uber/main.dart';

class RegisterationScreen extends StatefulWidget {
  static const String idScreen = "register";

  @override
  _RegisterationScreenState createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  String smsCode;
  String verificationCode;
  String number;
  bool _obscureText = true;
  String _verificationCode;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, firstPage.idScreen, (route) => false);
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 26.0,
            color: Colors.black,
          ),
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Image(
                image: AssetImage("images/uber.png"),
                width: 100.0,
                height: 100.0,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Register as a Rider",
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: "Brand Bold",
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: nameTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Name",
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
                      height: 1.0,
                    ),
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
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
                      height: 1.0,
                    ),
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
                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: passwordTextEditingController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                        suffixIcon: InkWell(
                          onTap: _toggle,
                          child: Icon(
                            _obscureText
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            size: 15.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      color: Colors.black,
                      textColor: Colors.white,
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            "Create Account",
                            style: TextStyle(
                                fontSize: 18.0, fontFamily: "Brand Bold"),
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24.0),
                      ),
                      onPressed: () {
                        if (nameTextEditingController.text.length < 3) {
                          displayToastMessage(
                              "name must be atleast 3 Characters.", context);
                        } else if (!emailTextEditingController.text
                            .contains("@")) {
                          displayToastMessage(
                              "Email address is not Valid.", context);
                        } else if (phoneTextEditingController.text.isEmpty) {
                          displayToastMessage(
                              "Phone Number is mandatory.and soud begin with +216",
                              context);
                        } else if (passwordTextEditingController.text.length <
                            8) {
                          displayToastMessage(
                              "Password must be atleast 8 Characters.",
                              context);
                        } else {
                        
                    
                          registerNewUser(context);
                        }
                      },
                    ),
                    SizedBox(
                      height: 0.0,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, LoginScreen.idScreen, (route) => false);
                      },
                      child: Text(
                        "Already have an Account? Login Here",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void registerNewUser(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(
            message: "Registering, Please wait...",
          );
        });

    final User firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      Navigator.pop(context);
      displayToastMessage("Error: " + errMsg.toString(), context);
    }))
        .user;

    if (firebaseUser != null) //user created
    {
      //save user info to database
      Map userDataMap = {
        "name": nameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "phone": phoneTextEditingController.text.trim(),
        "password": passwordTextEditingController.text.trim(),
      };

      usersRef.child(firebaseUser.uid).set(userDataMap);
      displayToastMessage(
          "Congratulations, your account has been created.", context);


 
        Navigator.pushNamedAndRemoveUntil(
        context, MainScreen.idScreen, (route) => false);
    } else {
      Navigator.pop(context);
      //error occured - display error msg
      displayToastMessage("New user account has not been Created.", context);
    }
  }









































}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
