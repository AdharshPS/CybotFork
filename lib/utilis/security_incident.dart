// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uri_launching/utilis/container_text.dart';

class Securityincidenttext extends StatefulWidget {
  const Securityincidenttext({super.key});

  @override
  State<Securityincidenttext> createState() => _SecurityincidenttextState();
}

class _SecurityincidenttextState extends State<Securityincidenttext> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Security Incident"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                      title: Text(ContainerText
                          .securityIncidentCyberSecurityInfo[index]["question"]
                          .toString()),
                      subtitle: Text(ContainerText
                          .securityIncidentCyberSecurityInfo[index]["answer"]
                          .toString()),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                itemCount:
                    ContainerText.securityIncidentCyberSecurityInfo.length),
          )
        ],
      ),
    );
  }
}
