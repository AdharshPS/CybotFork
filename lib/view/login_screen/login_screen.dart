import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uri_launching/utilis/Authentication.dart';
import 'package:uri_launching/utilis/color_constant/color_constant.dart';
import 'package:uri_launching/view/dashborad_screen/dashboard_screen.dart';
import 'package:uri_launching/view/signup_screen/signup_screen.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController loginusernamecontroller = TextEditingController();
  TextEditingController loginpasswordcontroller = TextEditingController();
  Future<void> insertrecord() async {
    if (loginusernamecontroller.text != "" ||
        loginpasswordcontroller.text != "") {
      try {
        String uri =
            "https://cybot.avanzosolutions.in/cybot/insert_recordtest.php";
        var res = await http.post(Uri.parse(uri), body: {
          "loginusernamecontroller": loginusernamecontroller.text,
          "loginpasswordcontroller": loginpasswordcontroller.text
        });
        var response = jsonDecode(res.body);
        if (response["success"] == "true") {
          print("Record inserted");
        } else {
          print("some issue");
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("please fill all fields");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconstant.pantonebackground,
      appBar: AppBar(
        backgroundColor: Colorconstant.pantonemessage,
        actions: [Text("Version 1.0.0")],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/Animation - 1715055684151.gif",
              height: 100,
            ),
            Text(
              "Log In",
              style: TextStyle(
                  color: Colorconstant.darkpurple,
                  fontWeight: FontWeight.w900,
                  fontSize: 40),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                controller: loginusernamecontroller,
                decoration: InputDecoration(
                    hintText: "User Name", border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                controller: loginpasswordcontroller,
                decoration: InputDecoration(
                    hintText: "Password", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 220),
              child:
                  TextButton(onPressed: () {}, child: Text("Forgot Password")),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(330, 50)),
                    backgroundColor:
                        MaterialStateProperty.all(Colorconstant.darkpurple)),
                onPressed: () {
                  insertrecord();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DashboardScreen()));
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 43, 34, 51)),
                )),
            SizedBox(
              height: 5,
            ),
            Text("Login with Biometrics"),
            IconButton(
                onPressed: () async {
                  bool auth = await Authentication.authentication();
                  print("can Authenticate :$auth");
                  if (auth) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardScreen()));
                  }
                },
                icon: Icon(
                  Icons.fingerprint,
                  size: 50,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Dont have an account"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: Text("Create"))
              ],
            ),
            SizedBox(
              height: 70,
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
    );
  }
}
