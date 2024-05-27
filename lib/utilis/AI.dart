// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uri_launching/utilis/container_text.dart';

class AItext extends StatefulWidget {
  const AItext({super.key});

  @override
  State<AItext> createState() => _AItextState();
}

class _AItextState extends State<AItext> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Artificial Intelligence"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                      title: Text(ContainerText.aiCyberSecurityInfo[index]
                              ["question"]
                          .toString()),
                      subtitle: Text(ContainerText.aiCyberSecurityInfo[index]
                              ["answer"]
                          .toString()),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                itemCount: ContainerText.aiCyberSecurityInfo.length),
          )
        ],
      ),
    );
  }
}
