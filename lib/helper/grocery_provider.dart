import 'package:flutter/material.dart';
import 'package:grocery3/helper/database_helper.dart';
import '../Models/grocery.dart';

class GroceryProvider with ChangeNotifier {
  List _items = [];

  List get items {
    return [..._items];
  }

  Future getNotes() async {
    final groceryList = await DatabaseHelper.getGroceryfromDB();

    _items = groceryList
        .map(
          (item) =>
          Grocery(
              item['id'], item['name'], item['quantity'], item['imagePath']),
            )
        .toList();

    notifyListeners();
  }
}