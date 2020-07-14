import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:swadeshiandolan/firebase/database.dart';
import 'package:swadeshiandolan/models/item.dart';
import 'package:swadeshiandolan/pages/frontpage/footer.dart';
import 'package:swadeshiandolan/pages/frontpage/header.dart';
import 'package:swadeshiandolan/pages/frontpage/middle.dart';
import 'package:swadeshiandolan/utils/colors.dart';
import 'package:swadeshiandolan/widgets/item2.dart';
import 'package:swadeshiandolan/widgets/item_app.dart';

int activeTab = 0;

class SliverHome extends StatefulWidget {
  @override
  _SliverHomeState createState() => _SliverHomeState();
}

class _SliverHomeState extends State<SliverHome> with TickerProviderStateMixin {
  TabController _appController;
  TabController _productController;

  List<Tab> appList = [
    new Tab(text: 'Social'),
    new Tab(text: 'Chatting'),
    new Tab(text: 'Shopping'),
    new Tab(text: 'Scanning'),
    new Tab(text: 'Office'),
    new Tab(text: 'Music'),
    new Tab(text: 'Browsers'),
    new Tab(text: 'Security'),
    new Tab(text: 'News'),
    new Tab(text: 'Finance'),
    new Tab(text: 'Mail'),
    new Tab(text: 'Utility'),
    new Tab(text: 'Video Calling'),
    new Tab(text: 'File Sharing'),
    new Tab(text: 'Video Editing'),
    new Tab(text: 'Photo Editing'),
  ];
  List<Tab> productList = [
    new Tab(text: 'Mobiles'),
    new Tab(text: "Cold Drinks"),
    new Tab(text: "Soap"),
    new Tab(text: "Electronics"),
    new Tab(text: "Computer and tablets"),
    new Tab(text: "Online Shopping"),
    new Tab(text: "Car"),
    new Tab(text: "Toothbrush"),
    new Tab(text: "Tea Coffee"),
    new Tab(text: "Blade"),
    new Tab(text: "Shaving Cream"),
    new Tab(text: "Shampoo"),
    new Tab(text: "Talcum Powder"),
    new Tab(text: "Milk"),
    new Tab(text: "Mobile Connection"),
    new Tab(text: "Textile"),
    new Tab(text: "Bikes"),
    new Tab(text: "Footwear"),
    new Tab(text: "Cloths"),
    new Tab(text: "Garments"),
    new Tab(text: "Watches"),
    new Tab(text: "Child Food"),
    new Tab(text: "Salt"),
    new Tab(text: "Icecream"),
    new Tab(text: "Biscut"),
    new Tab(text: "Ketchup"),
    new Tab(text: "Snacks"),
    new Tab(text: "water"),
    new Tab(text: "tonic"),
    new Tab(text: "oil"),
    new Tab(text: "Washing Powder"),
    new Tab(text: "Cosmetics"),
    new Tab(text: "Pen"),
  ];

  @override
  void initState() {
    super.initState();
    _appController = new TabController(length: 16, vsync: this);
    _productController = TabController(length: 33, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Coolors.primaryColor,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Coolors.primaryColor,
              bottom: TabBar(
                  isScrollable: true,
                  controller:
                      activeTab == 0 ? _appController : _productController,
                  indicatorColor: Colors.orange,
                  labelColor: Colors.orange,
                  unselectedLabelColor: Colors.white,
                  tabs: activeTab == 0 ? appList : productList),
              pinned: true,
              expandedHeight: 900.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    HeaderScreen(),
                    MiddleScreen(),
                  ],
                ),
              ),
            ),
            sliverRemaining(),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[FooterScreen()],
              ),
            ),
          ],
        ));
  }

  Widget sliverRemaining() {
    return activeTab == 0
        ? SliverFillRemaining(
            child: TabBarView(children: [
              itemList('Social'),
              itemList('Chatting'),
              itemList('Shopping'),
              itemList('Scanning'),
              itemList('Office'),
              itemList('Music'),
              itemList('Browsers'),
              itemList('Security'),
              itemList('News'),
              itemList('Finance'),
              itemList('Mail'),
              itemList('Utility'),
              itemList('Video Calling'),
              itemList('File Sharing'),
              itemList('Video Editing'),
              itemList('Photo Editing'),
            ], controller: _appController),
          )
        : SliverFillRemaining(
            child: TabBarView(children: [
              itemsList2('Mobiles'),
              itemsList2("Cold Drinks"),
              itemsList2("Soap"),
              itemsList2("Electronics"),
              itemsList2("Computer and tablets"),
              itemsList2("Online Shopping"),
              itemsList2("Car"),
              itemsList2("Toothbrush"),
              itemsList2("Tea Coffee"),
              itemsList2("Blade"),
              itemsList2("Shaving Cream"),
              itemsList2("Shampoo"),
              itemsList2("Talcum Powder"),
              itemsList2("Milk"),
              itemsList2("Mobile Connection"),
              itemsList2("Textile"),
              itemsList2("Bikes"),
              itemsList2("Footwear"),
              itemsList2("Cloths"),
              itemsList2("Garments"),
              itemsList2("Watches"),
              itemsList2("Child Food"),
              itemsList2("Salt"),
              itemsList2("Icecream"),
              itemsList2("Biscut"),
              itemsList2("Ketchup"),
              itemsList2("Snacks"),
              itemsList2("water"),
              itemsList2("tonic"),
              itemsList2("oil"),
              itemsList2("Washing Powder"),
              itemsList2("Cosmetics"),
              itemsList2("Pen"),
            ], controller: _productController),
          );
  }

  Widget itemList(String item) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) / 2;
    final double itemWidth = size.width / 2;

    var list1 = StreamBuilder(
      stream: itemsRef.document('Apps').collection(item).snapshots(),
      builder: (cont, snapshot) {
        return (snapshot.hasData && snapshot.data.documents.length > 0)
            ? GridView.count(
                crossAxisCount: size.width < 800 ? 1 : 3,
                // physics: NeverScrollableScrollPhysics(),
                childAspectRatio:
                    size.width < 800 ? 2 : (itemWidth / itemHeight),
                children:
                    List.generate(snapshot.data.documents.length, (index) {
                  DocumentSnapshot doc = snapshot.data.documents[index];
                  Item itemModel = Item.fromDocument(doc);
                  return Item2(item: itemModel);
                }),
                shrinkWrap: true,
              )
            : Container(
                child: Text('No Data Available'),
              );
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
            : Container(
                child: Text('No Data Available'),
              );
      },
    );

    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Chinese Apps Banned',
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
                  'Alternatives',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              list1
            ],
          ),
        )
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
            ? GridView.count(
                crossAxisCount: size.width < 800 ? 1 : 3,
                // physics: NeverScrollableScrollPhysics(),
                childAspectRatio:
                    size.width < 800 ? 1.5 : (itemWidth / itemHeight),
                children:
                    List.generate(snapshot.data.documents.length, (index) {
                  DocumentSnapshot doc = snapshot.data.documents[index];
                  Item itemModel = Item.fromDocument(doc);
                  return Item2(item: itemModel);
                }),
                shrinkWrap: true,
              )
            : Container(
                child: Text('No Data Available'),
              );
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
            : Container(
                child: Text('No Data Available'),
              );
      },
    );

    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Chinese Products',
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
                  'Alternatives',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              list1
            ],
          ),
        )
      ],
    );
  }
}
