import 'package:contact_buddy/Screens/create_contact_screen.dart';
import 'package:contact_buddy/Screens/home_screen.dart';
import 'package:contact_buddy/Screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: const Color.fromARGB(193, 23, 30, 30),
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
