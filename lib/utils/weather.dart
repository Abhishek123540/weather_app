import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../credentials.dart';
import 'location.dart';

class WeatherDisplayData {
  Icon weatherIcon;
  AssetImage weatherImage;
  WeatherDisplayData({required this.weatherIcon, required this.weatherImage});
}

class WeatherData {
  WeatherData({required this.locationData});
  LocationHelper locationData;

  double? currentTemperature;
  var currentCondition = 0;
  Future getCurrentTemperature() async {
    Response response = await get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/onecall?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=${apiKey}"));
    if (response.statusCode == 200) {
      String data = response.body;
      var currentWeather = jsonDecode(data);
      try {
        currentTemperature = currentWeather["main"]["temp"];
        currentCondition = currentWeather['weather'][0]['id'];
      } catch (e) {
        print(e);
      }
    }
  }

  WeatherDisplayData getWeatherDisplayData() {
    if (currentCondition > 800) {
      return WeatherDisplayData(
          weatherIcon: Icon(Icons.cloud),
          weatherImage: AssetImage('assets/image/cloudsky.jpg'));
    } else {
      DateTime time = DateTime.now();
      if (time.hour < 15) {
        return WeatherDisplayData(
            weatherIcon: Icon(Icons.sunny),
            weatherImage: AssetImage('assets/image/daysky.jpg'));
      } else {
        return WeatherDisplayData(
            weatherIcon: Icon(Icons.stars),
            weatherImage: AssetImage('assets/image/nightsky.jpg'));
      }
    }
  }
}
