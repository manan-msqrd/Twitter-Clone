import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/create_tweet_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarOpacity: 0.8,
        elevation: 0,
        title: Image.asset(
          'assets/twitter_logo.png',
          height: 200,
          width: 60,
        ),
        backgroundColor: Colors.white,
        leading: Container(
          margin: const EdgeInsets.all(7.0),
          child: const CircleAvatar(backgroundColor: Colors.blue),
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (index) {
          setState(() {});
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 40.0,
            ),
            label: '',
            activeIcon: Icon(
              Icons.home,
              size: 40.0,
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 40.0,
              ),
              label: ''),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.mic_none_rounded,
              size: 40,
            ),
            label: '',
            activeIcon: Icon(
              Icons.mic,
              size: 40.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_alert_outlined,
              size: 40,
            ),
            label: '',
            activeIcon: Icon(
              Icons.add_alert,
              size: 40.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.mail_outline,
              size: 40,
            ),
            label: '',
            activeIcon: Icon(
              Icons.mail,
              size: 40.0,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => const CreateTweetScreen(),
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
