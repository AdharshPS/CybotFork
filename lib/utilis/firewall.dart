// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uri_launching/utilis/container_text.dart';

class FireWalltext extends StatefulWidget {
  const FireWalltext({super.key});

  @override
  State<FireWalltext> createState() => _FireWalltextState();
}

class _FireWalltextState extends State<FireWalltext> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firewall"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                      title: Text(ContainerText.firewallInfo[index]["question"]
                          .toString()),
                      subtitle: Text(ContainerText.firewallInfo[index]["answer"]
                          .toString()),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                itemCount: ContainerText.firewallInfo.length),
          )
        ],
      ),
    );
  }
}
