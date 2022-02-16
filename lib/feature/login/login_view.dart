import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login View"),
      ),
      body: Center(
        child: Container(
          child: Center(child: Text("LOGIN VIEW",style: Theme.of(context).textTheme.headline4,)),
          height: context.dynamicHeight(0.6),
          width: context.dynamicWidth(0.6),
          color: Theme.of(context).backgroundColor,
        ),
      ),
    );
  }
}
