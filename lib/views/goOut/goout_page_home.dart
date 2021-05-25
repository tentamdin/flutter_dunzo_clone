import 'package:flutter/material.dart';
import 'package:flutter_zomato/config/constants.dart';

class GoOutPageHome extends StatelessWidget {
  const GoOutPageHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: GridView.count(
          crossAxisCount: 4,
          padding: const EdgeInsets.all(4.0),
          children: foodList
              .map(
                (data) => Container(
                  child: GridTile(
                    child: GridTileBar(
                      backgroundColor: Colors.orange,
                      title: CircleAvatar(
                        child: Text(
                          data.substring(0, 1).toUpperCase(),
                        ),
                        radius: 50,
                      ),
                    ),
                  ),
                ),
              )
              .toList()),
    ));
  }
}
