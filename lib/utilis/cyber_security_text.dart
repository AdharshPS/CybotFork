// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uri_launching/utilis/container_text.dart';

class CyberSecuritytext extends StatefulWidget {
  const CyberSecuritytext({super.key});

  @override
  State<CyberSecuritytext> createState() => _CyberSecuritytextState();
}

class _CyberSecuritytextState extends State<CyberSecuritytext> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cyber Security"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                      title: Text(ContainerText.cybersecurityInfo[index]
                              ["question"]
                          .toString()),
                      subtitle: Text(ContainerText.cybersecurityInfo[index]
                              ["answer"]
                          .toString()),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                itemCount: ContainerText.cybersecurityInfo.length),
          )
        ],
      ),
    );
  }
}
