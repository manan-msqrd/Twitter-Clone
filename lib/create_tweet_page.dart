import 'package:flutter/material.dart';

class CreateTweetScreen extends StatefulWidget {
  const CreateTweetScreen({Key? key}) : super(key: key);
  @override
  State<CreateTweetScreen> createState() => _CreateTweetScreenState();
}

class _CreateTweetScreenState extends State<CreateTweetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff00acee),
        centerTitle: true,
        title: const Text(
          'Tweet',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              maxLength: 280,
              maxLines: 7,
              decoration: const InputDecoration(
                hintText: 'Enter your Tweet',
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Color(0xff00acee),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
