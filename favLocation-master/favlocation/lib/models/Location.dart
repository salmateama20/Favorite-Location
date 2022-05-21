import 'package:flutter/material.dart';

class Location {
  int id;
  String name;
  String theme;
  String description;
  String imageUrl;
  String locationUrl;

  Location(
      {int id,
      String name,
      String theme,
      String description,
      String imageUrl,
      String locationUrl}) {
    this.id = id;
    this.name = name;
    this.theme = theme;
    this.description = description;
    this.imageUrl = imageUrl;
    this.locationUrl = locationUrl;
  }

  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
