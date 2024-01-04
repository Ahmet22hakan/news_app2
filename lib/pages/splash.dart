import 'package:flutter/material.dart';
import 'package:news_app/config/config.dart';

import '../utils/next_screen.dart';
import 'home.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  afterSplash() {
    Future.delayed(Duration(milliseconds: 1500)).then((value) {
      gotoHomePage();
    });
  }

  gotoHomePage() {
    nextScreenReplace(context, HomePage());
  }

  @override
  void initState() {
    afterSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Image(
            image: AssetImage(Config().splashIcon),
            height: 120,
            width: 120,
            fit: BoxFit.contain,
          ),
        ));
  }
}
