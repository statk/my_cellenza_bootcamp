import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http_proxy_override/http_proxy_override.dart';
import 'package:my_cellenza_bootcamp/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureProxy();

  runApp(const MyApp());
}

Future<void> configureProxy() async {
  HttpProxyOverride httpProxyOverride = await HttpProxyOverride.createHttpProxy();
  HttpOverrides.global = httpProxyOverride;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
