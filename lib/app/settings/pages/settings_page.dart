import 'dart:io';

import 'package:bflow/app/common_widget/common_action_button.dart';
import 'package:bflow/app/common_widget/common_text_widget.dart';
import 'package:bflow/app/login/pages/login.dart';
import 'package:bflow/app/settings/pages/change_password.dart';
import 'package:bflow/app/settings/pages/privacy_policy.dart';
import 'package:bflow/app/settings/pages/terms_and_conditions.dart';
import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppImages.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:bflow/utils/SharedPreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  @override
  void initState() {
    permissionAccess();
    super.initState();
  }

  Future<void> permissionAccess() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.storage,
      Permission.photos
    ].request();
    print(statuses[Permission.camera]);
    print(statuses[Permission.storage]);
    if (await Permission.camera.request().isGranted) {
      print("Camera permission granted");
      // Either the permission was already granted before or the user just granted it.
    }
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle(statusBarColor: AppColor.blackColor));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.backgroundColor,
        title: CommonTextWidget(
          text: AppStrings.setting,
          fontSize: Dimens.eighteen,
          fontColor: AppColor.whiteColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Dimens.twentyFive,
              ),
              Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimens.twenty, horizontal: Dimens.thirtyFive),
                  child: Profile()),
              SizedBox(
                height: Dimens.forty,
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: Dimens.thirtyFive),
                  child: CommonTextWidget(
                    text: AppStrings.change_password,
                    fontSize: Dimens.fifteen,
                    fontWeight: FontWeight.w500,
                    fontColor: AppColor.blackColor,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => ChangePassword()));
                },
              ),
              SizedBox(
                height: Dimens.twentyFive,
              ),
              Divider(
                thickness: 0.2,
                height: Dimens.five,
                color: AppColor.offWhite97Color,
              ),
              SizedBox(
                height: Dimens.twentyFive,
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: Dimens.thirtyFive),
                  child: CommonTextWidget(
                    text: AppStrings.terms_and_conditions,
                    fontSize: Dimens.fifteen,
                    fontWeight: FontWeight.w500,
                    fontColor: AppColor.blackColor,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => TermsAndConditions()));
                },
              ),
              SizedBox(
                height: Dimens.twentyFive,
              ),
              Divider(
                thickness: 0.2,
                height: Dimens.five,
                color: AppColor.offWhite97Color,
              ),
              SizedBox(
                height: Dimens.twentyFive,
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: Dimens.thirtyFive),
                  child: CommonTextWidget(
                    text: AppStrings.privacy_policy,
                    fontSize: Dimens.fifteen,
                    fontWeight: FontWeight.w500,
                    fontColor: AppColor.blackColor,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => PrivacyPolicy()));
                },
              ),
              SizedBox(
                height: Dimens.twentyFive,
              ),
              Divider(
                thickness: 0.2,
                height: Dimens.five,
                color: AppColor.offWhite97Color,
              ),
              SizedBox(
                height: Dimens.forty,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Dimens.thirtyFive),
                child: CommonActionButton(
                  title: AppStrings.logout,
                  onPressed: () {
                    SharedPreferenceData.clearAllPreferncesData();
                    Navigator.pushReplacement(context,
                        CupertinoPageRoute(builder: (context) => LoginPage()));
                  },
                  borderRadius: Dimens.seven,
                  backgroundColor: AppColor.primaryColor,
                  width: double.maxFinite,
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationPage(),
    );
  }

  Widget Profile() {
    String userImage = "AppStrings.userImage";
    return Container(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: Dimens.twenty),
              padding: EdgeInsets.symmetric(horizontal: Dimens.five),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColor.blackColor, width: 1.5)),
              width: Dimens.hundred,
              height: Dimens.hundred,
              child: _image != null
                  ? CircleAvatar(
                backgroundImage: AssetImage(_image!.path),
              )
                  : CircleAvatar(
                      backgroundImage: AssetImage(AppImages.bg),
                    ),
              // imageProfile==null?Image.file(
              //   File(imageProfile!.path),
              //   fit: BoxFit.fill,
              // ):CircleAvatar(
              //   backgroundImage: AssetImage(AppImages.bg),
              // ),
            ),
            Positioned(
                bottom: -5,
                right: -15,
                child: RawMaterialButton(
                  onPressed: () {
                    showSelectionDialog(context);
                  },
                  elevation: 2.0,
                  child: SvgPicture.asset(AppImages.edit),
                  shape: CircleBorder(),
                )),
          ]),
          SizedBox(
            height: Dimens.ten,
          ),
          CommonTextWidget(
            text: AppStrings.fullname,
            fontSize: Dimens.fifteen,
            fontWeight: FontWeight.w500,
            fontColor: AppColor.blackColor,
            textAlignment: TextAlign.center,
          ),
          SizedBox(
            height: Dimens.five,
          ),
          CommonTextWidget(
            text:"@ ${AppStrings.userName}",
            fontSize: Dimens.fifteen,
            fontWeight: FontWeight.w500,
            fontColor: AppColor.blackColor,
            textAlignment: TextAlign.center,
          ),
          SizedBox(
            height: Dimens.thrteen,
          ),
          CommonTextWidget(
            text: "${AppStrings.corporate_ID} ${AppStrings.corporateId}",
            fontSize: Dimens.fifteen,
            fontWeight: FontWeight.w600,
            fontColor: AppColor.blackColor,
          ),
        ],
      ),
    );
  }

  void showSelectionDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text(
                "From where do you want to take the photo?",
                style: TextStyle(fontSize: Dimens.forteen),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text(
                        "Gallery",
                        style: TextStyle(fontSize: Dimens.twelve),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        _openGallery(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text(
                        "Camera",
                        style: TextStyle(fontSize: Dimens.twelve),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        _openCamera(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }

  _openGallery(BuildContext context) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        _image = image;
      }
    });
    setState(() {});
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (image != null) {
        _image = image;
      }
    });
    Navigator.of(context).pop();
  }
}
