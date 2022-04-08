import 'package:crypto/controllers/currency_controller.dart';
import 'package:crypto/screens/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(CurrencyController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Demo',
      home: const MainPage(),
      theme: ThemeData(
        fontFamily: 'OpenSans',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
    );
  }
}
