import 'dart:io';

import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/CommonUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonTextUnderLineWidget extends StatelessWidget {
  late var text = "";
  var fontWeight;
  double fontSize;
  var fontColor;
  var fontStyle;
  var textAlignment;
  var height;
  var wordSpacing;

  var textDecoration;
  final TextOverflow? overflow;

  CommonTextUnderLineWidget(
      {required this.text,
      this.fontWeight,
      required this.fontSize,
      this.fontColor,
      this.textAlignment,
      this.height,
      this.textDecoration = TextDecoration.none,
      this.wordSpacing,
      this.overflow,
      this.fontStyle});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textScaleFactor: Platform.isIOS
            ? Utils.getIPhoneTextScaleFactor(context).toDouble()
            : Utils.getAndroidPhoneTextScaleFactor(context).toDouble(),
        textAlign: textAlignment,
        overflow: overflow,
        softWrap: true,
        style: TextStyle(
            fontStyle: fontStyle ?? FontStyle.normal,
            fontFamily: AppStrings.fontFamily,
            height: height != null ? height : 1.1,
            wordSpacing: wordSpacing,
            color: Colors.transparent,
            fontWeight: fontWeight,
            decoration: textDecoration,
          decorationColor: fontColor,
            fontSize: fontSize.toDouble(),
            shadows: [
            Shadow(
            color: fontColor,
            offset: Offset(0, -2))
      ],
        ));
  }
}
