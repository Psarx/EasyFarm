import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PlantDiseaseScreen extends StatelessWidget {
  Future<void> classifyImage() async {
    try {
      // Open the image file
      File imageFile = File('assets/leaf.jpg');

      // Create a multipart request
      var request = http.MultipartRequest(
          'POST', Uri.parse('http://localhost:5000/classify'));

      // Add the image file to the request
      var imageStream = http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();
      var multipartFile = http.MultipartFile('file', imageStream, length,
          filename: 'assets/leaf.jpg');

      request.files.add(multipartFile);

      // Send the request
      var response = await request.send();

      // Check the response status
      if (response.statusCode == 200) {
        print('Image classified successfully');

        // Read and print the response body
        var responseBody = await response.stream.bytesToString();
        print('Response body: $responseBody');
      } else {
        print('Failed to classify image');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant Disease Classification'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: classifyImage,
          child: Text('Classify Image'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Plant Disease Detection',
    home: PlantDiseaseScreen(),
  ));
}
