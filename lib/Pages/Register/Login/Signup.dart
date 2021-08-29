import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:grocery4/Customs/Constants.dart';

import 'Signin.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: TextColor,
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Listener(
        onPointerDown: (PointerDownEvent event) => FocusManager.instance.primaryFocus?.unfocus(),
        child: Form(
          child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(1),
                child: Container(
                  child: ListTile(
                    title: Text(
                      'Register !',
                    textScaleFactor: 3,
                    style: TextStyle(color: BackgroundColor),
                    // textAlign: TextAlign.left,                
                    ),
                    subtitle: Text(
                      'To begin with groceria',
                      textScaleFactor: 1,
                      style: TextStyle(color: BackgroundColor),
                      // textAlign: TextAlign.left,
                    ),
                    selected: true,
                    onTap: () {},
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
              padding: EdgeInsets.all(5),
              child: TextFormField(                
                controller: _emailController,
                cursorColor: BackgroundColor,                
                style: TextStyle(fontSize: 22, color: Colors.black),
                decoration: InputDecoration(
                  labelText: "E-mail Address ",              
                  labelStyle: TextStyle(color: BackgroundColor),
                  enabledBorder: UnderlineInputBorder(      
                  borderSide: BorderSide(color: Colors.grey),   
                  ),  
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: BackgroundColor),
                  ),
                  border: UnderlineInputBorder(
                  borderSide: BorderSide(color: BackgroundColor),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
              padding: EdgeInsets.all(5),
              child: TextFormField(                
                controller: _passwordController,
                obscureText: true,
                style: TextStyle(fontSize: 22, color: Colors.black),
                cursorColor: BackgroundColor,                
                decoration: InputDecoration(
                  labelText: "Password ",              
                  labelStyle: TextStyle(color: BackgroundColor),
                  enabledBorder: UnderlineInputBorder(      
                  borderSide: BorderSide(color: Colors.grey),   
                  ),  
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: BackgroundColor),
                  ),
                  border: UnderlineInputBorder(
                  borderSide: BorderSide(color: BackgroundColor),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FlatButton(
                color: BackgroundColor,  
                child: Text(
                  "Register",
                  style: TextStyle(
                  color: TextColor,
                    ),
                  ),  
                onPressed: () async {
                try { 
                await _firebaseAuth.createUserWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text)
                } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  print('The password provided is too weak.');
                } else if (e.code == 'email-already-in-use') {
                  print('The account already exists for that email.');
                }
              }.
                then((response) {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignIn())
                        );                  
                      });              
                    }
                  ),
                SizedBox(
                height: 20,
                ),
                Container(                  
                    child: GestureDetector(
                    onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn())
                      );                  
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: BackgroundColor,
                        ),
                      textAlign: TextAlign.center,
                      ),
                    ),                                                    
                  ),
                ],
              ),
            ),
          ),
        )
      )
    );
  }
}