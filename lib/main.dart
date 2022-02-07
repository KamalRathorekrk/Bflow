import 'dart:async';

import 'package:bflow/app/bottom_nav_bar/bottom_navigation_pages.dart';
import 'package:bflow/app/login/pages/login.dart';
import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppImages.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/SharedPreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(BflowApp());
}

class BflowApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: AppStrings.fontFamily,
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: AppColor.primaryColor),
      home: SplashScreen(),
      builder: EasyLoading.init(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      SharedPreferenceData.getlogin().then((value) {
        if (value == "true") {
          getLocalData();
          Navigator.pushReplacement(context,
              CupertinoPageRoute(builder: (context) => BottomNavigationPage()));
        } else {
          Navigator.pushReplacement(
              context, CupertinoPageRoute(builder: (context) => LoginPage()));
        }
      });
    });
    super.initState();
  }

  getLocalData() {
    SharedPreferenceData.gettoken().then((value) {
      AppStrings.token = value;
    });
    SharedPreferenceData.getUserName().then((value) {
      AppStrings.userName = value;
    });
    SharedPreferenceData.getFullName().then((value) {
      AppStrings.fullname = value;
    });
    SharedPreferenceData.getCorporateId().then((value) {
      AppStrings.corporateId = value;
    });
    SharedPreferenceData.getUserId().then((value) {
      AppStrings.userId = value;
    });
    SharedPreferenceData.getEmailAddress().then((value) {
      AppStrings.emailAddress = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Container(
          child: Center(
              child: Image.asset(
        AppImages.bflow_white,
        width: 280,
      ))),
    );
  }
}
