import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/homepage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email;
  late String _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Image.asset(
          'assets/twitter_logo.png',
          height: 200,
          width: 60,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Text(
              "Enter your Log In details",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Enter Your email',
              ),
              onChanged: (value) {
                _email = value;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Enter Your password',
              ),
              onChanged: (value) {
                _password = value;
              },
            ),
            const SizedBox(
              height: 180,
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
                ),
              ),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage())),
              child: const Text(
                'LOG IN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Forgot Password?"),
            )
          ],
        ),
      ),
    );
  }
}
