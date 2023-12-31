import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/view/camera/camera_screen.dart';
import 'package:whatsapp_clone/view/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
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
        fontFamily: "OpenSans",
        primaryColor: const Color(0XFF075f54),
        colorScheme: ColorScheme.fromSeed(
          // onSecondary: const Color(0XFF128C7E),
          seedColor: const Color(0XFF075f54),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
