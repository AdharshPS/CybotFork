//import 'dart:convert';

//import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:uri_launching/controller/Fogrot_password/forgot_password.dart';
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
  bool passwordVisible = false;
  final _formkey = GlobalKey<FormState>();
  bool isChecked = false;
  late Box box1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createOpenBox();
    passwordVisible = true;
  }

  void createOpenBox() async {
    box1 = await Hive.openBox('logindata');
    getdata();
  }

  void getdata() async {
    if (box1.get('email') != null) {
      loginusernamecontroller.text = box1.get('email');
      isChecked = true;
      setState(() {});
    }
    if (box1.get('pass') != null) {
      loginpasswordcontroller.text = box1.get('pass');
      isChecked = true;
      setState(() {});
    }
  }

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
        // print("athulya" + res.body);
        var response = "success";
        var resp = "WRONG CREDENTIALS";

        if (res.body == response) {
          print("Record inserted");
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => DashboardScreen()),
              (route) => false);
          loginpasswordcontroller.clear();
          loginusernamecontroller.clear();
        }
        if (res.body == resp) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => false);
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
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Image.asset(
                "assets/images/avzlogo.png",
                height: 100,
              ),
              Text(
                "WELCOME",
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
                        hintText: "Username", border: OutlineInputBorder()),
                    validator: (value) {
                      if (value != null && value.length >= 5) {
                        return null;
                      } else {
                        return "Username is Required";
                      }
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextFormField(
                  obscureText: passwordVisible,
                  controller: loginpasswordcontroller,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                        icon: Icon(passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      hintText: "Password",
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value != null && value.length >= 7) {
                      return null;
                    } else {
                      return "Password is Required";
                    }
                  },
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Remember Me",
                    style: TextStyle(color: Colorconstant.mainblack),
                  ),
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      isChecked = !isChecked;
                      setState(() {});
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ForgotPasswordScreen()));
                        },
                        child: Text(
                          "Forgot Password",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        )),
                  ),
                ],
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(330, 50)),
                      backgroundColor:
                          MaterialStateProperty.all(Colorconstant.darkpurple)),
                  onPressed: () {
                    insertrecord();
                    _formkey.currentState!.validate();
                    login();
                    // if (_formkey.currentState!.validate()) {
                    //   insertrecord();
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(content: Text("Login Successful")));
                    // } else {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(content: Text("Login failed")));
                    // }
                  },
                  child: Text(
                    "Login",
                    style:
                        TextStyle(fontSize: 15, color: Colorconstant.mainwhite),
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
                      Navigator.pushReplacement(
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
                  Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      child: Text(
                        "Signup",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ))
                ],
              ),
              SizedBox(
                height: 28,
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

  void login() {
    if (isChecked) {
      box1.put('email', loginusernamecontroller.value.text);
      box1.put('pass', loginpasswordcontroller.value.text);
    }
  }
}
