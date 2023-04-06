import 'package:flutter/material.dart';
import 'package:weather_app/mainScreen.dart';

class MyNoLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
          Text('Location not Found'),
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return LoadingScreen();
                  },
                ));
              },
              icon: Icon(Icons.refresh_outlined))
        ]),
      ),
    );
  }
}
