import 'package:flutter/material.dart';
import 'package:ward_connect/screens/user/soil_screen.dart';
import 'package:ward_connect/screens/user/login_screen.dart';
import 'package:ward_connect/screens/user/disease_screen.dart';
import 'package:ward_connect/screens/user/plant_screen.dart';
import 'package:ward_connect/screens/user/weather_screen.dart';

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
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove elevation
        actions: [
          IconButton(
            onPressed: () =>
                logout(context), // Pass reference to logout function
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/bg2.jpg'), // Change image path as needed
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigate to page when first icon is clicked
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlantDiseaseDetector()));
                      },
                      child: Image.asset(
                        'assets/images/crop_disease.png',
                        width: 190,
                        height: 190,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Crop Disease',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigate to page when second icon is clicked
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlantScreen()));
                      },
                      child: Image.asset(
                        'assets/images/cropview.png',
                        width: 190,
                        height: 190,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Plant Details',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigate to page when third icon is clicked
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SoilTypesScreen()));
                      },
                      child: Image.asset(
                        'assets/images/crpdisease.png',
                        width: 190,
                        height: 190,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Soil Types',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigate to page when fourth icon is clicked
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WeatherScreen()));
                      },
                      child: Image.asset(
                        'assets/images/weather_forecast.png',
                        width: 190,
                        height: 190,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Weather Forecast',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Text('This is the Second Page'),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
      ),
      body: Center(
        child: Text('This is the Third Page'),
      ),
    );
  }
}
