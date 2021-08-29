import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery4/Customs/Constants.dart';
import 'package:grocery4/Pages/Home/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery4/Pages/List_Detail/ListPage.dart';

class AddPage extends StatefulWidget {
  const AddPage({ Key? key }) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  var firestoreDB = FirebaseFirestore.instance.collection("Groceria").snapshots();  
  final _nameEditingController = new TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text('Groceria', style: TextStyle(color: TextColor),),
        centerTitle: true,
        backgroundColor: BackgroundColor,
        actions: <Widget>[
        Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: GestureDetector(
        onTap: () {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        child: Icon(
          Icons.home,
          size: 26.0,
              ),
            )
          ),
        ],
      ),
    body: 
      Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: ListTile(
                title: Text(
                  'Create !',
                textScaleFactor: 3,
                style: TextStyle(color: TextColor),
                textAlign: TextAlign.left,                
                ),
                subtitle: Text(
                  'List',
                  textScaleFactor: 1.5,
                  style: TextStyle(color: BackgroundColor),
                  textAlign: TextAlign.left,
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
                  'Enter name for your list and hit the save button. Then you will be navigated to the page where you can view and add items to your list !',
                textScaleFactor: 0.7,
                style: TextStyle(color: BackgroundColor),
                textAlign: TextAlign.left,
                ),
                selected: true,
                onTap: () {},
              ),
            ),          
          ),
        Container(
        padding: EdgeInsets.all(5),
        child:  Row(
        children: <Widget> [
        Expanded (
          child: SizedBox(
          height: 200.0,
          child: TextField(
            style: TextStyle(color: TextColor),
            autofocus: false,
            autocorrect: false,
            cursorColor: BackgroundColor,
            decoration: InputDecoration(
              labelText: "Enter List Name ",
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
            controller: _nameEditingController,
                        ),
                      ),
                    ),
                  ]
                ),
              ),                               
            ],
          ),             
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: BackgroundColor,
          foregroundColor: TextColor,
          icon: Icon(Icons.add),
          label: Text('Save'),
          onPressed: () async {
            if(_nameEditingController.text.isNotEmpty){
                FirebaseFirestore.instance.collection("Groceria").add({
                  "List Name":_nameEditingController.text,
                  "userId": _firebaseAuth.currentUser!.uid,
                })
                .then((response) {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListPage())
              );                  
            });
          }
        }          
      ),      
    );    
  }
}

