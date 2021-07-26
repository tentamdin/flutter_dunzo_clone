import 'package:flutter/material.dart';

class CircularCarousel extends StatelessWidget {
  final String label;
  final Function onTap;

  CircularCarousel({this.onTap, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 70,
            height: 70,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.indigoAccent,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
        ),
        Text(label),
      ],
    );
  }
}
