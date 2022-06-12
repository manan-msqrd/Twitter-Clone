import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/constants/routes.dart';
import 'package:flutter_twitter_clone/services/auth/auth_exceptions.dart';
import 'package:flutter_twitter_clone/services/auth/auth_service.dart';
import 'package:flutter_twitter_clone/utilities/show_error_dialogbox';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

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
              controller: _email,
              autocorrect: false,
              enableSuggestions: false,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Enter Your email',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: _password,
              autocorrect: false,
              enableSuggestions: false,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Enter Your password',
              ),
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
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;
                try {
                  await AuthService.firebase()
                      .logIn(email: email, password: password);
                  final user = AuthService.firebase().currentUser;
                  if (user?.isEmailVerified ?? false) {
                    //user is verified
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      homePageRoute,
                      (route) => false,
                    );
                  } else {
                    //user is NOT verified
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      verifyEmailRoute,
                      (route) => false,
                    );
                  }
                } on UserNotFoundAuthException {
                  await showErrorDialog(
                    context,
                    'User Not Found',
                  );
                } on WrongPasswordAuthException {
                  await showErrorDialog(
                    context,
                    'Wrong Password',
                  );
                } on GenericAuthException {
                  await showErrorDialog(
                    context,
                    'Authentication Error',
                  );
                }
              },
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
