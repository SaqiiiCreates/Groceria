import 'package:flutter/material.dart';
import 'package:grocery3/helper/grocery_provider.dart';
import 'package:grocery3/Screens/list.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
import 'package:grocery3/Screens/list_edit.dart';
import 'package:grocery3/Screens/list_view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GroceryProvider(),
      child: MaterialApp(
        title: "Groceria",
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => List(),
        // ListView.route: (context) => ListView(),
        ListEdit.route: (context) => ListEdit(),
        },
      ),
    );
  }
}