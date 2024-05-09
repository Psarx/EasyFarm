import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'dart:async';

class PlantDiseaseDetector extends StatefulWidget {
  @override
  _PlantDiseaseDetectorState createState() => _PlantDiseaseDetectorState();
}

class _PlantDiseaseDetectorState extends State<PlantDiseaseDetector> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: 'assets/model.tflite',
      labels: '',
    );
    setState(() {
      _loading = false;
    });
  }

  Future<void> detectObjects(String imagePath) async {
    var output = await Tflite.detectObjectOnImage(
      path: imagePath,
      numResultsPerClass: 1,
      threshold: 0.1,
    );
    print(output);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant Disease Detector'),
      ),
      body: Center(
        child: _loading
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  // Call a function to detect objects in the image
                  detectObjects(
                      'assets/leaf.jpg'); // Path to your image in assets
                },
                child: Text('Detect Objects'),
              ),
      ),
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
