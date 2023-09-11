import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class LightAndDarkColor with ChangeNotifier {
  bool _isLight = false;

  bool get isLight => _isLight;

  set isLight(bool value) {
    _isLight = value;
    notifyListeners();
  }

  Color get color => (_isLight) == false ? Colors.black : Colors.white;
}
