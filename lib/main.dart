import 'package:flutter/material.dart';
import 'package:flipkert_clone/home_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlipKert Clone',
      home: HomePage(),
    );
  }
}
