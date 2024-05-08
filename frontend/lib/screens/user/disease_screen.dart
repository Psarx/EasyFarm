import 'package:flutter/material.dart';

class DiseaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disease Screen'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/bg2.jpg'), // Change image path as needed
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            'This is the Disease Screen',
            style: TextStyle(
              color: Colors
                  .white, // Set text color to white to match the background
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
