import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ward_connect/models/weatherdata.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController locationController = TextEditingController();
  final TextEditingController weatherController = TextEditingController();
  final TextEditingController temperatureController = TextEditingController();
  final TextEditingController humidityController = TextEditingController();
  final TextEditingController windSpeedController = TextEditingController();
  final TextEditingController timestampController = TextEditingController();

  @override
  void dispose() {
    locationController.dispose();
    weatherController.dispose();
    temperatureController.dispose();
    humidityController.dispose();
    windSpeedController.dispose();
    timestampController.dispose();
    super.dispose();
  }

  Future<void> getWeatherData(String location) async {
    final Uri uri =
        Uri.parse('YOUR_BACKEND_API_URL'); // Replace with your backend API URL
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      WeatherData weatherData = WeatherData.fromJson(jsonData);
      setState(() {
        locationController.text = weatherData.location;
        weatherController.text = weatherData.weather;
        temperatureController.text = weatherData.temperature.toString();
        humidityController.text = weatherData.humidity.toString();
        windSpeedController.text = weatherData.windSpeed.toString();
        timestampController.text = weatherData.timestamp;
      });
    } else {
      print('Failed to fetch weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Data'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: locationController,
              decoration: InputDecoration(
                labelText: 'Enter Location',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final String location = locationController.text;
              await getWeatherData(location);
            },
            child: Text('Get Weather'),
          ),
          TextFormField(
            controller: weatherController,
            decoration: InputDecoration(
              labelText: 'Weather',
            ),
          ),
          TextFormField(
            controller: temperatureController,
            decoration: InputDecoration(
              labelText: 'Temperature',
            ),
          ),
          TextFormField(
            controller: humidityController,
            decoration: InputDecoration(
              labelText: 'Humidity',
            ),
          ),
          TextFormField(
            controller: windSpeedController,
            decoration: InputDecoration(
              labelText: 'Wind Speed',
            ),
          ),
          TextFormField(
            controller: timestampController,
            decoration: InputDecoration(
              labelText: 'Timestamp',
            ),
          ),
        ],
      ),
    );
  }
}
