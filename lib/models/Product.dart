import 'package:flutter/material.dart';

class Product {
  final String title, description, location_name, added_user_name, image;
  final int price, id;
  final Color color;
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.location_name,
    required this.added_user_name,
    required this.image,
    required this.price,
    required this.color,
  });
}
