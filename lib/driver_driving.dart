import 'dart:async';

import 'package:busfeed/driver_start.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:busfeed/globals.dart' as globals;
import 'package:busfeed/database.dart';

class DriverWhileDriving extends StatefulWidget {
  DriverWhileDriving({Key? key}) : super(key: key);

  @override
  _DriverWhileDrivingState createState() => _DriverWhileDrivingState();
}


class _DriverWhileDrivingState extends State<DriverWhileDriving> {
  var nowTime = DateTime.now();
  String _timeString = "";
  String _locationString = 'Searching...';

  Position ?_currentPosition;

  var playButton = Image(
    image: AssetImage('assets/play_button.png'),
    width: 150,
  );

  var pauseButton = Image(image: AssetImage('assets/pause_button.png'),width: 120,);
  var resumeButton = Image(
    image: AssetImage('assets/play_button.png'),
    width: 120,
  );

  var isPlay = false;

  _getCurrentLocation() async {
    Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _locationString = position.latitude.toString()+position.longitude.toString();
      });
      Database.updateItem(location: position);
    }).catchError((e) {
      print(e);
    });
  }

  _pauseOrStop() async{
    Database.deleteItem();
  }


  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    Timer.periodic(Duration(seconds:1),(Timer t) => _getCurrentLocation());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                width: 95,
                child: Column(
                  children: [
                    Text(
                      'busfeed',
                      style: TextStyle(
                          color: Color(0xff3F413D),
                          fontSize: 30,
                          fontFamily: 'Rezland'),
                    ),
                    Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          'DRIVER',
                          style: TextStyle(color: Color(0xffA0C824)),
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Text(
                'Welcome',
                style: GoogleFonts.poppins(fontSize: 15, color: Colors.white),
              ),
            ),
            Text(
              globals.phoneNumber,
              style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 100, right: 200),
                  child: Text(
                    'Current location',
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, right: _locationString.length.toInt()*14.5),
                  child: Container(
                      child: Text(
                    _locationString,
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ],
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Database.deleteItem();
                        Navigator.push(context,MaterialPageRoute(builder: (context) => DriverHome()));
                      },
                      child: pauseButton
                    ),
                    Text('Pause',style: GoogleFonts.poppins(color: Color(0xffB4D655),fontSize: 12),)
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Database.deleteItem();

                      },
                      child: Image(image: AssetImage('assets/stop_button.png'),width: 120,),
                    ),
                    Text('Stop ride',style: GoogleFonts.poppins(color: Color(0xffB4D655),fontSize: 12),)
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 80, bottom: 40),
              child: Text(
                _timeString.toString(),
                style: TextStyle(
                    color: Colors.white, fontSize: 50, fontFamily: 'Poppins'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},backgroundColor: Colors.red,child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomPaint(
          painter: OpenPainter(),
        ),
      ),),
    );
  }

  void _getTime() {
    final String formattedDateTime =
        DateFormat('kk:mm').format(DateTime.now()).toString();
    setState(() {
      _timeString = formattedDateTime;
    });
  }
}

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke;
    //a circle
    canvas.drawCircle(Offset(0, 0), 20,paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
