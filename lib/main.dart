import 'package:flutter/material.dart';
import 'package:instagram/constant/color.dart';
import 'package:instagram/screens/activity_screen.dart';
import 'package:instagram/screens/add_content_screen.dart';
import 'package:instagram/screens/login_screen.dart';
import 'package:instagram/screens/home_Screen.dart';
import 'package:instagram/screens/main_screen.dart';
import 'package:instagram/screens/search_screen.dart';
import 'package:instagram/screens/share_bottom_sheet.dart';
import 'package:instagram/screens/switch_account_screen.dart';
import 'package:instagram/screens/user_profile_screen.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          headline4: TextStyle(
              fontFamily: 'GB',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: pink,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greybackground,
      body: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/pattern1.png'),
            opacity: 0.1,
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80),
              child: Center(
                child: Image.asset('images/logo_splash.png'),
              ),
            ),
            Positioned(
              bottom: 10,
              child: Column(
                children: [
                  Text(
                    'from',
                    style: TextStyle(color: grey),
                  ),
                  Text(
                    'ExpertFlutter',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
