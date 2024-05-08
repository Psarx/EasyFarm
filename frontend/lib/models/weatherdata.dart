class WeatherData {
  final String location;
  final String weather;
  final double temperature;
  final int humidity;
  final double windSpeed;
  final String timestamp;

  WeatherData({
    required this.location,
    required this.weather,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.timestamp,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      location: json['location'],
      weather: json['weather'],
      temperature: json['temperature'].toDouble(),
      humidity: json['humidity'],
      windSpeed: json['wind_speed'].toDouble(),
      timestamp: json['timestamp'],
    );
  }
}
