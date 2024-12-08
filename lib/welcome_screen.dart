import 'dart:io'; // For file handling
import 'package:flutter/material.dart';
import 'home.dart'; // Import HomeScreen

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const String stateFileName = "welcome_state.txt"; // File to store state

  // Write 1 (visited) to a local file
  Future<void> _markWelcomeAsSeen() async {
    final file = await _getLocalFile();
    await file.writeAsString('1');
  }

  // Get the local file
  Future<File> _getLocalFile() async {
    final directory = Directory.systemTemp; // Use system temp directory
    return File('${directory.path}/$stateFileName');
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF055975), // Background color
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildTitle(screenHeight), // Title
            _buildVersion(), // Version text
            _buildGetStartedButton(context, screenWidth), // Button
          ],
        ),
      ),
    );
  }

  // Build the title text
  Widget _buildTitle(double screenHeight) {
    return Positioned(
      top: screenHeight * 0.2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/newslogo.png', // Path to your logo file
            height: 300, // Adjust the height of the logo as needed
          ),
          const SizedBox(height: 20), // Spacing between the logo and text
          const Text(
            'NewsMaster',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Build the version text at the bottom
  Widget _buildVersion() {
    return const Positioned(
      bottom: 20,
      child: Text(
        'Version 1.0',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color.fromARGB(255, 117, 113, 113),
          fontSize: 16,
        ),
      ),
    );
  }

  // Build the 'Get Started' button
  Widget _buildGetStartedButton(BuildContext context, double screenWidth) {
    return Positioned(
      bottom: 80,
      left: screenWidth * 0.1,
      right: screenWidth * 0.1,
      child: ElevatedButton(
        onPressed: () async {
          await _markWelcomeAsSeen(); // Mark as seen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15.0),
        ),
        child: const Text(
          'Get Started',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
