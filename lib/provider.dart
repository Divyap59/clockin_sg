import 'dart:io';
import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  File? imageFile;
  String userName = '';
  String userCountryCode = '';
  String userMobileNumber = '';

  String get getCounter {
    return userName;
  }

  void editProfileData(
      File? images, String name, String cuntryCode, String mobileNum) {
    imageFile = images;
    userName = name;
    userCountryCode = cuntryCode;
    userMobileNumber = mobileNum;
    notifyListeners();
  }
}
