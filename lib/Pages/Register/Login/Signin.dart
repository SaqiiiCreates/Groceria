import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery4/Customs/Constants.dart';
import 'package:grocery4/Pages/Home/HomePage.dart';
import 'package:grocery4/Pages/Register/Login/Signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: BackgroundColor,
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
                      'Sign In !',
                    textScaleFactor: 3,
                    style: TextStyle(color: TextColor),
                    // textAlign: TextAlign.left,                
                    ),
                    subtitle: Text(
                      'To begin with groceria',
                      textScaleFactor: 1,
                      style: TextStyle(color: TextColor),
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
                cursorColor: TextColor,
                style: TextStyle(fontSize: 22, color: TextColor),
              decoration: InputDecoration(
              labelText: "E-mail ",              
              labelStyle: TextStyle(color: TextColor),
              enabledBorder: UnderlineInputBorder(      
              borderSide: BorderSide(color: Colors.grey),   
              ),  
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: TextColor),
              ),
              border: UnderlineInputBorder(
              borderSide: BorderSide(color: TextColor),
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
                cursorColor: TextColor,
                obscureText: true,
                style: TextStyle(fontSize: 22, color: TextColor),
              decoration: InputDecoration(
              labelText: "Password ",              
              labelStyle: TextStyle(color: TextColor),
              enabledBorder: UnderlineInputBorder(      
              borderSide: BorderSide(color: Colors.grey),   
              ),  
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: TextColor),
              ),
              border: UnderlineInputBorder(
              borderSide: BorderSide(color: TextColor),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FlatButton(
                color: TextColor,  
                child: Text(
                  "Login",
                  style: TextStyle(
                  color: BackgroundColor,
                    ),
                  ),  
                onPressed: () async { 
                await _firebaseAuth
                  .signInWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text).
                then((response) {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage())
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
                      MaterialPageRoute(builder: (context) => SignUp())
                      );                  
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: TextColor,
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