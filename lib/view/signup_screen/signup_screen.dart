import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uri_launching/utilis/color_constant/color_constant.dart';
//import 'package:uri_launching/view/authorization_screen/authorization_screen.dart';
import 'package:http/http.dart' as http;
//import 'package:uri_launching/view/dashborad_screen/dashboard_screen.dart';
//import 'package:uri_launching/view/login_screen/login_screen.dart';

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
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    final isEmailvalid = emailRegex.hasMatch(email ?? '');
    if (!isEmailvalid) {
      return 'Please enter a valid email';
    }
    return null;
  }

  Future<void> insertrecord() async {
    if (firstnamecontroller.text != "" ||
        lastnamecontroller.text != "" ||
        phnumbercontroller.text != "" ||
        mailidcontroller.text != "" ||
        usernamecontroller.text != "" ||
        passwordcontroller.text != "") {
      try {
        String uri = "https://cybot.avanzosolutions.in/cybot/insert_record.php";
        var res = await http.post(Uri.parse(uri), body: {
          "firstnamecontroller": firstnamecontroller.text,
          "lastnamecontroller": lastnamecontroller.text,
          "phnumbercontroller": phnumbercontroller.text,
          "mailidcontroller": mailidcontroller.text,
          "usernamecontroller": usernamecontroller.text,
          "passwordcontroller": passwordcontroller.text
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
        actions: [const Text("Version 1.0.0")],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              // Image.asset(
              //   "assets/images/Animation - 1715055684151.gif",
              //   height: 70,
              // ),
              SizedBox(
                height: 10,
              ),
              const Text(
                "Sign Up",
                style: TextStyle(
                    color: Colorconstant.darkpurple,
                    fontWeight: FontWeight.w900,
                    fontSize: 40),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: TextFormField(
                  controller: firstnamecontroller,
                  decoration: const InputDecoration(
                      hintText: "First name", border: OutlineInputBorder()),
                  validator: (name) => name!.length < 3
                      ? "name should be atleast 5 characters"
                      : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: TextFormField(
                  controller: lastnamecontroller,
                  decoration: const InputDecoration(
                      hintText: "Last Name", border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: TextFormField(
                  controller: phnumbercontroller,
                  decoration: const InputDecoration(
                      hintText: "Phone Number", border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: TextFormField(
                  controller: mailidcontroller,
                  decoration: const InputDecoration(
                      hintText: "Email Id", border: OutlineInputBorder()),
                  validator: validateEmail,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: TextFormField(
                  controller: usernamecontroller,
                  decoration: const InputDecoration(
                      hintText: "User Name", border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: TextFormField(
                  controller: passwordcontroller,
                  decoration: const InputDecoration(
                      hintText: "Enter Password", border: OutlineInputBorder()),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(12),
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //         hintText: "Confirm Pssword", border: OutlineInputBorder()),
              //   ),
              // ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(330, 50)),
                      backgroundColor:
                          MaterialStateProperty.all(Colorconstant.darkpurple)),
                  onPressed: () {
                    insertrecord();
                    _formkey.currentState!.validate();
                    // mailidcontroller.clear();
                    // firstnamecontroller.clear();
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                        fontSize: 20, color: Colorconstant.pantonebackground),
                  )),
              const SizedBox(
                height: 53,
              ),
              Container(
                color: Colorconstant.mainblack,
                height: 50,
                width: double.infinity,
                child: const Center(
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
