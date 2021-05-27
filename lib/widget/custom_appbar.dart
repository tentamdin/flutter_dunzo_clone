import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    this.leadingWidget,
    this.titleWidget,
    this.actionWidget,
    this.elevation,
    this.backgroundColor,
  });

  final Widget leadingWidget;
  final Widget titleWidget;
  final List<Widget> actionWidget;
  final double elevation;
  final Color backgroundColor;

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      centerTitle: false,
      leading: leadingWidget,
      title: titleWidget,
      actions: actionWidget,
      backgroundColor: backgroundColor,
    );
  }
}
