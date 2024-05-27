// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uri_launching/utilis/container_text.dart';

class Databreach extends StatefulWidget {
  const Databreach({super.key});

  @override
  State<Databreach> createState() => _DatabreachState();
}

class _DatabreachState extends State<Databreach> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Breach"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                      title: Text(ContainerText.dataBreachInfo[index]
                              ["question"]
                          .toString()),
                      subtitle: Text(ContainerText.dataBreachInfo[index]
                              ["answer"]
                          .toString()),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                itemCount: ContainerText.dataBreachInfo.length),
          )
        ],
      ),
    );
  }
}
