import 'package:flutter/material.dart';
import 'package:login_test/screens/loginscreen.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'DEVELOPER YUSUFS';

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: LoginScreen(),
      ),
    );
  }
}
