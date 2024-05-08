import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uri_launching/utilis/color_constant/color_constant.dart';
//import 'package:uri_launching/view/authorization_screen/authorization_screen.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController phnumbercontroller = TextEditingController();
  TextEditingController mailidcontroller = TextEditingController();

  Future<void> insertrecord() async {
    if (firstnamecontroller.text != "" ||
        lastnamecontroller.text != "" ||
        phnumbercontroller.text != "" ||
        mailidcontroller.text != "") {
      try {
        String uri = "https://cybot.avanzosolutions.in/cybot/insert_record.php";
        var res = await http.post(Uri.parse(uri), body: {
          "firstnamecontroller": firstnamecontroller.text,
          "lastnamecontroller": lastnamecontroller.text,
          "phnumbercontroller": phnumbercontroller.text,
          "mailidcontroller": mailidcontroller.text,
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
              height: 70,
            ),
            Text(
              "Sign Up",
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
                controller: firstnamecontroller,
                decoration: InputDecoration(
                    hintText: "First name", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                controller: lastnamecontroller,
                decoration: InputDecoration(
                    hintText: "Last Name", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                controller: phnumbercontroller,
                decoration: InputDecoration(
                    hintText: "Phone Number", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                controller: mailidcontroller,
                decoration: InputDecoration(
                    hintText: "Email Id", border: OutlineInputBorder()),
              ),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(330, 50)),
                    backgroundColor:
                        MaterialStateProperty.all(Colorconstant.darkpurple)),
                onPressed: () {
                  insertrecord();
                },
                child: Text(
                  "Next",
                  style: TextStyle(
                      fontSize: 20, color: Colorconstant.pantonebackground),
                )),
            SizedBox(
              height: 110,
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
