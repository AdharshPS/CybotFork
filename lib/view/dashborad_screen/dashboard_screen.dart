import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:uri_launching/controller/suggestion_list/suggestion_list.dart';
import 'package:uri_launching/utilis/color_constant/color_constant.dart';
import 'package:http/http.dart' as http;
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'dart:developer';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextEditingController askquestioncontroller = TextEditingController();
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = '';
  dynamic res = "";
  String answers = "";
  double _fontSize = 16.0; // Default font size

  Future<String> askquestion() async {
    String uri = "https://cybot.avanzosolutions.in/cybot/search_text.php";
    try {
      res = await http.post(Uri.parse(uri), body: {
        "askquestioncontroller": askquestioncontroller.text,
      });
    } catch (e) {
      log(e.toString());
    }
    String data = res.body;
    return data;
  }

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            askquestioncontroller.text = val.recognizedWords;
            _text = val.recognizedWords;
            askquestioncontroller.text = _text;
            askquestioncontroller.selection = TextSelection.fromPosition(
                TextPosition(offset: askquestioncontroller.text.length));
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  void dispose() {
    askquestioncontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Image.asset("assets/images/avzlogo.png", height: 100),
            SizedBox(height: 18),
            Center(
              child: Text(
                "CYBERHULK",
                style: TextStyle(
                  color: Colorconstant.darkpurple,
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                  controller: askquestioncontroller,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(_isListening ? Icons.mic : Icons.mic_none),
                      onPressed: _listen,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                suggestionsCallback: (pattern) async {
                  return Suggestions.suggestionlist
                      .where((item) =>
                          item.toLowerCase().startsWith(pattern.toLowerCase()))
                      .toList();
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(title: Text(suggestion));
                },
                onSuggestionSelected: (suggestion) {
                  askquestioncontroller.text = suggestion;
                },
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colorconstant.darkpurple),
                minimumSize: MaterialStateProperty.all(Size(300, 70)),
              ),
              onPressed: () async {
                String response = await askquestion();
                answers = response;
                log("this will be printed on ui $answers");
                setState(() {});
                askquestioncontroller.clear();
              },
              child: Text(
                "Ask",
                style: TextStyle(
                  fontSize: 25,
                  color: Colorconstant.pantonemessage,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.zoom_out),
                        onPressed: () {
                          setState(() {
                            if (_fontSize > 12)
                              _fontSize -= 2; // Decrease font size
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.zoom_in),
                        onPressed: () {
                          setState(() {
                            if (_fontSize < 30)
                              _fontSize += 2; // Increase font size
                          });
                        },
                      ),
                    ],
                  ),
                  Text(
                    answers,
                    style: TextStyle(fontSize: _fontSize),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
