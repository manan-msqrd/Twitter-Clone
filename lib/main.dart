import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/create_account_page.dart';
import 'package:flutter_twitter_clone/homepage.dart';
import 'package:flutter_twitter_clone/welcome_screen.dart';
import 'package:flutter_twitter_clone/login_page.dart';
import 'package:flutter_twitter_clone/constants/routes.dart';
import 'email_verification_view.dart';

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
      routes: {
        loginRoute: (context) => const LoginScreen(),
        registerRoute: (context) => const CreateAccountScreen(),
        homePageRoute: (context) => const HomePage(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
      },
    );
  }
}
