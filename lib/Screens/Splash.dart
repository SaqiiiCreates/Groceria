import 'package:grocery3/Customs/Constants.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';
import 'Default.dart';

class Splash extends StatefulWidget {
  @override
  _Splash createState() => new _Splash();
}

class _Splash extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 14,
      navigateAfterSeconds: new ListPage(),
      backgroundColor: kPrimaryBackground,
      title: new Text('Groceria',textScaleFactor: 2,style: TextStyle(color: kPrimaryColor),),
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("Lorem Ipsum Dolor Sit Amet"),
      loaderColor: kPrimaryColor,
    );
  }
}