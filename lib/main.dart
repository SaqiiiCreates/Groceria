import 'package:flutter/material.dart';
import 'package:grocery4/Pages/Register/Login/Signin.dart';
import 'Customs/Constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:splashscreen/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {       
    return MaterialApp(
      home: SplashScreen(
      seconds: 14,
      navigateAfterSeconds: new SignIn(),
      backgroundColor: BackgroundColor,
      title: new Text('Groceria',textScaleFactor: 2,style: TextStyle(color: TextColor),),
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("Lorem Ipsum Dolor Sit Amet"),
      loaderColor: TextColor,
      )     
    );
  }
}