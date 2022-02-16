import 'package:flutter/material.dart';
import 'package:onboard_view/feature/onboard/view/onboard_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      title: 'Material App',
      home: OnboardView(),
    );
  }
}