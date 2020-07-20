import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:swadeshiandolan/firebase/database.dart';
import 'package:swadeshiandolan/main.dart';
import 'package:swadeshiandolan/models/item.dart';
import 'package:swadeshiandolan/models/item_prod.dart';
import 'package:swadeshiandolan/pages/frontpage/footer.dart';
import 'package:swadeshiandolan/pages/frontpage/header.dart';
import 'package:swadeshiandolan/pages/frontpage/middle.dart';
import 'package:swadeshiandolan/utils/colors.dart';
import 'package:swadeshiandolan/widgets/item1.dart';
import 'package:swadeshiandolan/widgets/item2.dart';
import 'package:swadeshiandolan/widgets/item_app.dart';
import 'package:swadeshiandolan/widgets/progress.dart';

int activeTab = 0;

class SliverHome extends StatefulWidget {
  @override
  _SliverHomeState createState() => _SliverHomeState();
}

class _SliverHomeState extends State<SliverHome> with TickerProviderStateMixin {
  int categorySelected = 0;
  int categorySelectedProd = 0;

  TabController _appController;
  TabController _productController;

  final List<String> appString = [
    "Social",
    "Chatting",
    "Shopping",
    "Scanning",
    "Office",
    "Music",
    "Browsers",
    "Games",
    "News",
    "Security",
    "Finance",
    "Mail",
    "Utility",
    "Video Calling",
    "File Sharing",
    "Video Editing",
    "Photo Editing",
  ];

  final List<String> productString = [
    "Mobiles",
    "AIR CONDITIONERS",
    "Audio",
    "Bikes",
    "CCTV",
    "Cameras",
    "Car",
    "Computer and tablets",
    "Power Bank",
    "REFRIGERATORS",
    "Routers",
    "Smart Watch",
    "TV",
    "WASHING MACHINES",
  ];

  List<Tab> appList = [
    new Tab(text: english ? 'Social' : "सोशल"),
    new Tab(text: english ? 'Chatting' : "चैटिंग"),
    new Tab(text: english ? 'Shopping' : "शॉपिंग"),
    new Tab(text: english ? 'Scanning' : "स्कैनिंग"),
    new Tab(text: english ? 'Office' : "ऑफिस"),
    new Tab(text: english ? 'Music' : "संगीत"),
    new Tab(text: english ? 'Browsers' : "ब्राउज़र"),
    new Tab(text: english ? 'Games' : "खेल"),
    new Tab(text: english ? 'News' : "समाचार"),
    new Tab(text: english ? 'Security' : "सुरक्षा"),
    new Tab(text: english ? 'Finance' : "वित्त"),
    new Tab(text: english ? 'Mail' : "मेल"),
    new Tab(text: english ? 'Utility' : "उपयोगिता"),
    new Tab(text: english ? 'Video Calling' : "वीडियो कॉल"),
    new Tab(text: english ? 'File Sharing' : "फ़ाइल साझा"),
    new Tab(text: english ? 'Video Editing' : "वीडियो एडिटिंग"),
    new Tab(text: english ? 'Photo Editing' : "फोटो एडिटिंग"),
  ];

  List<Tab> productList = [
    new Tab(text: english ? 'Mobiles' : "मोबाइल"),
    new Tab(text: english ? "A.C" : "ए.सी"),
    new Tab(text: english ? "Audio" : "ऑडियो"),
    new Tab(text: english ? "Bikes" : "बाइक"),
    new Tab(text: english ? "CCTV" : "सीसीटीवी"),
    new Tab(text: english ? "Camera" : "कैमरा"),
    new Tab(text: english ? "Car" : "कार"),
    new Tab(text: english ? "Computer & tablets" : "कंप्यूटर और टैबलेट"),
    new Tab(text: english ? "Power Bank" : "पावर बैंक"),
    new Tab(text: english ? "Refrigerator" : "रेफ्रिजरेटर"),
    new Tab(text: english ? "Routers" : "राउटर्स"),
    new Tab(text: english ? "Smart Watch" : "स्मार्ट वाच"),
    new Tab(text: english ? "T.V" : "टीवी"),
    new Tab(text: english ? "Washing Machines" : "वाशिंग मशीन"),
  ];

  @override
  void initState() {
    super.initState();
    _appController = new TabController(length: 17, vsync: this);
    _productController = TabController(length: 14, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Coolors.primaryColor,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Coolors.primaryColor,
              title: TabBar(
                  onTap: (index) {
                    setState(() {
                      activeTab == 0
                          ? categorySelected = index
                          : categorySelectedProd = index;
                    });
                  },
                  isScrollable: true,
                  controller:
                      activeTab == 0 ? _appController : _productController,
                  indicatorColor: Colors.orange,
                  labelColor: Colors.orange,
                  unselectedLabelColor: Colors.white,
                  tabs: activeTab == 0 ? appList : productList),
              pinned: true,
            ),
            // sliverRemaining(),
            SliverFillRemaining(
              child: activeTab == 0
                  ? itemList(appString[categorySelected])
                  : itemsList2(productString[categorySelectedProd]),
            )
          ],
        ));
  }

  Widget itemList(String item) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) / 2;
    final double itemWidth = size.width / 2;

    var list1 = StreamBuilder(
      stream: itemsRef.document('Apps').collection(item).snapshots(),
      builder: (cont, snapshot) {
        return (snapshot.hasData && snapshot.data.documents.length > 0)
            ? size.width < 800
                ? ListView.builder(
                    physics: ScrollPhysics(),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot doc = snapshot.data.documents[index];
                      Item itemModel = Item.fromDocument(doc);
                      return Item2(item: itemModel);
                    },
                    shrinkWrap: true,
                  )
                : GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: (itemWidth / itemHeight),
                    shrinkWrap: true,
                    children:
                        List.generate(snapshot.data.documents.length, (index) {
                      DocumentSnapshot doc = snapshot.data.documents[index];
                      Item itemModel = Item.fromDocument(doc);
                      return Item2(item: itemModel);
                    }),
                  )
            : snapshot.hasData
                ? Container(
                    child: Text('No Data Available'),
                  )
                : circularProgress();
      },
    );

    var list2 = StreamBuilder(
      stream: itemsAppsRef.document('Apps').collection(item).snapshots(),
      builder: (context, snapshot) {
        return (snapshot.hasData && snapshot.data.documents.length > 0)
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot doc = snapshot.data.documents[index];
                  return ItemApp(name: doc['name'], image: doc['image']);
                },
                shrinkWrap: true,
              )
            : snapshot.hasData
                ? Container(
                    child: Text('No Data Available'),
                  )
                : circularProgress();
      },
    );

    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              HeaderScreen(),
              MiddleScreen(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      english
                          ? 'Chinese Apps Banned'
                          : "प्रतिबंधित चीनी एप्प्स",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 140,
                child: list2,
                alignment: Alignment.centerLeft,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 18),
                child: Text(
                  english ? 'Alternatives' : "भारतीय विकल्प",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              list1,
              FooterScreen()
            ],
          ),
        ),
      ],
    );
  }

  Widget itemsList2(String item) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) / 2;
    final double itemWidth = size.width / 2;

    var list1 = StreamBuilder(
      stream: itemsRef.document('Products').collection(item).snapshots(),
      builder: (cont, snapshot) {
        return (snapshot.hasData && snapshot.data.documents.length > 0)
            ? size.width < 800
                ? ListView.builder(
                    physics: ScrollPhysics(),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot doc = snapshot.data.documents[index];
                      ItemProd itemModel = ItemProd.fromDocument(doc);
                      return Item1(item: itemModel);
                    },
                    shrinkWrap: true,
                  )
                : GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: (itemWidth / itemHeight),
                    children:
                        List.generate(snapshot.data.documents.length, (index) {
                      DocumentSnapshot doc = snapshot.data.documents[index];
                      ItemProd itemModel = ItemProd.fromDocument(doc);
                      return Item1(item: itemModel);
                    }),
                    shrinkWrap: true,
                  )
            : snapshot.hasData
                ? Container(
                    child: Text('No Data Available'),
                  )
                : circularProgress();
      },
    );

    var list2 = StreamBuilder(
      stream: itemsAppsRef.document('Products').collection(item).snapshots(),
      builder: (context, snapshot) {
        return (snapshot.hasData && snapshot.data.documents.length > 0)
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot doc = snapshot.data.documents[index];
                  return ItemApp(name: doc['name'], image: doc['image']);
                },
                shrinkWrap: true,
              )
            : snapshot.hasData
                ? Container(
                    child: Text('No Data Available'),
                  )
                : circularProgress();
      },
    );

    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              HeaderScreen(),
              MiddleScreen(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      english ? 'Chinese Products' : "चीनी उत्पादों",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 140,
                child: list2,
                alignment: Alignment.centerLeft,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 18),
                child: Text(
                  english ? 'Alternatives' : "भारतीय विकल्प",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              list1,
              FooterScreen()
            ],
          ),
        )
      ],
    );
  }
}
