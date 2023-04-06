import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'global.dart';
import 'noLocation.dart';
import 'utils/location.dart';
import 'utils/weather.dart';
import 'weatherScreen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  LocationHelper locationHelper = LocationHelper();
  getWeather() async {
    await locationHelper.getCurrentLocation();
    if (locationHelper.latitude == null || locationHelper.longitude == null) {
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return MyNoLocation();
      }));
    } else {
      WeatherData weatherData = WeatherData(locationData: locationHelper);
      await weatherData.getCurrentTemperature();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return WeatherScreen(weatherData: weatherData);
      }));
    }
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: a,
      body: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
                colors: [Colors.blue.shade700, Colors.indigo.shade800])),
        child: const Center(
            child: SpinKitPouringHourGlass(
          color: Colors.yellow,
          size: 75,
        )),
      ),
    );
  }
}
