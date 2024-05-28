import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uri_launching/utilis/color_constant/color_constant.dart';
import 'package:uri_launching/view/login_screen/login_screen.dart';

class AboutCyberHulkScreen extends StatefulWidget {
  const AboutCyberHulkScreen({super.key});

  @override
  State<AboutCyberHulkScreen> createState() => _AboutCyberHulkScreenState();
}

class _AboutCyberHulkScreenState extends State<AboutCyberHulkScreen> {
  late Box box1;

  @override
  void initState() {
    super.initState();
    createOpenBox();
  }

  void createOpenBox() async {
    box1 = await Hive.openBox('logindata');
  }

  Future<void> logout() async {
    await box1.clear();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          OutlinedButton(
            style: ButtonStyle(
              side: MaterialStateProperty.all(
                BorderSide(color: Colorconstant.pantonebackground),
              ),
            ),
            onPressed: logout,
            child: Text("Logout"),
          )
        ],
        title: Text("About CyberHulk"),
      ),
    );
  }
}
