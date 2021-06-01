import 'package:flutter/material.dart';
import 'package:flutter_dunzo_mvp/views/home/home_page.dart';
import 'package:flutter_dunzo_mvp/views/cash/cash_page.dart';
import 'package:flutter_dunzo_mvp/views/order/order_page.dart';
import 'package:flutter_dunzo_mvp/views/search/search_page.dart';

class BasedScreen extends StatefulWidget {
  @override
  _BasedScreenState createState() => _BasedScreenState();
}

class _BasedScreenState extends State<BasedScreen> {
  int _currentIndex = 0;
  final List<Widget> _screen = [
    HomePage(),
    SearchPage(),
    OrderPage(),
    CashPage(),
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
        selectedItemColor: Colors.greenAccent.shade700,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'SEARCH',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'ORDER',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.art_track),
            label: 'DUNZO CASH',
          ),
        ],
      ),
    );
  }
}
