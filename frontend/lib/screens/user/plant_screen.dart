import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PlantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant Details'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            fetchPlants();
          },
          child: Text('Get Plants'),
        ),
      ),
    );
  }

  void fetchPlants() async {
    Map<String, dynamic> options = {
      'method': 'GET',
      'url': 'https://plants10.p.rapidapi.com/plants/growth_habit',
      'params': {'limit': '10'},
      'headers': {
        'X-RapidAPI-Key': '1f5659dc3amshf9e1b070dd8591ap1f2348jsn83eefa567655',
        'X-RapidAPI-Host': 'plants10.p.rapidapi.com'
      }
    };

    try {
      var response = await http.get(
        Uri.parse(options['url'] as String), // Cast to String
        headers: options['headers']
            as Map<String, String>, // Cast to Map<String, String>
        // You can add query parameters here if needed
      );

      // Handle response
      print(response.statusCode);
      print(response.body);

      // Add logic to handle the response data
    } catch (error) {
      // Handle error
      print('Error: $error');
    }
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Details Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: PlantScreen(),
    );
  }
}
