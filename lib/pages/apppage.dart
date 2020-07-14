import 'package:swadeshiandolan/Productpage/Productsidebar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swadeshiandolan/pages/frontpage/header.dart';
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
            appBar: PreferredSize(
               preferredSize: MediaQuery.of(context).size*0.6,
                child: SliverAppBar(
                  pinned : true,
                  title : TabBar(
                  indicatorColor: Color(0xff9962D0),
                  tabs: [
                    Tab(
                      icon: Icon(FontAwesomeIcons.appStore),
                    ),
                    Tab(icon: Icon(Icons.category)),
                  ],
                ),
                // backgroundColor: Coolors.primaryColor,
                // bottom: 
                // flexibleSpace: Container(
                //   height: MediaQuery.of(context).size.height,
                //   decoration : BoxDecoration(
                //     gradient: LinearGradient(
                //       colors: [
                //         Colors.red,Colors.orange,
                //       ]
                //     )
                //   ),
                //   child: Expanded(child : HeaderScreen()),
                // ),
              ),
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
