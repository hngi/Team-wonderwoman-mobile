import 'package:flutter/material.dart';
// Destination for different app screens
class Destination{
  const Destination(this.title, this.icon, this.color);
  final String title;
  final IconData icon;
  final Color color;
}

const List<Destination> allDestinations = <Destination>[
  Destination('Home', Icons.home, Color(0xff2d438d)),
  Destination('Favourites', Icons.star, Color(0xff72c3f9)),
  Destination('Profile', Icons.person_pin, Color(0xfff982c6))
];