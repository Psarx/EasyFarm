import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class TfliteModel extends StatefulWidget {
  const TfliteModel({Key? key}) : super(key: key);

  @override
  _TfliteModelState createState() => _TfliteModelState();
}

class _TfliteModelState extends State<TfliteModel> {
  late List _results;
  bool imageSelect = false;

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future loadModel() async {
    Tflite.close();
    String res;
    res = (await Tflite.loadModel(model: "assets/model.tflite"))!;
    print("Models loading status: $res");
    // Predefine an image path and classify it on model load
    String imagePath =
        "assets/sample_image.jpg"; // Provide your image path here
    imageClassification(imagePath);
  }

  Future imageClassification(String imagePath) async {
    final List? recognitions = await Tflite.runModelOnImage(
      path: imagePath,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _results = recognitions!;
      imageSelect = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Classification"),
      ),
      body: ListView(
        children: [
          (imageSelect)
              ? Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.asset(
                    "assets/leaf.jpg", // Provide your image path here
                    fit: BoxFit.cover,
                  ),
                )
              : Container(
                  margin: const EdgeInsets.all(10),
                  child: const Opacity(
                    opacity: 0.8,
                    child: Center(
                      child: Text("No image selected"),
                    ),
                  ),
                ),
          SingleChildScrollView(
            child: Column(
              children: (imageSelect)
                  ? _results.map((result) {
                      return Card(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Text(
                            "${result['label']} - ${result['confidence'].toStringAsFixed(2)}",
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      );
                    }).toList()
                  : [],
            ),
          )
        ],
      ),
    );
  }
}
