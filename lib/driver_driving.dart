import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DriverWhileDriving extends StatefulWidget {
  const DriverWhileDriving({Key? key}) : super(key: key);

  @override
  _DriverWhileDrivingState createState() => _DriverWhileDrivingState();
}

class _DriverWhileDrivingState extends State<DriverWhileDriving> {
  var nowTime = DateTime.now();
  String _timeString = "";
  String _locationString = 'Searching...';

  var playButton = Image(
    image: AssetImage('assets/play_button.png'),
    width: 150,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
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
              '+91 12345 12345',
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
            Padding(
              padding: EdgeInsets.only(top: 80, bottom: 100),
              child: Text(
                _timeString.toString(),
                style: TextStyle(
                    color: Colors.white, fontSize: 50, fontFamily: 'Poppins'),
              ),
            ),
          ],
        ),
      ),
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
