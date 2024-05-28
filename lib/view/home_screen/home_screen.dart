import 'package:flutter/material.dart';
import 'package:uri_launching/utilis/color_constant/color_constant.dart';
import 'package:uri_launching/utilis/phishing_text.dart';

import '../../utilis/AI.dart';
import '../../utilis/cyber_security_text.dart';
import '../../utilis/data_breach.dart';
import '../../utilis/ddos_attack.dart';
import '../../utilis/encryption.dart';
import '../../utilis/firewall.dart';
import '../../utilis/hacking_text.dart';
import '../../utilis/malware_text.dart';
import '../../utilis/patch.dart';
import '../../utilis/ransomware.dart';
import '../../utilis/robotics.dart';
import '../../utilis/security_incident.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _setTextFieldText(Widget targetscreen) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => targetscreen));
  }

  Widget _buildClickableContainer(String text, Widget targetscreen) {
    return GestureDetector(
      onTap: () => _setTextFieldText(targetscreen),
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: Colorconstant.pantonebackground,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: Colorconstant.mainwhite, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Text(
            "Random Topics",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildClickableContainer("Phishing", PhishingText()),
              _buildClickableContainer("Cyber security", CyberSecuritytext()),
              _buildClickableContainer("Malware", Malwaretext()),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildClickableContainer("Hacking", Hackingtext()),
              _buildClickableContainer("Data breach", Databreach()),
              _buildClickableContainer("DDoS attack", DDOSAttacktext()),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildClickableContainer("Firewall", FireWalltext()),
              _buildClickableContainer("Patch", Patchtext()),
              _buildClickableContainer("AI", AItext()),
              _buildClickableContainer("Encryption", Encryptiontext())
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildClickableContainer(
                  "Security incident", Securityincidenttext()),
              _buildClickableContainer("Robotics", Roboticstext()),
              _buildClickableContainer("Ransomware", Ransomeware()),
            ],
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
