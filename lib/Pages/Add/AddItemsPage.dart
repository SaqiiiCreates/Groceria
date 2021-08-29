import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery4/Customs/Constants.dart';

class AddItemsPage extends StatefulWidget {
  final String newValue;
  const AddItemsPage({ Key? key, required this.newValue }) : super(key: key);  


  @override
  _AddItemsPage createState() => _AddItemsPage(newValue);
}

class _AddItemsPage extends State<AddItemsPage> {

  var _queryCat;
  final String newValue;
  _AddItemsPage(this.newValue);

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection('Items list').snapshots(),
    builder: (context, snapshot){
      if (!snapshot.hasData) return const Center(
        child: const CupertinoActivityIndicator(),
      );
      var length = snapshot.data!.docs.length;
      DocumentSnapshot ds = snapshot.data!.docs[length - 1];
      _queryCat = snapshot.data!.docs;
      var _category;
          
      check () {        
          setState(() {
          _category = newValue;
          print(_category);
        });
      };
      return new Container(
        padding: EdgeInsets.only(bottom: 16.0),
        width: 0.9,
        child: new Row(
          children: <Widget>[
            new Expanded(
                flex: 2,
                child: new Container(
                  padding: EdgeInsets.fromLTRB(12.0,10.0,10.0,10.0),
                  child: new Text("Category"),
                )
            ),            
            new Expanded(
              flex: 4,
              child:new InputDecorator(
                decoration: const InputDecoration(
                  //labelText: 'Activity',
                  hintText: 'Choose an category',
                  hintStyle: TextStyle(
                    color: TextColor,
                    fontSize: 16.0,
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.normal,
                  ),
                ),                
                isEmpty: _category == null,
                child: new DropdownButton(
                  value: _category,
                  isDense: true,
                  onChanged: check(),
                  items: snapshot.data!.docs.map((DocumentSnapshot document) {
                    return new DropdownMenuItem<String>(
                        value: document.get('Name'),
                        child: new Container(
                          decoration: new BoxDecoration(
                              color: TextColor,
                              borderRadius: new BorderRadius.circular(5.0)
                          ),
                          height: 100.0,
                          padding: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0.0),
                          //color: primaryColor,
                          child: new Text(document.get('Name')),
                        )
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}