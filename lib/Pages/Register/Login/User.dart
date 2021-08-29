import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User extends StatefulWidget {
  const User({ Key? key }) : super(key: key);

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        printUser(),        
      ),
    );
  }
  printUser () {
    if (currentUser != null) {
    print(currentUser!.uid);
    }
  }
}