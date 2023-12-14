import 'package:flutter/material.dart';
import 'package:whatsapp_clone/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp Clone',
      theme: ThemeData(
        primaryColor: const Color(0XFF075f54),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0XFF128C7E)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
