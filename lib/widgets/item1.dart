import 'package:flutter/material.dart';
import 'package:swadeshiandolan/models/item.dart';

class Item1 extends StatelessWidget {
  final Item item;

  Item1({this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Stack(
        children: <Widget>[
          /// Item card
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox.fromSize(
                size: Size.fromHeight(182.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    /// Item description inside a material
                    Container(
                      margin: EdgeInsets.only(top: 24.0),
                      child: Material(
                        elevation: 14.0,
                        borderRadius: BorderRadius.circular(12.0),
                        shadowColor: Color(0x802196F3),
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                /// Title and rating
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(item.name,
                                        style: TextStyle(
                                            color: Colors.blueAccent)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(item.rating,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 34.0)),
                                        Icon(Icons.star,
                                            color: Colors.black, size: 24.0),
                                      ],
                                    ),
                                  ],
                                ),

                                /// Infos
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      child: Text(item.usersNo,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                    Text('Users',
                                        style: TextStyle(color: Colors.black)),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      child: Material(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: Colors.green,
                                        child: Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: Text(item.type,
                                              style: TextStyle(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    /// Item image
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(54.0),
                          child: Material(
                              elevation: 20.0,
                              shadowColor: Color(0x802196F3),
                              shape: CircleBorder(),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(item.imageUrl),
                              )),
                        ),
                      ),
                    ),
                  ],
                )),
          ),

          /// Review
          Padding(
            padding: EdgeInsets.only(top: 160.0, left: 32.0),
            child: Material(
              elevation: 12.0,
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFF84fab0), Color(0xFF8fd3f4)],
                        end: Alignment.topLeft,
                        begin: Alignment.bottomRight)),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 4.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.purple,
                      child: Text(item.reviewer.substring(0, 1)),
                    ),
                    title: Text(item.reviewer, style: TextStyle()),
                    subtitle: Text(item.review,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle()),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
