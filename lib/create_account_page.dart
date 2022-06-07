import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/homepage.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);
  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  late String _email;
  late String _password;
  late String _name;
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
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Name',
              ),
              onChanged: (value) {
                _name = value;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Email',
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
                hintText: 'Password',
              ),
              onChanged: (value) {
                _password = value;
              },
            ),
            const SizedBox(
              height: 40,
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
                'Create Account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
