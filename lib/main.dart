import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swadeshiandolan/pages/frontpage/sliver_home.dart';
import 'package:swadeshiandolan/pages/reasion.dart';
import 'package:swadeshiandolan/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

bool english;

void main() {
  runApp(MyApp());
}

class Language extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  int pageIndex = 0;
  Widget page() {
    if (pageIndex == 0) {
      return SliverHome();
    } else if (pageIndex == 1) {
      return ReasonPage();
    } else {
      return SliverHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget navbar() {
      return LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              height: 100,
              color: Coolors.primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(
                    "assets/swadeshiandolan.png",
                    height: 100,
                    width: 300,
                  ),
                  Row(
                    children: <Widget>[
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            activeTab = 0;
                          });
                        },
                        child: Text(
                          "Apps",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            activeTab = 1;
                          });
                        },
                        child: Text(
                          "Products",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            pageIndex == 0 ? pageIndex = 1 : pageIndex = 0;
                          });
                        },
                        child: Text(
                          pageIndex == 0 ? 'Stats' : 'Home',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      MaterialButton(
                        color: Colors.pink,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        onPressed: () {
                          launch("https://coolage.app");
                        },
                        child: Text(
                          "Visit Coolage",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          } else {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              color: Coolors.primaryColor,
              child: Column(children: <Widget>[
                Image.asset(
                  "assets/swadeshiandolan.png",
                  height: 50,
                  width: 300,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          activeTab = 0;
                        });
                      },
                      child: Text(
                        "Apps",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          activeTab = 1;
                        });
                      },
                      child: Text(
                        "Products",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          pageIndex == 0 ? pageIndex = 1 : pageIndex = 0;
                        });
                      },
                      child: Text(
                        pageIndex == 0 ? 'Stats' : 'Home',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    MaterialButton(
                      color: Colors.pink,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      onPressed: () {
                        launch("https://coolage.app");
                      },
                      child: Text(
                        "Visit Coolage",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ]),
            );
          }
        },
      );
    }

    return Scaffold(
      body: Container(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          navbar(),
          Expanded(child: page()),
        ],
      )),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      home: english != null
          ? Language()
          : Container(
              color: Coolors.primaryColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: MaterialButton(
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        setState(() {
                          english = false;
                        });
                        // Navigator.push(
                        //     context, MaterialPageRoute(builder: (context) => Language()));
                      },
                      child: Text(
                        "हिन्दी",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        setState(() {
                          english = true;
                        });
                        // Navigator.push(
                        //     context, MaterialPageRoute(builder: (context) => Language()));
                      },
                      child: Text("English",
                          style: TextStyle(
                              color: Colors.orangeAccent,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
