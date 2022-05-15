import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_cellenza_bootcamp/data/dtos/me_dto.dart';
import 'package:my_cellenza_bootcamp/data/me_repository.dart';
import 'package:my_cellenza_bootcamp/pages/mood_page.dart';
import 'package:my_cellenza_bootcamp/pages/page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MeRepository meRepository = MeRepository(Dio());
  MeDto? _user;

  @override
  void initState() {
    super.initState();
    _getMe();
  }

  Future _getMe() async {
    try {
      var user = (await meRepository.getMe());
      setState(() {
        _user = user;
      });
    } catch (e) {}
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
            Text('Hello ${_user?.displayName} 👋', style: const TextStyle(fontSize: 32)),
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
