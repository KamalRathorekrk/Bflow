import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppImages.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  VoidCallback? onPressed;
  var color;
  double? height;

  @override
  Size get preferredSize => Size.fromHeight(height!);

  CommonAppBar(
      {required this.text,
      this.onPressed,
      this.color,
      required,
      this.height = kToolbarHeight});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle(statusBarColor: AppColor.offWhiteColor));

    return AppBar(
      // backgroundColor: Colors.transparent,
      backgroundColor: color??AppColor.offWhiteColor,
      automaticallyImplyLeading: false,
      elevation: 0.0,
      centerTitle: false,
      title: Stack(
        children: <Widget>[
           InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: () {
                if (onPressed != null)
                  onPressed!();
                else
                  Navigator.pop(context);
              },
              child: SizedBox(
                height: Dimens.forty,
                width: Dimens.forty,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SvgPicture.asset(
                    AppImages.back_arrow,
                    height: Dimens.twenty,
                    width: Dimens.twenty,
                  ),
                ),
              ),
            ),

          Align(
            alignment: Alignment.center,
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColor.blackColor,
                  fontFamily: AppStrings.fontFamily,
                  fontSize: Dimens.eighteen,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
