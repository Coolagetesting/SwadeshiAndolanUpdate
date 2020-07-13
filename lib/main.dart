import 'package:swadeshiandolan/commingsoon.dart';
import 'package:swadeshiandolan/pages/apppage.dart';
import 'package:swadeshiandolan/pages/frontpage/firstpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swadeshiandolan/pages/reasion.dart';
import 'package:swadeshiandolan/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(ComingSoon());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int pageIndex = 0;

  Widget page() {
    if (pageIndex == 0) {
      return FirstScreen();
    } else if (pageIndex == 1) {
      return AppPage();
    } else if (pageIndex == 2) {
      return ReasonPage();
    } else {
      return FirstScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Swadeshi Andolan',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        brightness: Brightness.light,
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Coolors.primaryColor,
          title: Image.asset(
            "assets/swadeshiandolan.png",
            height: 80,
            width: 300,
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              child: Text(
                "Home",
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              child: Text(
                'Apps',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              child: Text(
                'Stats',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              height: 10,
              child: RaisedButton(
                color: Colors.deepOrangeAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                onPressed: () {
                  launch("https://coolage.app");
                },
                child: Text(
                  "Visit Coolage",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        body: page(),
      ),
    );
  }
}
