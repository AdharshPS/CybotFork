// import 'dart:convert';
import 'dart:developer';
// import 'dart:html';

//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uri_launching/utilis/color_constant/color_constant.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl_standalone.dart';
import 'package:http/http.dart' as http;
import 'package:speech_to_text/speech_to_text.dart' as stt;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextEditingController askquestioncontroller = TextEditingController();
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = '';
  dynamic res = "";
  String story = "";
  Future<String> askquestion() async {
    String uri = "https://cybot.avanzosolutions.in/cybot/search_text.php";
    try {
      res = await http.post(Uri.parse(uri), body: {
        "askquestioncontroller": askquestioncontroller.text,
      });
    } catch (e) {
      log(e.toString());
    }
    // log(res.body);
    String data = res.body;
    // log(data);
    return data;
  }

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            askquestioncontroller.text = val.recognizedWords;
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorconstant.pantonemessage,
        actions: [Text("Version 1.0.0")],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Image.asset(
              "assets/images/Animation - 1715055684151.gif",
            ),
            SizedBox(
              height: 18,
            ),
            Center(
              child: Text(
                "CYBERHULK",
                style: TextStyle(
                    color: Colors.green[800],
                    fontSize: 35,
                    fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   height: 35,
                //   width: 110,
                //   decoration: BoxDecoration(
                //       color: Colorconstant.pantonemessage,
                //       borderRadius: BorderRadius.circular(20)),
                //   child: Center(child: Text("Cyber Security")),
                // ),
                // SizedBox(
                //   width: 5,
                // ),
                // Container(
                //   height: 35,
                //   width: 110,
                //   decoration: BoxDecoration(
                //       color: Colorconstant.pantonemessage,
                //       borderRadius: BorderRadius.circular(20)),
                //   child: Center(child: Text("Malware")),
                // ),
                // SizedBox(
                //   width: 5,
                // ),
                // Container(
                //   height: 35,
                //   width: 110,
                //   decoration: BoxDecoration(
                //       color: Colorconstant.pantonemessage,
                //       borderRadius: BorderRadius.circular(20)),
                //   child: Center(child: Text("Cyber Forensics")),
                // ),
              ],
            ),
            // SizedBox(
            //   height: 5,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   height: 35,
                //   width: 110,
                //   decoration: BoxDecoration(
                //       color: Colorconstant.pantonemessage,
                //       borderRadius: BorderRadius.circular(20)),
                //   child: Center(child: Text("Malware")),
                // ),
                // SizedBox(
                //   width: 5,
                // ),
                // Container(
                //   height: 35,
                //   width: 110,
                //   decoration: BoxDecoration(
                //       color: Colorconstant.pantonemessage,
                //       borderRadius: BorderRadius.circular(20)),
                //   child: Center(child: Text("Malware")),
                // ),
                // SizedBox(
                //   width: 5,
                // ),
              ],
            ),
            // SizedBox(
            //   height: 5,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   height: 35,
                //   width: 110,
                //   decoration: BoxDecoration(
                //       color: Colorconstant.pantonemessage,
                //       borderRadius: BorderRadius.circular(20)),
                //   child: Center(child: Text("Cyber Security")),
                // ),
                // SizedBox(
                //   width: 5,
                // ),
                // Container(
                //   height: 35,
                //   width: 110,
                //   decoration: BoxDecoration(
                //       color: Colorconstant.pantonemessage,
                //       borderRadius: BorderRadius.circular(20)),
                //   child: Center(child: Text("Malware")),
                // ),
                // SizedBox(
                //   width: 5,
                // ),
                // Container(
                //   height: 35,
                //   width: 110,
                //   decoration: BoxDecoration(
                //       color: Colorconstant.pantonemessage,
                //       borderRadius: BorderRadius.circular(20)),
                //   child: Center(child: Text("Cyber Forensics")),
                // ),
              ],
            ),
            // SizedBox(
            //   height: 5,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   height: 35,
                //   width: 110,
                //   decoration: BoxDecoration(
                //       color: Colorconstant.pantonemessage,
                //       borderRadius: BorderRadius.circular(20)),
                //   child: Center(child: Text("Cyber Security")),
                // ),
                // SizedBox(
                //   width: 5,
                // ),
                // Container(
                //   height: 35,
                //   width: 110,
                //   decoration: BoxDecoration(
                //       color: Colorconstant.pantonemessage,
                //       borderRadius: BorderRadius.circular(20)),
                //   child: Center(child: Text("Malware")),
                // ),
                // SizedBox(
                //   width: 5,
                // ),
                // Container(
                //   height: 35,
                //   width: 110,
                //   decoration: BoxDecoration(
                //       color: Colorconstant.pantonemessage,
                //       borderRadius: BorderRadius.circular(20)),
                //   child: Center(child: Text("Cyber Forensics")),
                // ),
              ],
            ),
            // SizedBox(
            //   height: 5,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   height: 35,
                //   width: 110,
                //   decoration: BoxDecoration(
                //       color: Colorconstant.pantonemessage,
                //       borderRadius: BorderRadius.circular(20)),
                //   child: Center(child: Text("Malware")),
                // ),
                // SizedBox(
                //   width: 5,
                // ),
                // Container(
                //   height: 35,
                //   width: 110,
                //   decoration: BoxDecoration(
                //       color: Colorconstant.pantonemessage,
                //       borderRadius: BorderRadius.circular(20)),
                //   child: Center(child: Text("Malware")),
                // ),
                // SizedBox(
                //   width: 5,
                // ),
              ],
            ),
            // SizedBox(
            //   height: 5,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   height: 35,
                //   width: 110,
                //   decoration: BoxDecoration(
                //       color: Colorconstant.pantonemessage,
                //       borderRadius: BorderRadius.circular(20)),
                //   child: Center(child: Text("Cyber Security")),
                // ),
                // SizedBox(
                //   width: 5,
                // ),
                // Container(
                //   height: 35,
                //   width: 110,
                //   decoration: BoxDecoration(
                //       color: Colorconstant.pantonemessage,
                //       borderRadius: BorderRadius.circular(20)),
                //   child: Center(child: Text("Malware")),
                // ),
                // SizedBox(
                //   width: 5,
                // ),
                // Container(
                //   height: 35,
                //   width: 110,
                //   decoration: BoxDecoration(
                //       color: Colorconstant.pantonemessage,
                //       borderRadius: BorderRadius.circular(20)),
                //   child: Center(child: Text("Cyber Forensics")),
                // ),
              ],
            ),
            // SizedBox(
            //   height: 50,
            // ),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      _launchURL(
                        "www.chat.avanzosolutions.in",
                      );
                    },
                    child: Text("Chat"))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
              child: TextFormField(
                controller: askquestioncontroller,
                decoration: InputDecoration(
                    suffix: IconButton(
                      icon: Icon(_isListening ? Icons.mic : Icons.mic_none),
                      onPressed: _listen,
                    ),
                    border: OutlineInputBorder()),
              ),
            ),

            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () async {
                  String response = await askquestion();
                  story = response;
                  log("this will be printed on ui ==============$story");
                  setState(() {});
                  askquestioncontroller.clear();

                  //_launchURL("www.ask.avanzosolutions.in");
                  //  askquestion();
                  // setState(() {});
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => ListAnswers()));
                  //Text(res);

                  // ListView.separated(
                  //     itemBuilder: (context, index) => res,
                  //     separatorBuilder: (context, index) => SizedBox(
                  //           height: 5,
                  //         ),
                  //     itemCount: 30);
                },
                child: Text("Ask")),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                child: Text(story),
              ),
            ),
            SizedBox(
              height: 220,
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

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.inAppWebView,
    )) {
      throw "Can not launch url";
    }
  }
}
