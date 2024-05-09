const express = require("express");
const bcrypt = require("bcrypt");
const User = require("../models/user");
const WeatherData = require("../models/weather");
const authRouter = express.Router();
const jwt = require("jsonwebtoken");
const auth = require("../middleware/auth");



authRouter.post("/api/weather", async (req, res) => {
  try {
    // Extract weather data from the request body
    const { location, latitude, longitude, weather, temperature, humidity, wind_speed, timestamp } = req.body;

    // Create a new WeatherData document
    const newWeatherData = new WeatherData({
      location,
      latitude,
      longitude,
      weather,
      temperature,
      humidity,
      wind_speed,
      timestamp
    });

    // Save the new weather data document to the database
    await newWeatherData.save();

    res.status(201).json({ message: "Weather data added successfully" });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

authRouter.post("/api/signup", async (req, res) => {
  try {
    const { email, password, name } = req.body;

    // Validate email format
    if (!/\S+@\S+\.\S+/.test(email)) {
      return res.status(400).json({ message: "Invalid email format" });
    }

    // Check if the email is already registered
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ message: "Email already registered" });
    }

    // Create a new user record
    const newUser = new User({
      email,
      password, // Note: You should hash the password before saving it in the database for security
      name
    });
    await newUser.save();

    res.status(201).json({ message: "User created successfully" });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});
authRouter.get("/api/weather", async (req, res) => {
  try {
    // Extract the location from the request headers
    const location = req.headers.location;

    // Find the weather data for the specified location in the database
    const weatherData = await WeatherData.findOne({ location });

    // Check if weather data for the location is found
    if (!weatherData) {
      return res.status(404).json({ message: "Weather data not found for the specified location" });
    }

    res.json(weatherData);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});


authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;

    const user = await User.findOne({ email });
    if (!user) {
      return res.status(400).json({ message: "User not found" });
    }

    // Compare passwords using bcrypt
    const isPasswordMatch = await bcrypt.compare(password, user.password);
    if (!isPasswordMatch) {
      return res.status(400).json({ message: "Incorrect Password" });
    }

    const token = jwt.sign({ id: user._id }, process.env.JWT_SECRET);
    res.json({ token, ...user._doc });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

module.exports = authRouter;
