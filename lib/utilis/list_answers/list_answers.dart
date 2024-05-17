import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uri_launching/view/dashborad_screen/dashboard_screen.dart';
import 'package:http/http.dart' as http;

class ListAnswers extends StatefulWidget {
  const ListAnswers({super.key});

  @override
  State<ListAnswers> createState() => _ListAnswersState();
}

class _ListAnswersState extends State<ListAnswers> {
  List userdata = [];
  Future<void> getanswer() async {
    String uri = "https://cybot.avanzosolutions.in/cybot/search_text.php";
    try {
      var response = await http.get(Uri.parse(uri));
      setState(() {
        userdata = jsonDecode(response.body);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getanswer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: userdata.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(userdata[index]),
                ),
              );
            }));
  }
}
