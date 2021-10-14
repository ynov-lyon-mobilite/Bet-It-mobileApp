import 'package:bet_it/screens/home_page.dart';
import 'package:bet_it/screens/login_page.dart';
import 'package:bet_it/screens/profile_page.dart';
import 'package:bet_it/screens/register_page.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegisterPage(),
      routes: {
        '/register': (context) => const RegisterPage(),
        '/profile': (context) => const ProfilePage(),
        '/home': (context) => const MyHomePage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}

