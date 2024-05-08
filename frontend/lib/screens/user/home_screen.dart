import 'package:flutter/material.dart';
import 'package:ward_connect/screens/user/login_screen.dart'; // Import your login screen here

class HomeScreen extends StatelessWidget {
  void logout(BuildContext context) {
    // Implement logout functionality here
    // For example, you can clear user session, remove tokens, etc.
    // After logout, navigate to the sign-in page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make app bar transparent
        elevation: 0, // Remove shadow
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => logout(context),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity, // Set height to occupy full screen
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('/bggreen.jpg'), // Change background image here
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Home Screen!',
              style: TextStyle(fontSize: 20, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
