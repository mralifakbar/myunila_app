import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myunila_app/screens/home.dart';
import 'package:myunila_app/screens/home_screen.dart';
import 'package:myunila_app/screens/login.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String name = "";

  getName() async {
    final prefs = await SharedPreferences.getInstance();
    print(prefs.getString("name"));
    if (prefs.containsKey("name")) {
      return prefs.getString("name") ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      title: 'MyUnila',
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0.0,
        ),
        body: AnimatedSplashScreen(
          duration: 3000,
          splash: Image.asset("assets/logo_myunila.png"),
          nextScreen: (getName() == "") ? LoginScreen() : Home(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
