import 'package:flutter/widgets.dart';

class FavoriteIconProvider with ChangeNotifier {
  get isFavored => _isFavored;
  var _isFavored = false;
  set isFavored(value) {
    _isFavored = value;
    notifyListeners();
  }
}
