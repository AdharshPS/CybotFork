import 'package:flutter/material.dart';
import 'package:uri_launching/utilis/color_constant/color_constant.dart';
import 'package:uri_launching/view/about_avanzo_screen/about_avanzo_screen.dart';
import 'package:uri_launching/view/about_cyberhulk_screen/about_cyberhulk_screen.dart';
import 'package:uri_launching/view/dashborad_screen/dashboard_screen.dart';
import 'package:uri_launching/view/home_screen/home_screen.dart';
import 'package:uri_launching/view/login_screen/login_screen.dart';
import 'package:uri_launching/view/signup_screen/signup_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int indexnum = 0;
  List screens = [
    HomeScreen(),
    DashboardScreen(),
    AboutCyberHulkScreen(),
    AboutAvanzoScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[indexnum],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            indexnum = value;
            print(value);

            setState(() {});
          },
          currentIndex: indexnum,
          unselectedItemColor: Colorconstant.mainwhite,
          selectedItemColor: Colorconstant.pantonemessage,
          backgroundColor: Colorconstant.mainblack,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: "Ask Question"),
            BottomNavigationBarItem(
                icon: Icon(Icons.animation_outlined), label: "Cyberhulk"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_tree), label: "Avanzo"),
          ]),
    );
  }
}
