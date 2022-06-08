import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graduation_project_app/layouts/login_screen.dart';
import 'package:hexcolor/hexcolor.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
        Duration(
          seconds: 3,
        ),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: HexColor('#2E8B57'),
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topRight,
        //     end: Alignment.bottomRight,
        //     colors: [
        //       HexColor('#A3EBB1'),
        //       HexColor('#2E8B57'),
        //     ],
        //   ),
        // ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/icon.png'),
                radius: 90.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('Vitanic',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'ger',
                      fontSize: 50.0)),
            ],
          ),
        ),
      ),
    );
  }
}
