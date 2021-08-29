import 'dart:io';
import 'package:flutter/material.dart';
import 'package:grocery4/Pages/Add/AddPage.dart';
import '../List_Detail/ListPage.dart';
import 'package:grocery4/Customs/Constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Groceria', style: TextStyle(color: TextColor),),
        centerTitle: true,
        backgroundColor: BackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              child: ListTile(
                title: Text(
                  'Welcome !',
                textScaleFactor: 2.5,
                style: TextStyle(color: TextColor),
                textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  'To Groceria',
                  textScaleFactor: 1,
                  style: TextStyle(color: BackgroundColor),
                  textAlign: TextAlign.center,
                ),
                selected: true,
                onTap: () {},
              ),
            ),
          ),
        Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: ListTile(
                title: Text(
                  'List button (first) is to navigate to List page where you can view your Lists. Add Button (Second) will help you add a list. Use last button to close the app !',
                textScaleFactor: 0.7,
                style: TextStyle(color: BackgroundColor),
                textAlign: TextAlign.left,
                ),                
                selected: true,
                onTap: () {},
              ),
            ),
          ),
      Ink(      
       decoration: const ShapeDecoration(
         color: BackgroundColor,
         shape: CircleBorder(),
       ),
       child: IconButton(
         onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListPage()),
            );
          },
         icon: Icon(
            Icons.list_alt_outlined,
            color: TextColor,
          ),
          iconSize: 30.0,
            ),
          ),
      Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),          
        child: Ink(        
        decoration: const ShapeDecoration(          
         color: BackgroundColor,
         shape: CircleBorder(),
       ),
       child: IconButton(        
         onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddPage()),
            );
          },
         icon: Icon(
            Icons.add,            
            color: TextColor,
          ),
          iconSize: 30.0,
              ),
            ),
          ),
        Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),          
        child: Ink(        
        decoration: const ShapeDecoration(          
         color: BackgroundColor,
         shape: CircleBorder(),
       ),
       child: IconButton(        
         onPressed: ()=> exit(0),          
         icon: Icon(
            Icons.close,           
            color: TextColor,
          ),
          iconSize: 30.0,
                ),
              ),
             // For now only these two buttons added, Will add get store location, and edit button and drawer and more in version 2 !
            ),                         
          ],
        )
      )
    );
  }
}