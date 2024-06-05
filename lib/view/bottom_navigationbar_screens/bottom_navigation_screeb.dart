import 'package:flutter/material.dart';
import 'package:uri_launching/utilis/color_constant/color_constant.dart';
import 'package:uri_launching/utilis/theme_swich/theme_switch.dart';
import 'package:uri_launching/view/about_avanzo_screen/about_avanzo_screen.dart';
import 'package:uri_launching/view/about_cyberhulk_screen/about_cyberhulk_screen.dart';
import 'package:uri_launching/view/dashborad_screen/dashboard_screen.dart';
import 'package:uri_launching/view/home_screen/home_screen.dart';
import 'package:uri_launching/view/news_screen/news_screen.dart';
import 'package:url_launcher/url_launcher.dart';

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
    NewsScreen(),
    AboutCyberHulkScreen(),
    AboutAvanzoScreen(),
  ];

  final Uri _url =
      Uri.parse('https://cybot.avanzosolutions.in/cybot/newsimagedisplay.php');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colorconstant.mainwhite,
      appBar: AppBar(
        backgroundColor: Colorconstant.pantonemessage,
        toolbarHeight: 68,
        actions: [
          Text(
            "Version 1.0.0",
            style: TextStyle(color: Colorconstant.mainblack),
          ),
          ThemeSwitch(),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: indexnum == 2 ? Container() : screens[indexnum],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          if (value == 2) {
            _launchUrl();
          } else {
            setState(() {
              indexnum = value;
            });
          }
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
              icon: ImageIcon(
                AssetImage(
                  "assets/images/Animation - 1717225115801 (1).gif",
                ),
                size: 50,
              ),
              label: "News"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  "assets/images/CyberHULK Logo final small.png",
                ),
                size: 40,
              ),
              label: "Cyberhulk"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  "assets/images/avzlogo.png",
                ),
                size: 28,
              ),
              label: "Avanzo"),
        ],
      ),
    );
  }
}
