import 'package:flutter/material.dart';
import 'package:flutter_zomato/views/goOut/goout_page_home.dart';
import 'package:flutter_zomato/views/nutrition_page_home.dart';
import 'package:flutter_zomato/views/order/order_page_home.dart';
import 'package:flutter_zomato/views/pro_page_home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _screen = [
    OrderPageHome(),
    GoOutPageHome(),
    ProPageHome(),
    NutritionPageHome(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey.shade700,
        selectedItemColor: Colors.red,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedLabelStyle: TextStyle(
          color: Colors.grey,
        ),
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Order",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Go Out',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Pro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.art_track),
            label: 'Nutrition',
          ),
        ],
      ),
    );
  }
}
