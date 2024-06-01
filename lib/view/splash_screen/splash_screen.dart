//import 'package:cybot_design/view/chat_home_screen/chat_homescreen.dart';
import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uri_launching/utilis/color_constant/color_constant.dart';
import 'package:uri_launching/view/bottom_navigationbar_screens/bottom_navigation_screeb.dart';
import 'package:uri_launching/view/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.isLoggedIn});

  final bool isLoggedIn;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                widget.isLoggedIn ? BottomNavigationScreen() : LoginScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconstant.pantonemessage,
      appBar: AppBar(
        backgroundColor: Colorconstant.pantonemessage,
        actions: [Text("Version 1.0.0")],
      ),
      // appBar: AppBar(
      //   actions: [
      //     SizedBox(
      //       child: Icon(
      //         Icons.notifications_outlined,
      //         size: 35,
      //       ),
      //       width: 50,
      //     )
      //   ],
      // ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: Image.asset(
                "assets/images/avzlogo.png",
                height: 200,
              )),
              SizedBox(
                height: 20,
              ),
              Text(
                "CYBERHULK",
                style: TextStyle(
                    color: Colorconstant.mainblack,
                    fontSize: 50,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 270,
              ),
              Container(
                color: Colorconstant.mainblack,
                height: 50,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Developed by Avanzo Cyber Security Solutions",
                    style:
                        TextStyle(fontSize: 10, color: Colorconstant.mainwhite),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
