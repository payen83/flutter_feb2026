import 'package:flutter/material.dart';
// import 'package:flutter_feb2026/app/views/home.screen.dart';
import 'package:flutter_feb2026/app/widgets/navigationbar.widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Navigationbar()
    );
  }
}