import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PlantDiseaseScreen extends StatelessWidget {
  Future<void> classifyImage() async {
    final response = await http.post(
      Uri.parse('http://localhost:5000/classify'),
      body: {'filename': 'leaf.jpg'}, // Change the filename as needed
    );

    if (response.statusCode == 200) {
      print('Image classified successfully');
    } else {
      print('Failed to classify image');
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
