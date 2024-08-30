import 'package:flutter/material.dart';
import 'package:verio/QR_code.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.blue,
            elevation: 0.0
        ),
      ),
      title: 'VERIO Scanner',
      debugShowCheckedModeBanner: false,
      home: const QrCode(),
    );
  }
}

