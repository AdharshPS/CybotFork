import 'package:flutter/material.dart';

class AboutAvanzoScreen extends StatefulWidget {
  const AboutAvanzoScreen({super.key});

  @override
  State<AboutAvanzoScreen> createState() => _AboutAvanzoScreenState();
}

class _AboutAvanzoScreenState extends State<AboutAvanzoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "About Avanzo",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              """"
          In today’s digital data driven economy, when brands are moulded with process automation, ‘Data protection’ is of paramount importance. Avanzo now offers consultancy in Formulating security policies for corporates, Intellectual property rights (IPR) in cyberspace, Cyber forensics, Cyber Legal Audit & IS Audit for organisations and Security Audit as per ISO standards. Cyber investigation for governments and Case presentation in front of adjudication officers (India, Arbitration)."
          
          """,
            ),
          )
        ],
      ),
    );
  }
}
