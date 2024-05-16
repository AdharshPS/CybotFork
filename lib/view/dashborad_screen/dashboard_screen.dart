import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:uri_launching/utilis/color_constant/color_constant.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextEditingController askquestioncontroller = TextEditingController();

  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _words = '';

  // List questionanswers = [];
  Future<void> askquestion() async {
    if (askquestioncontroller.text != "") {
      String uri = "https://cybot.avanzosolutions.in/cybot/search_text.php";

      var res = await http.post(Uri.parse(uri), body: {
        "askquestioncontroller": askquestioncontroller.text,
      });
      print(res.body);
      ListView.separated(
          itemBuilder: (context, index) => ListTile(
                leading: Text(res.body[index]),
              ),
          separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
          itemCount: res.body.length);
      setState(() {});

      // setState(() {
      //   questionanswers = json.decode(res.body);
      // });
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => ListView.separated(
      //             itemBuilder: (context, index) => ListTile(
      //                   leading: Text(questionanswers[index]),
      //                 ),
      //             separatorBuilder: (context, index) => SizedBox(
      //                   height: 10,
      //                 ),
      //             itemCount: questionanswers.length)));

      // setState(() {});

      // var response = "success";
      // var resp = "WRONG CREDENTIALS";

      //       if (res.body == response) {
      //         print("Record inserted");
      //         Navigator.pushAndRemoveUntil(
      //             context,
      //             MaterialPageRoute(builder: (context) => DashboardScreen()),
      //             (route) => false);
      //         loginpasswordcontroller.clear();
      //         loginusernamecontroller.clear();
      //       }
      //       if (res.body == resp) {
      //         Navigator.pushAndRemoveUntil(
      //             context,
      //             MaterialPageRoute(builder: (context) => LoginScreen()),
      //             (route) => false);
      //       }
    } else {
      print("please fill all fields");
    }
  }

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    askquestioncontroller.text = result.recognizedWords;
    setState(() {
      _words = result.recognizedWords;
    });
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
                "Intrested Topics",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(
              height: 35,
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
              height: 50,
            ),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ElevatedButton(
                //     onPressed: () {
                //       _launchURL(
                //         "www.cybot.avanzosolutions.in",
                //       );
                //     },
                //     child: Text("Ask a Question")),
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
                decoration: InputDecoration(
                    suffix: IconButton(
                      onPressed: _speechToText.isListening
                          ? _stopListening
                          : _startListening,
                      icon: Icon(_speechToText.isListening
                          ? Icons.mic_off
                          : Icons.mic),
                    ),
                    hintText: "Your Spoken text",
                    border: OutlineInputBorder()),
                controller: askquestioncontroller,
              ),
            ),
            Text(_speechToText.isListening
                ? _words
                : _speechEnabled
                    ? 'Press the Microphone to Start Speech to Text'
                    : 'Speech Not Available'),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  _launchURL("www.ask.avanzosolutions.in");
                  setState(() {});
                  askquestion();
                },
                child: Text("Ask")),
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
