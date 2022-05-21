import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favlocation/Screen.dart';

Future<void> locationSetup(String name, String theme, String description,
    String imageUrl, String locationUrl) async {
  CollectionReference _location =
      FirebaseFirestore.instance.collection('Locations');
  _location.add({
    'name': name,
    'theme': theme,
    'description': description,
    'imageUrl': imageUrl,
    'locationUrl': locationUrl
  });
  return;
}
