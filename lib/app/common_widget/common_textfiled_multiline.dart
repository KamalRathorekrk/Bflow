import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonTextFieldMultiLine extends StatefulWidget {
  final Color? color, borderColor;
  final String hintText;
  final TextStyle hintStyle;
  final InputBorder border, enabledborder, focusedborder;
  final EdgeInsetsGeometry contentpadding;
  final spacebetween;
  TextEditingController textEditingController;
  final ValueChanged<String>? onChange;
  final ValueChanged<String>? onSubmit;
  final TextInputType? keyboardType;
  final int maxLines, minLines;
  final bool readOnly;
  var focusNode;

  CommonTextFieldMultiLine(
      {required this.textEditingController,
      this.color,
      this.borderColor,
      this.hintText = "",
      this.onSubmit,
      this.focusNode,
      this.hintStyle = const TextStyle(color: AppColor.hintTextColor),
      this.keyboardType,
      this.maxLines = 7,
      this.minLines = 5,
      this.border = const OutlineInputBorder(
        borderSide: const BorderSide(color: AppColor.hintTextColor),
      ),
      this.enabledborder = const OutlineInputBorder(
        borderSide: const BorderSide(color: AppColor.hintTextColor),
      ),
      this.focusedborder = const OutlineInputBorder(
        borderSide: const BorderSide(color: AppColor.hintTextColor),
      ),
      this.contentpadding =
          const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
      this.spacebetween = 5.0,
      this.onChange,
      this.readOnly = false});

  InputBorder aa = new OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(Dimens.thirty));

  @override
  _CommonTextFieldMultiLineState createState() =>
      _CommonTextFieldMultiLineState();
}

class _CommonTextFieldMultiLineState extends State<CommonTextFieldMultiLine> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFormField(
        cursorColor: AppColor.primaryColor,
        focusNode: widget.focusNode,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
                color: widget.color ?? AppColor.hintTextColor,
                width: Dimens.one),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
                color: widget.color ?? AppColor.hintTextColor,
                width: Dimens.one),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                  color: widget.color ?? AppColor.hintTextColor,
                  width: Dimens.one)),
          hintText: widget.hintText,
          hintStyle: TextStyle(
              fontFamily: AppStrings.fontFamily,
              fontWeight: FontWeight.w500,
              fontSize: Dimens.fifteen,
              color: widget.color),
        ),

        style: TextStyle(
            fontFamily: AppStrings.fontFamily,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: Dimens.fifteen,
            color: AppColor.blackColor),
        //  controller: _loadNumberController,
        obscureText: false,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        controller: widget.textEditingController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        onFieldSubmitted: widget.onSubmit,
      ),
      SizedBox(
        height: Dimens.ten,
      )
    ]);
    ;
  }
}
