import 'package:flutter/material.dart';
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
          primaryColor: Colors.white, scaffoldBackgroundColor: Colors.white
          // scaffoldBackgroundColor: Colors.white,
          ),
      home: OnboardingPage(),
    );
  }
}
