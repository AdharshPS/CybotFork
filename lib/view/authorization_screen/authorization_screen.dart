import 'package:flutter/material.dart';
import 'package:uri_launching/utilis/color_constant/color_constant.dart';
import 'package:uri_launching/view/dashborad_screen/dashboard_screen.dart';

class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({super.key});

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconstant.pantonebackground,
      appBar: AppBar(
        backgroundColor: Colorconstant.pantonemessage,
        actions: [Text("Version 1.0.0")],
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/Animation - 1715055684151.gif"),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "User Name/Email id",
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextFormField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                      hintText: "Enter Password", border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextFormField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                      hintText: "Confirm Pssword",
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Intrested topics",
                style: TextStyle(
                    color: Colorconstant.mainblack,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 35,
                    width: 110,
                    decoration: BoxDecoration(
                        color: Colorconstant.pantonemessage,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(child: Text("Cyber Security")),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 35,
                    width: 110,
                    decoration: BoxDecoration(
                        color: Colorconstant.pantonemessage,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(child: Text("Malware")),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 35,
                    width: 110,
                    decoration: BoxDecoration(
                        color: Colorconstant.pantonemessage,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(child: Text("Cyber Forensics")),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 35,
                    width: 110,
                    decoration: BoxDecoration(
                        color: Colorconstant.pantonemessage,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(child: Text("Malware")),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 35,
                    width: 110,
                    decoration: BoxDecoration(
                        color: Colorconstant.pantonemessage,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(child: Text("Malware")),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 35,
                    width: 110,
                    decoration: BoxDecoration(
                        color: Colorconstant.pantonemessage,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(child: Text("Cyber Security")),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 35,
                    width: 110,
                    decoration: BoxDecoration(
                        color: Colorconstant.pantonemessage,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(child: Text("Malware")),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 35,
                    width: 110,
                    decoration: BoxDecoration(
                        color: Colorconstant.pantonemessage,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(child: Text("Cyber Forensics")),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(330, 50)),
                      backgroundColor:
                          MaterialStateProperty.all(Colorconstant.darkpurple)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardScreen()));
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        fontSize: 20, color: Colorconstant.pantonebackground),
                  )),
              SizedBox(
                height: 25,
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
