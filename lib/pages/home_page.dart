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
    return WidgetPage(
        widget: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 50),
        Text(
          'Bonjour ${_user?.displayName ?? ''} !',
          style: const TextStyle(fontSize: 32),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 40),
        GestureDetector(
          child: SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Stack(
                  children: [
                    Positioned(
                        top: 35,
                        left: 20,
                        bottom: 1,
                        child: Material(
                            child: Hero(
                          tag: 'cellenza',
                          child: Container(
                            height: 180,
                            width: 250,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(
                                    './lib/assets/humeur.png',
                                  ),
                                  fit: BoxFit.cover),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 10),
                                  color: Colors.black54,
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                          ),
                        ))),
                  ],
                ),
              )),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MoodPage()));
          },
        ),
        const Spacer(),
      ],
    ));
  }
}
