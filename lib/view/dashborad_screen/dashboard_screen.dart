import 'package:flutter/material.dart';
import 'package:uri_launching/utilis/color_constant/color_constant.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
                ElevatedButton(
                    onPressed: () {
                      _launchURL(
                        "www.cybot.avanzosolutions.in",
                      );
                    },
                    child: Text("Ask a Question")),
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
