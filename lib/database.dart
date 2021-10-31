import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('location');

class Database {
  static String? userUid;

  static Future<void> addItem({required Position? location}) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('location').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "latitude": location!.latitude,
      "longitude": location!.longitude,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Location uploaded"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    required Position? location,
  }) async {
    var docId = 'arbI5a2DFOU5Kg1iLN0o';
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('location').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "latitude": location!.latitude,
      "longitude": location.longitude,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Location updated"))
        .catchError((e) => print(e));
  }
}
