import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class CommonTextField extends StatefulWidget {
  final String prefixIcon;
  final Color? color;
  final String counterText;
  final String hintText, labelText;
  final TextStyle hintStyle, labelStyle;
  final InputBorder border, enabledborder, focusedborder;
  final EdgeInsetsGeometry contentpadding;
  final spacebetween;

  var focusNode;
  final TextEditingController textEditingController;
  final ValueChanged<String>? onChange;
  final ValueChanged<String>? onSubmit;
  final TextInputType? keyboardType;
  TextInputAction? textInputAction;


      CommonTextField(
      {required this.textEditingController,
      this.prefixIcon = "",
      this.color,
      this.onSubmit,
      this.counterText = "",
      this.hintText = "",
      this.labelText = "",
      this.hintStyle = const TextStyle(color: Colors.grey),
      this.labelStyle = const TextStyle(color: Colors.black),
      this.keyboardType,
      this.focusNode,
      this.border = const OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
      ),
      this.enabledborder = const OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
      ),
      this.focusedborder = const OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
      ),
      this.contentpadding =
          const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
      this.spacebetween = 5.0,
      this.onChange,
      this.textInputAction});

  InputBorder aa = new OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(Dimens.thirty));

  @override
  _CommonTextFieldState createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFormField(
        textInputAction:widget.textInputAction??TextInputAction.done,
        keyboardType: widget.keyboardType,
        focusNode: widget.focusNode,
        controller: widget.textEditingController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.twelve),
            borderSide: BorderSide(
                color: widget.color ?? AppColor.hintColor, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.twelve),
            borderSide: BorderSide(
                color: widget.color ?? AppColor.hintColor, width: 1.0),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.twelve),
              borderSide: BorderSide(
                  color: widget.color ?? AppColor.hintColor, width: 1.0)),
          labelText: widget.hintText,
          labelStyle: TextStyle(
              fontFamily: AppStrings.fontFamily,
              fontWeight: FontWeight.w400,
              fontSize: Dimens.sixteen,
              color: widget.focusNode.hasFocus
                  ? AppColor.primaryColor
                  : widget.color),
          counterText: widget.counterText,
          hintText: widget.hintText,
          hintStyle: TextStyle(
              fontFamily: AppStrings.fontFamily,
              fontWeight: FontWeight.w500,
              fontSize: Dimens.sixteen,
              color: widget.color),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
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
            fontWeight: FontWeight.w500,
            fontSize: Dimens.nineteen,
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
