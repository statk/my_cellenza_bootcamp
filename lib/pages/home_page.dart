import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_cellenza_bootcamp/data/dtos/me_dto.dart';
import 'package:my_cellenza_bootcamp/data/me_repository.dart';
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
    return WidgetPage(Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 250,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
            color: Color.fromRGBO(101, 147, 231, 1),
          ),
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Container(
                width: 300,
                height: 100,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50), topRight: Radius.circular(50), topLeft: Radius.circular(50)),
                  color: Colors.white,
                ),
                child: const Center(
                  child: Text(
                    'My Cellenza',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(101, 147, 231, 1),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
        _user?.initials != null
            ? Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 20, 20),
                  child: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Text(_user!.initials),
                  ),
                ),
              ])
            : Container(),
        Text(
          'Bonjour ${_user?.displayName ?? ''} !',
          style: const TextStyle(fontSize: 32),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 40),
        SizedBox(
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
                          child: Container(
                        height: 180,
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(0),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 10),
                              color: Colors.black54,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 155.0),
                          child: Center(
                              child: Text('Mon humeur',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueAccent))),
                        ),
                      ))),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 10, bottom: 10),
                    child: Positioned(
                        child: Card(
                            elevation: 10,
                            shadowColor: Colors.black54,
                            child: Container(
                              height: 200,
                              width: 150,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(101, 177, 231, 1),
                                borderRadius: BorderRadius.circular(10.0),
                                image: const DecorationImage(
                                  image: AssetImage('lib/assets/mood.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ))),
                  ),
                ],
              ),
            )),
        const Spacer(),
      ],
    ));
  }
}
