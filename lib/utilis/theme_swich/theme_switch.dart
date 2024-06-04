import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uri_launching/main.dart';
import 'package:uri_launching/utilis/color_constant/color_constant.dart';

class ThemeSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Icon(
        //   themeProvider.themeMode == ThemeMode.light
        //       ? Icons.wb_sunny
        //       : Icons.nights_stay,
        //   color: themeProvider.themeMode == ThemeMode.light
        //       ? Colors.yellow
        //       : Colors.grey,
        // ),
        Switch(
          inactiveThumbColor: Colorconstant.pantonemessage,
          activeColor: Colorconstant.pantonebackground,
          value: themeProvider.themeMode == ThemeMode.dark,
          onChanged: (value) {
            themeProvider.toggleTheme(value);
          },
        ),
        Icon(
          themeProvider.themeMode == ThemeMode.dark
              ? Icons.nights_stay
              : Icons.wb_sunny,
          color: themeProvider.themeMode == ThemeMode.dark
              ? Colorconstant.mainblack
              : Colors.yellow,
        ),
      ],
    );
  }
}
