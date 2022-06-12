import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/constants/routes.dart';
import 'package:flutter_twitter_clone/services/auth/auth_exceptions.dart';
import 'package:flutter_twitter_clone/services/auth/auth_service.dart';
import 'package:flutter_twitter_clone/utilities/show_error_dialogbox';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);
  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late String _name;

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
              controller: _email,
              autocorrect: false,
              enableSuggestions: false,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email',
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
                hintText: 'Password',
              ),
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
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;
                try {
                  await AuthService.firebase().createUser(
                    email: email,
                    password: password,
                  );
                  AuthService.firebase().currentUser;
                  AuthService.firebase().sendEmailVerification();
                  Navigator.of(context).pushNamed(verifyEmailRoute);
                } on WeakPasswordAuthException {
                  await showErrorDialog(
                    context,
                    'Weak Password',
                  );
                } on EmailAlreadyInUseAuthException {
                  await showErrorDialog(
                    context,
                    'Email Already in use',
                  );
                } on InvalidEmailAuthException {
                  await showErrorDialog(
                    context,
                    'Invalid Email',
                  );
                } on GenericAuthException {
                  await showErrorDialog(
                    context,
                    'Failed to Register',
                  );
                }
              },
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
