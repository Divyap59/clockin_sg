import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Counter extends ChangeNotifier {
  File? imageFile;
  String userName = '';
  String userCountryCode = '';
  String userMobileNumber = '';

  String get getCounter {
    return userName;
  }

  void incrementCounter(
      File? images, String name, String cuntryCode, String mobileNum) {
    imageFile = images;
    userName = name;
    userCountryCode = cuntryCode;
    userMobileNumber = mobileNum;
    notifyListeners();
  }
}
