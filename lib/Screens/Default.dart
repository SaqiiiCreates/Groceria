import 'package:flutter/material.dart';
import 'package:grocery3/Customs/Constants.dart';

class ListPage extends StatefulWidget {
  const ListPage({ Key? key }) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: kPrimaryColor,
          title:
              Text('Welcome', textAlign: TextAlign.center),
          actions: <Widget>[          
          ],
        ),        
      // body: FutureBuilder(
      //   future: getList(),
      //   builder: (context, listData) {
      //     switch(listData.connectionState) {
      //       case ConnectionState.waiting:
      //       {
      //         return Center(child: CircularProgressIndicator());
      //       }
      //       case ConnectionState.done:
      //       {
      //         if (listData.data == Null) {
      //           return Center(
      //             child: Text("You don't have any Grocery Lists Yet, create one !")
      //           );              
      //         }
      //       else {
      //         return Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: ListView.builder(
      //             itemCount: (listData.data as dynamic).length,
      //             itemBuilder: (context, index) {
      //               String title = (listData.data as dynamic)[index]['title'];
      //               String itemName = (listData.data as dynamic)[index]['itemName'];
      //               String itemQuantity = (listData.data as dynamic).length[index]['itemQuantity'];
      //               int id = (listData.data as dynamic)[index]['id'];
      //               return Card(child: ListTile(
      //                 title: Text(itemName),
      //                 subtitle: Text(itemQuantity), 
      //                   ),
      //                 );
      //               },
      //             ),              
      //           );
      //         }
      //       }
      //       case ConnectionState.none:
      //         // TODO: Handle this case.
      //         break;
      //       case ConnectionState.active:
      //         // TODO: Handle this case.
      //         break;
      //     }
      //     return Card(child: Text("Hello"));        
      //   }
      // ),
    );
  }
}