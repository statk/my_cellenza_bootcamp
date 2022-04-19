import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_cellenza_bootcamp/data/me_repository.dart';
import 'package:my_cellenza_bootcamp/pages/mood_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MeRepository meRepository = MeRepository(Dio());
  String? _userName;

  @override
  void initState() {
    super.initState();
    _getMe();
  }

  Future _getMe() async {
    var name = (await meRepository.getMe()).displayName;
    setState(() {
      _userName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cellenza'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Hello $_userName 👋', style: const TextStyle(fontSize: 32)),
            OutlinedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MoodPage()));
              },
              child: const Text('Go to My Mood of the month'),
            ),
          ],
        ),
      ),
    );
  }
}
