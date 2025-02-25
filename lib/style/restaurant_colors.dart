import 'package:flutter/material.dart';

enum RestaurantColors {
  blue('Blue', Colors.lightBlue),
  blueaccent('blueAccent', Colors.blueAccent);

  final dynamic name;
  final dynamic color;

  const RestaurantColors(this.name, this.color);
}
