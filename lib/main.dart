import 'package:flutter/material.dart';
import 'package:food_del/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery App',
      theme:
          ThemeData(primarySwatch: Colors.teal, backgroundColor: Colors.grey),
      home: HomePage(),
    );
  }
}
