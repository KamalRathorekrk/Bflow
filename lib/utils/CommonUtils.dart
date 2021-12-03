import 'dart:io';
import 'package:flutter/material.dart';

class Utils {
  static String allWordsCapitilize(String value) {
    var result = value[0].toUpperCase();
    for (int i = 1; i < value.length; i++) {
      if (value[i - 1] == " ") {
        result = result + value[i].toUpperCase();
      } else {
        result = result + value[i];
      }
    }
    return result;
  }
  static bool checkNullOrEmpty(String value) {
    if (value == null || value.isEmpty) return true;
    return false;
  }
  static String validateEmail(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern.toString());
    if (value.isEmpty) {
      return 'Please enter a email address';
    } else if (!regex.hasMatch(value) || value == null)
      return 'Please enter a valid email address';
    else
      return '';
  }
  static bool validateEmailCheck(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern.toString());
   if (!regex.hasMatch(value))
      return true;
    else
      return false;
  }
  static Future<bool> checkConnectivity() async {
    bool isConnectd = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        isConnectd = true;
      } else {
        isConnectd = false;
      }
    } on SocketException catch (_) {
      print('not connected');
      isConnectd = false;
    }
    return isConnectd;
  }

  static double getAndroidPhoneTextScaleFactor(BuildContext context) {
    //android scale factor
    /* 0.86
    1.0
    1.15
    1.32
    1.4
    2*/
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    if (textScaleFactor >= 1 && textScaleFactor < 1.5) {
      return textScaleFactor;
    } else if (textScaleFactor > 1.5) {
      return 1.5;
    } else {
      return 1;
    }
  }

  static double getIPhoneTextScaleFactor(BuildContext context) {
    /*ios 11 pro
     3.1176470588235294 high
     2.3529411764705883 m to h
     1.3529411764705883 m
     1 default
     0.8235294117647058 s*/
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    if (textScaleFactor <= 1) {
      return 1;
    } else if (textScaleFactor > 1 && textScaleFactor <= 2) {
      return 1.15;
    } else if (textScaleFactor > 2 && textScaleFactor <= 3) {
      return 1.30;
    } else if (textScaleFactor > 3) {
      return 1.40;
    }
    return 0.0;
  }
}