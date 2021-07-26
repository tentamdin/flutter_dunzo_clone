import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  SearchBar({
    this.searchLabel,
    this.onTap,
  });

  final String searchLabel;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        filled: true,
        fillColor: Colors.white,
        hintText: searchLabel,
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 0.2,
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 0.2,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
