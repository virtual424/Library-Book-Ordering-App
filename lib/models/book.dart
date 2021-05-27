import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BookModel {
  final String id;
  final String title;
  final String authorName;
  final String publisher;
  final String image;
  final String bookDescription;
  final bool isIssued;
  final Color backGroundColor;
  final int qunatity;

   BookModel({
    @required this.id,
    @required this.title,
    @required this.publisher,
    @required this.authorName,
    @required this.image,
    @required this.isIssued,
    @required this.bookDescription,
    @required this.backGroundColor,
    @required this.qunatity
  });
}
