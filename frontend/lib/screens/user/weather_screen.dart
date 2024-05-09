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
    final Uri uri = Uri.parse('http://localhost:8080/api/weather');

    final response = await http.get(
      uri,
      headers: {
        'location': location,
      },
    );

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
        mainAxisSize: MainAxisSize.min, // Shrink-wrap vertically
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg2.jpg'),
                  fit: BoxFit.fill, // Adjusted BoxFit to fill the entire width
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TextField(
                        controller: locationController,
                        decoration: InputDecoration(
                          labelText: 'Enter Location',
                          filled: true,
                          fillColor: Colors.white,
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
                    SizedBox(height: 20),
                    _buildWeatherTextField(
                      controller: weatherController,
                      labelText: 'Weather',
                    ),
                    _buildWeatherTextField(
                      controller: temperatureController,
                      labelText: 'Temperature',
                    ),
                    _buildWeatherTextField(
                      controller: humidityController,
                      labelText: 'Humidity',
                    ),
                    _buildWeatherTextField(
                      controller: windSpeedController,
                      labelText: 'Wind Speed',
                    ),
                    _buildWeatherTextField(
                      controller: timestampController,
                      labelText: 'Timestamp',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherTextField({
    required TextEditingController controller,
    required String labelText,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.black,
        ),
        readOnly: true,
      ),
    );
  }
}
