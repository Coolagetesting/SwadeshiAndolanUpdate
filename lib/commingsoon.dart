import 'package:flutter/material.dart';
import 'package:swadeshiandolan/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ComingSoon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Coolors.primaryColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Coming Soon . . . .",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.deepOrange,
                  child: MaterialButton(
                    onPressed: () {
                      launch("https://coolage.app");
                    },
                    child: Text(
                      "Coolage App",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
