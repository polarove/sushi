import 'package:flutter/material.dart';

class Food {
  Image image;
  String rating;
  double price;
  String name;

  Food(
      {required this.image,
      required this.rating,
      required this.price,
      required this.name});
}
