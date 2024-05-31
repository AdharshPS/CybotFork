import 'package:flutter/material.dart';
import 'package:uri_launching/utilis/color_constant/color_constant.dart';
import 'package:http/http.dart' as http;
import 'package:uri_launching/view/dashborad_screen/dashboard_screen.dart';
import 'package:uri_launching/view/login_screen/login_screen.dart';
import 'package:uri_launching/view/terms_and_conditions_screen/terms_and_conditions_screen.dart';

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
  TextEditingController conpasswordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool passwordVisible = false;

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
        var response = "success";
        var resp = "WRONG CREDENTIALS";

        if (res.body == response) {
          print("Record inserted");
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => DashboardScreen()),
              (route) => false);
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
      backgroundColor: Colorconstant.mainwhite,
      appBar: AppBar(
        backgroundColor: Colorconstant.pantonemessage,
        actions: [const Text("Version 1.0.0")],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              const SizedBox(
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
                  style: TextStyle(color: Colors.black),
                  controller: firstnamecontroller,
                  decoration: const InputDecoration(
                    hintText: "First name",
                    hintStyle: TextStyle(
                        color:
                            Colors.black54), // Changed hint text color to black
                    border: OutlineInputBorder(),
                  ),
                  validator: (name) => name!.length < 3
                      ? "Name should be at least 3 characters"
                      : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: lastnamecontroller,
                  decoration: const InputDecoration(
                    hintText: "Last Name",
                    hintStyle: TextStyle(
                        color:
                            Colors.black54), // Changed hint text color to black
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: phnumbercontroller,
                    decoration: const InputDecoration(
                      hintText: "Phone Number",
                      hintStyle: TextStyle(
                          color: Colors
                              .black54), // Changed hint text color to black
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value != null && value.length >= 7) {
                        return null;
                      } else {
                        return "Mobile number is required";
                      }
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: mailidcontroller,
                  decoration: const InputDecoration(
                    hintText: "Email Id",
                    hintStyle: TextStyle(
                        color:
                            Colors.black54), // Changed hint text color to black
                    border: OutlineInputBorder(),
                  ),
                  validator: validateEmail,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: usernamecontroller,
                    decoration: const InputDecoration(
                      hintText: "User Name",
                      hintStyle: TextStyle(
                          color: Colors
                              .black54), // Changed hint text color to black
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value != null && value.length >= 5) {
                        return null;
                      } else {
                        return "Please Enter a Valid Username";
                      }
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  obscureText: passwordVisible,
                  controller: passwordcontroller,
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
                      hintStyle: TextStyle(color: Colors.black54),
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
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: conpasswordcontroller,
                    decoration: const InputDecoration(
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(
                          color: Colors
                              .black54), // Changed hint text color to black
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value != null && value == passwordcontroller.text) {
                        return null;
                      } else {
                        return "Password does not match";
                      }
                    }),
              ),
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

                    if (_formkey.currentState!.validate()) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TermsConditionsScreen()),
                          (route) => false);
                    }
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
