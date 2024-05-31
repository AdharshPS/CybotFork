import 'package:flutter/material.dart';
import 'package:uri_launching/utilis/color_constant/color_constant.dart';
import 'package:uri_launching/view/login_screen/login_screen.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController loginusernamecontroller = TextEditingController();
  TextEditingController passwordconttroller = TextEditingController();
  TextEditingController conpasswordcontroller = TextEditingController();
  bool passwordVisible = false;
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
    if (loginusernamecontroller.text.isNotEmpty ||
        passwordconttroller.text.isNotEmpty ||
        emailcontroller.text.isNotEmpty) {
      try {
        String uri =
            "https://cybot.avanzosolutions.in/cybot/forgetpassword.php";
        var res = await http.post(Uri.parse(uri), body: {
          "loginusernamecontroller": loginusernamecontroller.text,
          "emailcontroller": emailcontroller.text,
          "passwordconttroller": passwordconttroller.text,
        });
        var response = "success";
        //  var resp = "WRONG CREDENTIALS";
        //print("${res.body}${passwordconttroller.text}");
        print("athulya${res.body}");
        if (res.body == response) {
          //  print("Record inserted");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Reset Successful",
                style: TextStyle(color: Colors.green),
              ),
              duration: Duration(seconds: 2),
            ),
          );
          Future.delayed(Duration(milliseconds: 10), () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false);
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Reset UnSuccessful",
                style: TextStyle(color: Colors.red),
              ),
              duration: Duration(seconds: 2),
            ),
          );
          Future.delayed(Duration(milliseconds: 10), () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                (route) => false);
          });
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colorconstant.pantonebackground,
        title: Text(
          "Forgot Password",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colorconstant.darkpurple),
        ),
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: loginusernamecontroller,
                    decoration: const InputDecoration(
                        hintText: "User Name",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value != null && value.length >= 5) {
                        return null;
                      } else {
                        return "Please Enter a Valid Username";
                      }
                    }),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  //   controller: mailidcontroller,
                  decoration: const InputDecoration(
                      hintText: "Email Id",
                      hintStyle: TextStyle(color: Colors.black54),
                      border: OutlineInputBorder()),
                  validator: validateEmail,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  obscureText: passwordVisible,
                  controller: passwordconttroller,
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
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: conpasswordcontroller,
                    decoration: InputDecoration(
                        hintText: "Confirm Pssword",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value != null && value == passwordconttroller.text) {
                        return null;
                      } else {
                        return "Password is not match";
                      }
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(330, 50)),
                      backgroundColor:
                          MaterialStateProperty.all(Colorconstant.darkpurple)),
                  onPressed: () async {
                    // if (_formkey.currentState!.validate()) {
                    //   bool success = await insertrecord();
                    //   if (success) {
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(
                    //         content: Text("Reset Successful"),
                    //         duration: Duration(seconds: 2),
                    //       ),
                    //     );
                    //     Future.delayed(Duration(seconds: 2), () {
                    //       Navigator.pushAndRemoveUntil(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => LoginScreen()),
                    //           (route) => false);
                    //     });
                    //   } else {
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(content: Text("Reset failed")),
                    //     );
                    //   }
                    // }
                    _formkey.currentState!.validate();
                    insertrecord();
                  },
                  child: Text(
                    "Reset",
                    style:
                        TextStyle(fontSize: 15, color: Colorconstant.mainwhite),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
