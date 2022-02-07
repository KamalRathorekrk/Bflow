import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CommonTextField extends StatefulWidget {
  final String prefixIcon;
  final Color color, borderColor;
  final String labelText;
  final TextStyle labelStyle;
  final EdgeInsetsGeometry contentpadding;
  var focusNode;
  final TextEditingController textEditingController;
  final ValueChanged<String>? onChange;
  final ValueChanged<String>? onSubmit;
  final TextInputType? keyboardType;
  TextInputAction? textInputAction;

  CommonTextField(
      {required this.textEditingController,
      this.prefixIcon = "",
      required this.color,
      required this.borderColor,
      this.onSubmit,
      this.labelText = "",
      this.labelStyle = const TextStyle(color: Colors.black),
      this.keyboardType,
      this.focusNode,
      this.contentpadding =
          const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
      this.onChange,
      this.textInputAction});

  @override
  _CommonTextFieldState createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFormField(
        cursorColor: AppColor.primaryColor,
        textInputAction: widget.textInputAction ?? TextInputAction.done,
        keyboardType: widget.keyboardType,
        focusNode: widget.focusNode,
        controller: widget.textEditingController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.eight),
            borderSide:
                BorderSide(color: widget.borderColor, width: Dimens.one),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.eight),
            borderSide:
                BorderSide(color: widget.borderColor, width: Dimens.one),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.eight),
              borderSide:
                  BorderSide(color: widget.borderColor, width: Dimens.one)),
          labelText: widget.labelText,
          labelStyle: TextStyle(
              fontFamily: AppStrings.fontFamily,
              fontWeight: FontWeight.w400,
              fontSize: Dimens.sixteen,
              color: widget.color),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.fifteen),
            child: InkWell(
              child: SvgPicture.asset(
                widget.prefixIcon,
                color: widget.color,
              ),
            ),
          ),
          prefixIconConstraints: BoxConstraints(
              minHeight: Dimens.thirtyTwo, minWidth: Dimens.thirtyEight),
        ),
        style: TextStyle(
            fontFamily: AppStrings.fontFamily,
            fontWeight: FontWeight.w400,
            fontSize: Dimens.fifteen,
            background: null,
            color: widget.color),
        onChanged: widget.onChange,
        onFieldSubmitted: widget.onSubmit,
      ),
      SizedBox(
        height: Dimens.ten,
      )
    ]);
    ;
  }
}
