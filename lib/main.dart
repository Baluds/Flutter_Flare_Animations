import 'package:White_Bear/Routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Flare Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Routes(),
    );
  }
}
