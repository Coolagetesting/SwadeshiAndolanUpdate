import 'package:cloud_firestore/cloud_firestore.dart';

class Item{
  final String name, rating, usersNo, type, imageUrl, reviewer, review;

  Item({this.name, this.rating, this.usersNo, this.type, this.imageUrl, this.reviewer, this.review});

  factory Item.fromDocument(DocumentSnapshot doc){
    return Item(
      name: doc['name'],
      rating: doc['rating'],
      usersNo : doc['usersNo'],
      type : doc['type'],
      imageUrl: doc['imageUrl'],
      review: doc['review'],
      reviewer: doc['reviewer'],
    );
  }
}