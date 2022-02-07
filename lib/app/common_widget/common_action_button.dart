import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonActionButton extends StatelessWidget {
  final Color? backgroundColor;
  final String? title;
  final double? borderRadius;
  final double? width;
  final FontWeight? fontWeight;
  final VoidCallback? onPressed;
  final Color? shadowColor;
  final Color? textColor;

  CommonActionButton({
    this.backgroundColor,
    this.title,
    this.borderRadius,
    this.onPressed,
    this.width,
    this.fontWeight,
    this.shadowColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.ten),
        boxShadow: [
          BoxShadow(
              offset: Offset(1, 1),
              spreadRadius: 1.0,
              color: shadowColor ?? AppColor.hintColor,
              blurRadius: 5.0)
        ],
        color: AppColor.whiteColor,
      ),
      width: width,
      child: RaisedButton(
        padding: EdgeInsets.only(top: Dimens.twenty, bottom: Dimens.seventeen),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? 0),
          ),
        ),
        child: textWidget(),
        color: backgroundColor,
        focusColor: backgroundColor,
        disabledColor: backgroundColor,
        onPressed: onPressed,
      ),
    );
  }

  Widget textWidget() {
    return Text(
      title!.toUpperCase(),
      textAlign: TextAlign.center,
      style: TextStyle(
          fontWeight: fontWeight ?? FontWeight.w700,
          fontSize: Dimens.sixteen,
          fontFamily: AppStrings.fontFamily,
          color: textColor ?? AppColor.whiteColor),
    );
  }
}
