import 'package:flutter/material.dart';
import 'package:flutter_zomato/views/based_screen.dart';
import 'package:flutter_zomato/views/onboarding_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedIconTheme: IconThemeData(
            color: Colors.green.shade900,
            size: 30,
          ),
          selectedLabelStyle: TextStyle(
            color: Colors.greenAccent,
          ),
        ),
      ),
      // home: OnboardingPage(),
      home: BasedScreen(),
    );
  }
}
