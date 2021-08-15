// ignore: import_of_legacy_library_into_null_safe
import 'package:intl/intl.dart';

class Grocery {
  int _id;
  String _name;
  String _quantity;
  String _imagePath;

  Grocery(this._id, this._name, this._quantity, this._imagePath,);

  int get id => _id;
  String get name => _name;
  String get quantity => _quantity;
  String get imagePath => _imagePath;

  String get date {
    final date = DateTime.fromMillisecondsSinceEpoch(id);
    return DateFormat('EEE h:mm a, dd/MM/yyyy').format(date);
  }
}