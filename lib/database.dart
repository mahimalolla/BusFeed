import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

class Database {
  final CollectionReference _mainCollection =
      FirebaseFirestore.instance.collection('location');
  String busNo, phNo;
  Database({required this.busNo, required this.phNo});

  Future<void> updateItem({required Position location}) async {
    Map<String, dynamic> data = <String, dynamic>{
      "latitude": location.latitude,
      "longitude": location.longitude,
      "busNo": busNo
    };

    await _mainCollection.doc(phNo).set(data);
  }

  Future<void> deleteItem() async {
    print("HIII THIS WAS CALLED !!!!!");
    await _mainCollection.doc(phNo).delete();
  }
}
