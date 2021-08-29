import 'package:flutter/material.dart';
import 'package:grocery4/Customs/Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery4/Pages/Home/HomePage.dart';
import 'SubListPage.dart';

class ListPage extends StatelessWidget {  

  
  var firestoreDB = FirebaseFirestore.instance.collection("Groceria").snapshots();
  // var docId;   
  
  late final QuerySnapshot snapshot;
  late final int index;
   
  @override
  Widget build(BuildContext context) {       
    return Scaffold(
      appBar: AppBar(
        title: Text('Groceria', style: TextStyle(color: TextColor),),
        centerTitle: true,
        backgroundColor: BackgroundColor,
      ),
    body: StreamBuilder(
      stream: firestoreDB,
      builder: (context, AsyncSnapshot snapshot){
        if(!snapshot.hasData) return Center(child: CircularProgressIndicator());
        if(snapshot.data!.docs.length > 0) {                        
        return ListView.builder(        
          scrollDirection: Axis.vertical,          
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, int index){
          String id = snapshot.data.docs[index].id;                    
          return Container(
          width: 30,
          height: 40,
          margin: EdgeInsets.all(3),
          decoration: BoxDecoration(
            border: Border.all(
            color: BackgroundColor,
            ),
          borderRadius: BorderRadius.circular(10.0),
          ),                                  
          child: ListTile(                  
              tileColor: TextColor,
              dense: true,            
              title: Text(snapshot.data?.docs[index]['List Name'], style: TextStyle(color: BackgroundColor)),
              leading: GestureDetector(
              child: Icon(
                Icons.delete, 
                color: BackgroundColor,
              ),
              onTap: () {                
              FirebaseFirestore.instance.collection("Groceria").doc(id).delete();
                }
              ),
              onTap: () async {
                Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => SubListPage(id),
                      ),
                    );                                                                                                                                            
                  }
                ),
              );
            });        
          } else {
            return Container(
               margin: EdgeInsets.all(10),
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Center(
                child: Column(
                children: <Widget>[
                Container(
                child: ListTile(
                  title: Text(
                    ':( ',
                  textScaleFactor: 7,
                  style: TextStyle(color: TextColor),
                  textAlign: TextAlign.center,                
                ),
              ),
            ),
            Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: ListTile(
            title: Text(
            "Oh looks like you don't have lists. Go to Home and use Add page to Add List !",
            textScaleFactor: 1,
            style: TextStyle(color: BackgroundColor),
            textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    floatingActionButton: FloatingActionButton.extended(
          backgroundColor: BackgroundColor,
          foregroundColor: TextColor,
          icon: Icon(Icons.home),
          label: Text('Home'),
          onPressed: () {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
      ),      
    );
  }
}