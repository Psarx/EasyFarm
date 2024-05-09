import 'package:flutter/material.dart';
import 'package:ward_connect/screens/user/soil_screen.dart';
import 'package:ward_connect/screens/user/login_screen.dart';
import 'package:ward_connect/screens/user/disease_screen.dart';
import 'package:ward_connect/screens/user/plant_screen.dart';
import 'package:ward_connect/screens/user/weather_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  void logout(BuildContext context) {
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
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => logout(context),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg2.jpg'),
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
                      onTap: () async {
                        const url =
                            'file:///C:/Users/HP/OneDrive/Desktop/bmc/frontend/disease.html';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
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
