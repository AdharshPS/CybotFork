// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uri_launching/utilis/container_text.dart';

class Ransomeware extends StatefulWidget {
  const Ransomeware({super.key});

  @override
  State<Ransomeware> createState() => _RansomewareState();
}

class _RansomewareState extends State<Ransomeware> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ransomware"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                      title: Text(ContainerText
                          .ransomwareCyberSecurityInfo[index]["question"]
                          .toString()),
                      subtitle: Text(ContainerText
                          .ransomwareCyberSecurityInfo[index]["answer"]
                          .toString()),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                itemCount: ContainerText.ransomwareCyberSecurityInfo.length),
          )
        ],
      ),
    );
  }
}
