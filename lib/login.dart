import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sign_button/sign_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Busfeed',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                width: MediaQuery.of(context).size.width / 3 * 2,
                child: TextField(
                  maxLength: 10,
                  showCursor: false,
                  keyboardType: TextInputType.phone,
                  cursorWidth: 1,
                  enableSuggestions: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 35),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 30),
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
