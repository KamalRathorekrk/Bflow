import 'dart:io';

import 'package:bflow/app/pre_delivery/pages/pre_delivery.dart';
import 'package:bflow/app/routes_activity_list/pages/routes_activity_list.dart';
import 'package:bflow/app/settings/pages/settings_page.dart';
import 'package:bflow/app/today_route/pages/todays_route.dart';
import 'package:bflow/network/api_repository.dart';
import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppImages.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';

class BottomNavigationPage extends StatefulWidget {
  BottomNavigationPage({Key? key}) : super(key: key);

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  ApiRepository apiRepository = ApiRepository();

  @override
  void initState() {
    permissionAccess();

    super.initState();
  }

  Future<void> permissionAccess() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location
    ].request();
    print(statuses[Permission.location]);
  }


  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    TodaysRoute(),
    PreDelivery(),
    RoutesActivityList(),
    Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: AppColor.primaryColor.withOpacity(0.2),
    //     statusBarBrightness: Brightness.light));
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: SizedBox(
        // height: Platform.isIOS ? 120 : 60,
        child: BottomNavigationBar(
          backgroundColor: AppColor.whiteColor,
          elevation: 4,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                //tooltip: AppStrings.account,
                icon: Padding(
                  padding:
                      EdgeInsets.only(top: Platform.isIOS ? Dimens.ten : 0.0),
                  child: SvgPicture.asset(
                    AppImages.today_route,
                  ),
                ),
                activeIcon: Padding(
                  padding:
                      EdgeInsets.only(top: Platform.isIOS ? Dimens.ten : 0.0),
                  child: SvgPicture.asset(
                    AppImages.today_select,
                  ),
                ),
                label: ""),
            BottomNavigationBarItem(
                // tooltip: AppStrings.pre,
                icon: Padding(
                  padding:
                      EdgeInsets.only(top: Platform.isIOS ? Dimens.ten : 0.0),
                  child: SvgPicture.asset(
                    AppImages.pre,
                  ),
                ),
                activeIcon: Padding(
                  padding:
                      EdgeInsets.only(top: Platform.isIOS ? Dimens.ten : 0.0),
                  child: SvgPicture.asset(
                    AppImages.pre_select,
                  ),
                ),
                label: ""),
            BottomNavigationBarItem(
                //  tooltip: AppStrings.rent,
                icon: Padding(
                  padding:
                      EdgeInsets.only(top: Platform.isIOS ? Dimens.ten : 0.0),
                  child: SvgPicture.asset(
                    AppImages.route_list,
                  ),
                ),
                activeIcon: Padding(
                  padding:
                      EdgeInsets.only(top: Platform.isIOS ? Dimens.ten : 0.0),
                  child: SvgPicture.asset(
                    AppImages.route_select,
                  ),
                ),
                label: ""),
            BottomNavigationBarItem(
                //  tooltip: AppStrings.hire,
                icon: Padding(
                  padding:
                      EdgeInsets.only(top: Platform.isIOS ? Dimens.ten : 0.0),
                  child: SvgPicture.asset(
                    AppImages.settings,
                    // color: AppColor.offWhite60Color,
                  ),
                ),
                activeIcon: Padding(
                  padding:
                      EdgeInsets.only(top: Platform.isIOS ? Dimens.ten : 0.0),
                  child: SvgPicture.asset(
                    AppImages.settings_select,
                    // color: AppColor.primaryColor,
                  ),
                ),
                label: ""),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          // unselectedItemColor: AppColor.offWhite60Color,
          // selectedItemColor: AppColor.primaryColor,
          // selectedLabelStyle: TextStyle(
          //     fontFamily: AppStrings.fontFamily, color: AppColor.primaryColor),
          // unselectedLabelStyle: TextStyle(
          //     fontFamily: AppStrings.fontFamily,
          //     color: AppColor.offWhite60Color),
        ),
      ),
    );
  }

// void showPermissionDialog(BuildContext context) async {
//   return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//             title: CommonTextWidget(text: AppStrings.dialog_message,
//             fontSize: Dimens.fifteen,fontWeight: FontWeight.w500,fontColor: AppColor.hintTextColor,),
//             content: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 GestureDetector(
//                   child: CommonTextWidget(text: AppStrings.cancel.toUpperCase(), fontSize: Dimens.fifteen,fontColor: AppColor.primaryColor,fontWeight: FontWeight.w600,),
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//                 Padding(padding: EdgeInsets.all(8.0)),
//                 GestureDetector(
//                   child: CommonTextWidget(text: AppStrings.ok.toUpperCase(), fontSize: Dimens.fifteen,fontColor: AppColor.primaryColor,fontWeight: FontWeight.w600,),
//                   onTap: () async{
//                     PermissionStatus permission = await LocationPermissions().requestPermissions();
//
//                     Navigator.pop(context);
//                   },
//                 )
//               ],
//             ));
//       });
// }
}
