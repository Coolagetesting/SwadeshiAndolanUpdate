import 'package:swadeshiandolan/Productpage/Productsidebar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:swadeshiandolan/utils/colors.dart';

import '../appPages/appsidebar.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: GradientAppBar(
              backgroundColorStart: Coolors.primaryColor,
              backgroundColorEnd: Coolors.secondaryColor,
              //backgroundColor: Color(0xff308e1c),
              bottom: TabBar(
                indicatorColor: Color(0xff9962D0),
                tabs: [
                  Tab(
                    icon: Icon(FontAwesomeIcons.appStore),
                  ),
                  Tab(icon: Icon(Icons.category)),
                ],
              ),
              centerTitle: true,
              title: Text("Apps & Products"),
            ),
            body: TabBarView(
              children: <Widget>[
                AppContainer(),
                ProductContainer(),
              ],
            )),
      ),
    );
  }
}
