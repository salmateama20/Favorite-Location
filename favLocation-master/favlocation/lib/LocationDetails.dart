import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favlocation/Screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

QueryDocumentSnapshot<Object> tmp;

class LocationDetails extends StatelessWidget {
  LocationDetails(QueryDocumentSnapshot<Object> tmp_doc) {
    tmp = tmp_doc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Details"),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(tmp.get('name').toString()),
            ),
          ),
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
              child: Image.network(tmp.get('imageUrl').toString()),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(tmp.get('description').toString()),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => launch(tmp.get('locationUrl').toString()),
        child: Icon(Icons.map_rounded),
      ),
    );
  }
}
