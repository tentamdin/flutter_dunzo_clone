import 'package:flutter/material.dart';
import 'package:flutter_dunzo_mvp/views/cash/cash_page.dart';
import 'package:flutter_dunzo_mvp/views/courier/courier_page.dart';
import 'package:flutter_dunzo_mvp/views/daily/daily_page.dart';
import 'package:flutter_dunzo_mvp/views/stores/stores_page.dart';
import 'package:get/get.dart';

class BasedScreen extends StatefulWidget {
  @override
  _BasedScreenState createState() => _BasedScreenState();
}

class _BasedScreenState extends State<BasedScreen> {
  int _currentIndex = 0;
  final List<Widget> _screen = [
    DailyPage(),
    StoresPage(),
    CourierPage(),
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
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey.shade700,
        selectedItemColor: Colors.greenAccent.shade700,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.inventory,
            ),
            label: "DAILY",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.storefront_outlined,
            ),
            label: 'STORES',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Get.to(() => CourierPage());
                },
                child: Icon(Icons.shopping_bag_outlined)),
            label: 'COURIER',
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
