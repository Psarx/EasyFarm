const mongoose = require('mongoose');

// Define the schema for the WeatherData model
const weatherDataSchema = new mongoose.Schema({
  location: {
    type: String,
    required: true
  },
  latitude: {
    type: Number,
    required: true
  },
  longitude: {
    type: Number,
    required: true
  },
  weather: {
    type: String,
    required: true
  },
  temperature: {
    type: Number,
    required: true
  },
  humidity: {
    type: Number,
    required: true
  },
  wind_speed: {
    type: Number,
    required: true
  },
  timestamp: {
    type: Date,
    default: Date.now
  }
});

// Create the WeatherData model using the schema
const WeatherData = mongoose.model('WeatherData', weatherDataSchema);

module.exports = WeatherData;
