import 'dart:io'; // For file handling
import 'package:flutter/material.dart';
import 'welcome_screen.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showWelcomeScreen = true;

  @override
  void initState() {
    super.initState();
    _checkWelcomeState();
  }

  Future<void> _checkWelcomeState() async {
    final file = File('${Directory.systemTemp.path}/welcome_state.txt');
    if (await file.exists()) {
      String content = await file.readAsString();
      if (content == '1') {
        setState(() {
          showWelcomeScreen = false;
        });
      }
    }
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => showWelcomeScreen
              ? const WelcomeScreen()
              : const HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
