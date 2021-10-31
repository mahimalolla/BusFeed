import 'package:busfeed/driver_start.dart';
import 'package:busfeed/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:busfeed/passenger_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashPage(),
    theme:ThemeData(
    fontFamily: 'Poppins',
    primarySwatch: Colors.lightGreen,
  ),
  ));
}

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bg.png'),
                    colorFilter: ColorFilter.mode(
                        Color(0xffFAFDF7).withOpacity(0.08), BlendMode.dstATop),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              decoration: BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(top: 100, bottom: 50)),
                  Center(
                      child: Image(
                    image: AssetImage('assets/people.png'),
                  )),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                      child: Text('busfeed',
                          style: TextStyle(
                              color: Color(0xff6E765F),
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Rezland'))),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 30, bottom: 30),
                    child: Text(
                      'Track buses in realtime. Plan your schedule the way you want, when you want.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Color(0xff8A9673),
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    width: 180,
                    height: 60,
                    decoration: ShapeDecoration(
                      shape: StadiumBorder(),
                      gradient: LinearGradient(
                          colors: [Color(0xffC2DC5F), Color(0xff80BF2D)]),
                    ),
                    child: MaterialButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: StadiumBorder(),
                      child: Text(
                        'continue',
                        style: TextStyle(
                            fontFamily: 'Rezland',
                            fontSize: 25,
                            color: Colors.white),
                      ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PassengerPage()));
                    },
                    ),
                  ),
                  Padding(
                  padding: EdgeInsets.only(top: 15),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login(title: 'Login')));
                      },
                      child: Text('or login as driver',
                          style: GoogleFonts.poppins(
                            fontSize: 15, color: Color(0xff8CC436))),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
    );
  }
}
