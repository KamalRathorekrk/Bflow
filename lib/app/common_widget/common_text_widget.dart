import 'dart:io';

import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/CommonUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonTextWidget extends StatelessWidget {
  late var text = "";
  var fontWeight;
  double fontSize;
  var fontColor;var fontStyle;
  var textAlignment;
  var height;
  var wordSpacing;

  var textDecoration;
  final int? maxLines;
  final TextOverflow? overflow;

  CommonTextWidget(
      {required this.text,
      this.fontWeight,

      required this.fontSize,
      this.fontColor,

        this.textAlignment,
      this.height,
      this.textDecoration=TextDecoration.none,
      this.wordSpacing,
      this.maxLines,
      this.overflow,
      this.fontStyle}
      );

  @override
  Widget build(BuildContext context) {

    return Text(text,
        textScaleFactor: Platform.isIOS
            ? Utils.getIPhoneTextScaleFactor(context).toDouble()
            : Utils.getAndroidPhoneTextScaleFactor(context).toDouble(),
        textAlign: textAlignment,
        maxLines: maxLines,
        overflow: overflow,
        softWrap: true,
        style: TextStyle(
            fontStyle: fontStyle??FontStyle.normal,
            fontFamily: AppStrings.fontFamily,
            height: height != null ? height : 1.1,
            wordSpacing: wordSpacing,
            color: fontColor,
            fontWeight: fontWeight,
            decoration: textDecoration,

            fontSize: fontSize.toDouble()));
  }
}
