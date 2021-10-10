import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timertask/home_body.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(backgroundColor: Colors.yellow),
        body: SingleChildScrollView(child: homeBody())
      ),
    );
  }
}