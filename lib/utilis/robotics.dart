// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uri_launching/utilis/container_text.dart';

class Roboticstext extends StatefulWidget {
  const Roboticstext({super.key});

  @override
  State<Roboticstext> createState() => _RoboticstextState();
}

class _RoboticstextState extends State<Roboticstext> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Robotics"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                      title: Text(ContainerText.roboticsCyberSecurityInfo[index]
                              ["question"]
                          .toString()),
                      subtitle: Text(ContainerText
                          .roboticsCyberSecurityInfo[index]["answer"]
                          .toString()),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                itemCount: ContainerText.roboticsCyberSecurityInfo.length),
          )
        ],
      ),
    );
  }
}
