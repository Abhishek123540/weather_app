import 'package:flutter/material.dart';
import 'package:weather_app/mainScreen.dart';

import 'global.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: a,
        body: Container(
            decoration: BoxDecoration(
                //color: Colors.pink,
                // gradient:LinearGradient(colors: [Colors.black,Colors.pink]
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://wallpapercave.com/wp/wp5791311.jpg"))),
            child: Center(
                child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.white.withOpacity(0.8))),
              child: const Text(
                "Welcome",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoadingScreen();
                }));
              },
            ))));

    //TODO:create remaining app
  }
}