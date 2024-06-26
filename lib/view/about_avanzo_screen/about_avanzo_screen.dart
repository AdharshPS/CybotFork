import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uri_launching/main.dart';
import 'package:uri_launching/utilis/color_constant/color_constant.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutAvanzoScreen extends StatefulWidget {
  const AboutAvanzoScreen({super.key});

  @override
  State<AboutAvanzoScreen> createState() => _AboutAvanzoScreenState();
}

class _AboutAvanzoScreenState extends State<AboutAvanzoScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _typewriterAnimation;
  int _phone = 08129771111;
  final String _text1 =
      "In today’s digital data driven economy, when brands are moulded with process automation, ‘Data protection’ is of paramount importance. Avanzo now offers consultancy in Formulating security policies for corporates, Intellectual property rights (IPR) in cyberspace, Cyber forensics, Cyber Legal Audit & IS Audit for organisations and Security Audit as per ISO standards. Cyber investigation for governments and Case presentation in front of adjudication officers (India, Arbitration).";
  @override
  void initState() {
    super.initState();

    // Typewriter effect initialization
    _controller = AnimationController(
      duration: const Duration(seconds: 50),
      vsync: this,
    );
    _typewriterAnimation = StepTween(
      begin: 0,
      end: _text1.length,
    ).animate(_controller);

    _controller.forward();
  }

  Future<void> sendMailto({
    String email = "avanzonet@gmail.com",
  }) async {
    final Uri parsedMailto = Uri.parse("mailto:<$email>?");
    if (!await launchUrl(
      parsedMailto,
      mode: LaunchMode.externalApplication,
    )) {
      throw "error";
    }
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    final Uri toLaunch = Uri(scheme: 'https', host: 'avanzo.in');
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 30),
          Center(
            child: Image.asset(
              "assets/images/avzlogo.png",
              color: themeProvider.themeMode == ThemeMode.light
                  ? Colorconstant.mainblack
                  : Colorconstant.mainwhite,
              height: 100,
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              "About Avanzo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: AnimatedBuilder(
              animation: _typewriterAnimation,
              builder: (context, child) {
                String textToShow =
                    (_typewriterAnimation.value <= _text1.length)
                        ? _text1.substring(0, _typewriterAnimation.value)
                        : _text1.substring(
                            0, _typewriterAnimation.value - _text1.length);
                return Text(
                  textToShow,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: themeProvider.themeMode == ThemeMode.light
                          ? Colorconstant.mainblack
                          : Colorconstant.mainwhite,
                      fontSize: 16.0),
                );
              },
            ),
            //   Text(
            //   _text1,
            //   textAlign: TextAlign.justify,
            // ),
          ),
          // Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  sendMailto();
                },
                style: TextButton.styleFrom(fixedSize: Size.fromHeight(10)),
                child: Text(
                  "email",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: themeProvider.themeMode == ThemeMode.light
                          ? Colorconstant.mainblack
                          : Colorconstant.mainwhite),
                ),
              ),
              TextButton(
                onPressed: () {
                  _launchInBrowser(toLaunch);
                },
                child: Text(
                  "website",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: themeProvider.themeMode == ThemeMode.light
                          ? Colorconstant.mainblack
                          : Colorconstant.mainwhite),
                ),
              ),
              TextButton(
                onPressed: () {
                  _makePhoneCall(_phone.toString());
                },
                child: Text(
                  "phone",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: themeProvider.themeMode == ThemeMode.light
                          ? Colorconstant.mainblack
                          : Colorconstant.mainwhite),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
