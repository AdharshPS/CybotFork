// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uri_launching/utilis/container_text.dart';

class DDOSAttacktext extends StatefulWidget {
  const DDOSAttacktext({super.key});

  @override
  State<DDOSAttacktext> createState() => _DDOSAttacktextState();
}

class _DDOSAttacktextState extends State<DDOSAttacktext> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DDOS Attack"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                      title: Text(ContainerText.ddosAttackInfo[index]
                              ["question"]
                          .toString()),
                      subtitle: Text(ContainerText.ddosAttackInfo[index]
                              ["answer"]
                          .toString()),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                itemCount: ContainerText.ddosAttackInfo.length),
          )
        ],
      ),
    );
  }
}
