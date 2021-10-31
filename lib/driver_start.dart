import 'dart:async';

import 'package:busfeed/driver_driving.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:busfeed/main.dart';

class DriverHome extends StatefulWidget {
  const DriverHome({Key? key}) : super(key: key);

  @override
  _DriverHomeState createState() => _DriverHomeState();
}

class _DriverHomeState extends State<DriverHome> {
  var nowTime = DateTime.now();
  String _timeString = "";

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
            Padding(
              padding: EdgeInsets.only(top: 80, bottom: 100),
              child: Text(
                _timeString.toString(),
                style: TextStyle(
                    color: Colors.white, fontSize: 100, fontFamily: 'Poppins'),
              ),
            ),
            GestureDetector(
              child: playButton,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DriverWhileDriving()));
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Start Riding',
              style: TextStyle(color: Color(0xffA0C824)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>SplashPage()));
                  },
                  child: Text(
                    'Logout',
                    style: GoogleFonts.poppins(
                        fontSize: 15, color: Color(0xff656565)),
                  )),
            )
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
