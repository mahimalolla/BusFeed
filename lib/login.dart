import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sign_button/sign_button.dart';
import 'package:busfeed/driver_start.dart';
import 'package:busfeed/globals.dart' as globals;


class Login extends StatefulWidget {
  Login({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  var _phoneController = TextEditingController();
  var _busNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/splash/splash-icon.png',
                width: MediaQuery.of(context).size.width * 2 / 3 - 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 5 * 2,
                child: TextField(
                  controller: _busNoController,
                  maxLength: 4,
                  showCursor: false,
                  cursorWidth: 1,
                  cursorColor: Colors.lightGreenAccent,
                  enableSuggestions: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 35),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3 * 2,
                child: TextField(
                  controller: _phoneController,
                  maxLength: 10,
                  showCursor: false,
                  keyboardType: TextInputType.phone,
                  cursorWidth: 1,
                  cursorColor: Colors.lightGreenAccent,
                  enableSuggestions: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 35),
                ),
              ),
              TextButton(
                onPressed: () {
                  globals.phoneNumber = _phoneController.text.toString();
                  debugPrint('Phone number: ${globals.phoneNumber}');
                  if(globals.phoneNumber=='9876543210'){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DriverHome()));
                    globals.busNo = _busNoController.text.toString();
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Center(
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(color: Color(0xff8CC436),fontSize: 30),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 6 - 94,
              ),
              Text('or'),
              SignInButton(
                  buttonSize: ButtonSize.medium,
                  elevation: 0,
                  btnText: '\t\t\tLogin with Google',
                  buttonType: ButtonType.google,
                  onPressed: () {
                    print('click');
                  }),
              Lottie.asset('assets/lottie/login_bus.json')
            ],
          ),
        ),
      ),
    );
  }
}
