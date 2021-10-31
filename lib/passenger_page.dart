import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'location.dart';

class PassengerPage extends StatefulWidget {
  @override
  State<PassengerPage> createState() => PassengerPageState();
}

class PassengerPageState extends State<PassengerPage> {
  Completer<GoogleMapController> _controller = Completer();

  final _busStream =
      FirebaseFirestore.instance.collection('location').snapshots();

  static final CameraPosition _mapPos = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    determinePosition().then((pos) =>
        _goToCoordinates(latitude: pos.latitude, longitude: pos.longitude));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(children: [
        StreamBuilder<QuerySnapshot>(
            stream: _busStream,
            builder: (context, snapshot) {
              Set<Marker> _markers = {};

              if (!snapshot.hasError &&
                  snapshot.connectionState != ConnectionState.waiting) {
                snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  _markers.add(Marker(
                      markerId: data["busNo"],
                      position: LatLng(data["latitude"], data["longitude"])));
                });
              }

              return GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _mapPos,
                markers: _markers,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              );
            }),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0a000000),
                      offset: Offset(0, -1),
                      blurRadius: 2,
                      spreadRadius: 2,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bus 104B",
                    style: TextStyle(
                        color: Color(0xff6E765F),
                        fontWeight: FontWeight.w700,
                        fontSize: 28),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Heading West across 100ft road and Ayyapan temple",
                    style: TextStyle(
                      color: Color(0xff8A9673),
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Updated just now",
                    style: TextStyle(
                        color: Color(0xffD3D3D3),
                        fontSize: 18,
                        fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )
          ],
        ),
        SafeArea(
            child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0a000000),
                    offset: Offset(0, 2),
                    blurRadius: 2,
                    spreadRadius: 2,
                  )
                ]),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search for a location.."),
            ),
          ),
        ))
      ]),
    );
  }

  Future<void> _goToCoordinates(
      {required double latitude, required double longitude}) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(latitude, longitude), zoom: 14)));
  }
}
