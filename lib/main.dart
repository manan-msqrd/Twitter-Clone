import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/homepage.dart';
import 'package:flutter_twitter_clone/welcome_screen.dart';
import 'package:flutter_twitter_clone/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomeScreen(),
    );
  }
}
