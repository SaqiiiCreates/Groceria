import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery4/Customs/Constants.dart';
import 'package:grocery4/Pages/Add/AddItemsPage.dart';
import 'package:grocery4/Pages/Home/HomePage.dart';

// ignore: must_be_immutable
class SubListPage extends StatelessWidget {

  final String id;
  SubListPage(this.id);

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
      body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Groceria').doc(id).collection('Items').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {              
              if (snapshot.hasError) return Text('Error: ${snapshot.error}');
              if (!snapshot.hasData) return Container(
                child: Center(
                  child: CircularProgressIndicator()
                ),
              );
              if(snapshot.data!.docs.length > 0) {
          return ListView.builder(            
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, int index) {
          final String id2 = snapshot.data!.docs[index].id;
          return Container(
          width: 30,
          height: 60,
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
              title: Text('Item Name:   ' + snapshot.data?.docs[index]['Name'], style: TextStyle(color: BackgroundColor)),
              subtitle: Text('Item Quantity:    ' + snapshot.data?.docs[index]['Quantity'], style: TextStyle(color: BackgroundColor)),             
              leading: GestureDetector(
                child: Icon(
                  Icons.delete, 
                  color: BackgroundColor,
                ),
                onTap: () {
                FirebaseFirestore.instance.collection("Groceria").doc(id).collection('Items').doc(id2).delete();
                    },
                  ),
                ),
              );
            });
          }
        else {
          return Container(
               margin: EdgeInsets.all(10),
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Center(
                child: Column(
                children: <Widget>[
                Container(
                child: ListTile(
                  title: Text(
                    'Add Items ',
                  textScaleFactor: 4,
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
            "Oh looks like you don't have any items in your list. Click Add button to add now !",
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
      icon: Icon(Icons.add),
        label: Text('Items'),
        onPressed: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => AddItemsPage(newValue: '',))
        // );
        showAlertDialog(context);                
      }),
    );
  }


  final _nameEditingController = new TextEditingController(); 
  final _quantityEditingController = new TextEditingController();

  final _key = GlobalKey<FormState>();

  var snapshot;

showAlertDialog(BuildContext context) {
  
  // Create button  
  Widget okButton = FlatButton(
    color: TextColor,  
    child: Text(
      "Save",
      style: TextStyle(
      color: BackgroundColor,
        ),
      ),  
    onPressed: () {  
      if(_nameEditingController.text.isNotEmpty){
      FirebaseFirestore.instance.collection("Groceria").doc(id).collection('Items').add({
      "Name":_nameEditingController.text,
      "Quantity":_quantityEditingController.text,
      })
      .then((response) {
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SubListPage(id))
          );                  
        });  
      }
    },  
  );  
  
  // Create AlertDialog  
  AlertDialog alert = AlertDialog(
    backgroundColor: BackgroundColor,
    insetPadding: EdgeInsets.all(10),  
    title: Text(
      "Add Items",
      style: TextStyle(
        color: TextColor,
        ),
      ),  
    content:
    Form(
    key: _key,
    child: Column(
    children:<Widget>[                       
      Container(      
        child:  Row(
        children: <Widget>[
          Expanded (          
          child: TextField(
            style: TextStyle(color: TextColor),
            autofocus: false,
            autocorrect: false,
            cursorColor: BackgroundColor,
            decoration: InputDecoration(
              labelText: "Enter Item Name ",
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
            controller: _nameEditingController,
                      ),
                    ),
                  ]
                ),
              ),
            Container(
              child:  Row(              
              children: <Widget>[
                Expanded (
                child: SizedBox(
                height: 100.0,
                child: TextField(
                  style: TextStyle(color: TextColor),
                  autofocus: false,
                  autocorrect: false,
                  cursorColor: BackgroundColor,
                  decoration: InputDecoration(
                    labelText: "Enter Item Quantity ",
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
            controller: _quantityEditingController,
                          ),
                        ),
                      ),
                    ]                    
                  ),
                ),          
              ],
            ),
          ),                                  
    actions: [  
      okButton,  
    ],    
  );
  // show the dialog  
  showDialog(  
    context: context,  
    builder: (BuildContext context) {  
      return alert;  
    },  
  );  
  }    
}

