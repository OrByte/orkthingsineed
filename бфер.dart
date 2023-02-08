import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; //flutter pub add shared_preferences
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Main(),
      },
    ),
  );
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  MainState createState() => MainState();
}

class MainState extends State<Main> {
  final prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('N'),
      ),
      body: Center(
        child: Row(
          children: [
            Image(image: AssetImage(""),),
            NeumorphicText("15.4276", textStyle: Color(colors.black),),
          ],
        ),
      ),
    );
  }
}
