import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/create_account_page.dart';
import 'package:flutter_twitter_clone/login_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                  ),
                  Image.asset(
                    'assets/twitter_logo.png',
                    height: 150,
                    width: 200,
                  ),
                  const Text(
                    "See what's happening in the world right now.",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                height: 220,
              ),
              SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder?>(
                          const StadiumBorder(),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xff00acee),
                        ),
                        fixedSize: MaterialStateProperty.all<Size?>(
                          const Size(300, 60),
                        ),
                      ),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen())),
                      child: const Text(
                        'LOG IN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("--------------------or--------------------"),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<OutlinedBorder?>(
                            const StadiumBorder(),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xff00acee),
                          ),
                          fixedSize: MaterialStateProperty.all<Size?>(
                            const Size(300, 60),
                          )),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CreateAccountScreen())),
                      child: const Text(
                        'Create Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    const Text(
                      "By signing up, you agree to our Terms, Privacy Policy, and Cookie Use.",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
