import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "アラート音声",
      theme: ThemeData.dark()
      home: HomeScreen(),
    );
  }
}
