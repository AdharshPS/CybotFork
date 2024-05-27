// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uri_launching/utilis/container_text.dart';

class PhishingText extends StatefulWidget {
  const PhishingText({super.key});

  @override
  State<PhishingText> createState() => _PhishingTextState();
}

class _PhishingTextState extends State<PhishingText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phishing"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                      title: Text(ContainerText.phishingInfo[index]["question"]
                          .toString()),
                      subtitle: Text(ContainerText.phishingInfo[index]["answer"]
                          .toString()),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                itemCount: ContainerText.phishingInfo.length),
          ),
        ],
      ),
    );
  }
}
