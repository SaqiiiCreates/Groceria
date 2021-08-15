import 'package:grocery3/helper/grocery_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class List extends StatelessWidget {
  const List({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
     future: Provider.of<GroceryProvider>(context,listen: false).getNotes(),
      builder: (context,snapshot)
      {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }else
          {
            return Container(
            );
          }

      },
    );
  }     
}