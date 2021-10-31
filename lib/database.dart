import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('location');

class Database {

  static Future<void> init({var busNo}) async {
    DocumentReference documentReferencer =
        _mainCollection.doc('driver-1');

    Map<String, dynamic> data = <String, dynamic>{
      "latitude": 0,
      "longitude": 0,
      "busNo":busNo
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Location uploaded"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    required Position? location,var busNo
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc('driver-1');

    Map<String, dynamic> data = <String, dynamic>{
      "latitude": location!.latitude,
      "longitude": location.longitude,
      "busNo":busNo
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Location updated"))
        .catchError((e) => print(e));
  }

  static Future<void> deleteItem() async {
    DocumentReference documentReferencer =
    _mainCollection.doc('driver-1');

    await documentReferencer
        .delete()
        .whenComplete(() => print('Document deleted'))
        .catchError((e) => print(e));
  }
}
