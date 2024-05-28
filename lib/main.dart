import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uri_launching/view/bottom_navigationbar_screens/bottom_navigation_screeb.dart';
import 'package:uri_launching/view/login_screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Box box = await Hive.openBox('logindata');
  bool isLoggedIn = box.get('isLoggedIn', defaultValue: false);
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  MyApp({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? BottomNavigationScreen() : LoginScreen(),
    );
  }
}
