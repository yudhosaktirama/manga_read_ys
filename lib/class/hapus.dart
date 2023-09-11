import 'package:flutter/material.dart';

class CobaProvider with ChangeNotifier {
  bool _ganti = true;

  bool get belumBerganti => _ganti;

  set setPergantian(bool nilai) {
    _ganti = nilai;
    notifyListeners();
  }

  
}
