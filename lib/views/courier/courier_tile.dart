import 'package:flutter/material.dart';
import 'package:flutter_dunzo_mvp/config/constants.dart';

class CourierTile extends StatelessWidget {
  final String title;
  final String hintText;
  final IconData leadingIconData;
  final IconData surffixIconData;

  CourierTile(
      {this.title, this.hintText, this.leadingIconData, this.surffixIconData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        vertical: 8,
      ),
      onTap: () {},
      leading: Icon(
        leadingIconData,
        color: Colors.greenAccent,
      ),
      horizontalTitleGap: 0,
      title: Text(
        title,
        style: KProductBoldStyle.copyWith(
          fontSize: 14,
        ),
      ),
      subtitle: TextField(
        enableInteractiveSelection: true,
        decoration: InputDecoration(
          suffixIcon: Icon(surffixIconData),
          hintText: hintText,
          hintStyle: KGreyTextStyle.copyWith(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
