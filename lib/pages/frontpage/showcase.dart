import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swadeshiandolan/firebase/database.dart';
import 'package:swadeshiandolan/models/item.dart';
import 'package:swadeshiandolan/widgets/item1.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/item2.dart';

class ShowCase extends StatefulWidget {
  @override
  _ShowCaseState createState() => _ShowCaseState();
}

class _ShowCaseState extends State<ShowCase> with TickerProviderStateMixin {
  TabController _appController;
  TabController _productController;
  TabController _tabController;

  int selectedMenuItem = 0;

  final List<String> menuItems = [
    "Mobiles",
    "Cold Drinks",
    "Soap",
    "Electronics",
    "Computer and tablets",
    "Online Shopping",
    "Car",
    "Toothbrush",
    "Tea Coffee",
    "Blade",
    "Shaving Cream",
    "Shampoo",
    "Talcum Powder",
    "Milk",
    "Mobile Connection",
    "Textile",
    "Bikes",
    "Footwear",
    "Cloths",
    "Garments",
    "Watches",
    "Child Food",
    "Salt",
    "Icecream",
    "Biscut",
    "Ketchup",
    "Snacks",
    "water",
    "tonic",
    "oil",
    "Washing Powder",
    "Cosmetics",
    "Pen",
  ];

  List<Tab> tabList = [
    new Tab(text: 'Applocations'),
    new Tab(text: 'Products'),
  ];
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
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.isMobile ? 400 : 400,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          TabBar(
              isScrollable: true,
              controller: _tabController,
              indicatorColor: Colors.orange,
              labelColor: Colors.orange,
              unselectedLabelColor: Colors.white,
              tabs: tabList),
          Expanded(
            child: TabBarView(
              children: [
                appBar(),
                productsBar(),
              ],
              controller: _tabController,
            ),
          ),
        ],
      ),
    );
  }

  Widget itemList(String item) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: StreamBuilder(
        stream: itemsRef.document('Apps').collection(item).snapshots(),
        builder: (context, snapshot) {
          return (snapshot.hasData && snapshot.data.documents.length > 0)
              ? GridView.builder(
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: context.isMobile ? 1 : 3),
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot doc = snapshot.data.documents[index];
                    Item itemModel = Item.fromDocument(doc);
                    return Item1(item: itemModel);
                  },
                )
              : Container(
                  child: Text('No Data Available'),
                );
        },
      ),
    );
  }

  Widget productsBar() {
    return Container(
      height: context.isMobile ? 350 : 350,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          TabBar(
              isScrollable: true,
              controller: _productController,
              indicatorColor: Colors.orange,
              labelColor: Colors.orange,
              unselectedLabelColor: Colors.white,
              tabs: productList),
          Expanded(
            child: TabBarView(
              children: [
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
              ],
              controller: _productController,
            ),
          ),
        ],
      ),
    );
  }

  Widget appBar() {
    return Container(
      height: context.isMobile ? 350 : 350,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          TabBar(
              isScrollable: true,
              controller: _appController,
              indicatorColor: Colors.orange,
              labelColor: Colors.orange,
              unselectedLabelColor: Colors.white,
              tabs: appList),
          Expanded(
            child: TabBarView(
              children: [
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
              ],
              controller: _appController,
            ),
          ),
        ],
      ),
    );
  }

  Widget itemsList2(String item) {
    return StreamBuilder(
      stream: itemsRef
          .document('Products')
          .collection(menuItems[selectedMenuItem])
          .snapshots(),
      builder: (context, snapshot) {
        return (snapshot.hasData && snapshot.data.documents.length > 0)
            ? GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: context.isMobile ? 1 : 3),
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot doc = snapshot.data.documents[index];
                  Item itemModel = Item.fromDocument(doc);
                  return Item2(item: itemModel);
                },
              )
            : Container(
                child: Text('No Data Available'),
              );
      },
    );
  }
}
