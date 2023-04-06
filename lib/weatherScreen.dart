import 'package:flutter/material.dart';
import 'package:weather_app/mainScreen.dart';
import 'package:weather_app/utils/weather.dart';

class WeatherScreen extends StatelessWidget {
  WeatherData weatherData;
  WeatherScreen({Key? key, required this.weatherData}) : super(key: key);

  WeatherDisplayData? image;

  @override
  Widget build(BuildContext context) {
    image = weatherData.getWeatherDisplayData();
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: image?.weatherImage ?? AssetImage('assets/image/daysky.jpg'),
          ),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          child: Column(children: [
            image!.weatherIcon,
            Row(
              children: [
                SizedBox(
                  width: 55,
                ),
                Text(
                  "${(weatherData.currentTemperature! - 273 ).toString()} C",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return LoadingScreen();
                        },
                      ));
                    },
                    icon: Icon(Icons.refresh_outlined))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
