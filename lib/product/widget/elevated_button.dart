import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class PageElevatedButton extends StatefulWidget {
  final String elevatedButtonText;
  final onPressed;
  final Color color;
  const PageElevatedButton({Key? key, required this.elevatedButtonText, required this.onPressed, required this.color}) : super(key: key);

  @override
  _PageElevatedButtonState createState() => _PageElevatedButtonState();
}

class _PageElevatedButtonState extends State<PageElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.dynamicHeight(0.05),
        child: ElevatedButton(
            onPressed: widget.onPressed,
            child: Text(widget.elevatedButtonText),
            style: ElevatedButton.styleFrom(
              primary: widget.color,
              minimumSize: Size(context.dynamicWidth(0.3), context.dynamicWidth(0.3)),
              side: BorderSide(color: context.appTheme.bottomAppBarColor),
            )));
  }
}
