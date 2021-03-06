import 'package:flutter/material.dart';
import 'package:flutter_dunzo_mvp/config/constants.dart';

class StoresPage extends StatelessWidget {
  const StoresPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: GridView.count(
          crossAxisCount: 4,
          padding: const EdgeInsets.all(4.0),
          children: productList
              .map(
                (data) => Container(
                  child: GridTile(
                    child: GridTileBar(
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
