import 'package:flutter/material.dart';
import 'package:uber/AllScreens/mainscreen.dart';

class AboutScreen extends StatefulWidget
{
  static const String idScreen = "about";

  @override
  _MyAboutScreenState createState() => _MyAboutScreenState();
}

class _MyAboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: Colors.black,
        leading: IconButton(
          
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_left), color: Colors.white,
        ),
      ),
        
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            SizedBox(height: 50,),
            Container(
              height: 160,
              child: Center(
                child: Image.asset('images/uber.png',
                 width: 100.0,
                 height: 100.0,
                 alignment: Alignment.center,),
                
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 24, right: 24),
              child: Column(
                children: <Widget>[
                  Text(
                    '  Uber ',
                    style: TextStyle(
                        fontSize: 70, fontFamily: 'Signatra'),
                  ),
                  SizedBox(height: 30),
                  Text(
                      'This app has been developed by Yassine Guenidi and Oussama Lahmer, '
                      ,
                    style: TextStyle(fontFamily: "Brand Bold"),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),
           /* FlatButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
                },
                child: const Text(
                    'Go Back',
                    style: TextStyle(
                        fontSize: 18, color: Colors.black
                    )
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0))
            ),*/
          ],
        ));
  }
}