import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppImages.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonPasswordField extends StatefulWidget {
  final String prefixIcon;
  final Color? color;
  final bool suffixicon;
  final String labelText;
  final TextStyle labelStyle;
  final InputBorder border;
  final EdgeInsetsGeometry contentpadding;
  var focusNode;
  TextEditingController textEditingController;
  final fillColor;
  final ValueChanged<String>? onChange;
  final ValueChanged<String>? onSubmit;
  TextInputAction? textInputAction;

  CommonPasswordField(
      {required this.textEditingController,
      this.prefixIcon = "",
      this.onSubmit,
      this.color,
      this.fillColor,
      this.suffixicon = true,
      this.focusNode,
      this.labelText = "",
      this.labelStyle = const TextStyle(color: Colors.black),
      this.border = const OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
      ),
      this.contentpadding =
          const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
      this.onChange,
      this.textInputAction});

  InputBorder aa = new OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(4.0));

  @override
  _CommonPasswordFieldState createState() => _CommonPasswordFieldState();
}

class _CommonPasswordFieldState extends State<CommonPasswordField> {
  String check = "weak";
  bool passwordfield = true;

  @override
  Widget build(BuildContext context) {
    if (widget.suffixicon == false) {
      passwordfield = true;
    }
    return Column(children: [
      TextFormField(
        cursorColor: AppColor.primaryColor,
        textInputAction: widget.textInputAction ?? TextInputAction.done,
        focusNode: widget.focusNode,
        controller: widget.textEditingController,
        obscureText: passwordfield,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.twelve),
            borderSide:
                BorderSide(color: AppColor.borderColor, width: Dimens.one),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.twelve),
            borderSide:
                BorderSide(color: AppColor.borderColor, width: Dimens.one),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.twelve),
              borderSide:
                  BorderSide(color: AppColor.borderColor, width: Dimens.one)),
          labelText: widget.labelText,
          labelStyle: TextStyle(
              fontFamily: AppStrings.fontFamily,
              fontWeight: FontWeight.w400,
              fontSize: Dimens.sixteen,
              color: AppColor.hintColor),
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
          suffixIconConstraints:
              BoxConstraints(minHeight: Dimens.twentyFive, minWidth: Dimens.twentyFive),
          suffixIcon: widget.suffixicon
              ? InkWell(
                  child: passwordfield == true
                      ? Padding(
                          padding: EdgeInsets.only(right: Dimens.fifteen),
                          child: SvgPicture.asset(
                            AppImages.eye_closed,
                            color: widget.color,
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.only(
                            right: Dimens.fifteen,
                          ),
                          child: SvgPicture.asset(
                            AppImages.eye,color: widget.color,
                          ),
                        ),
                  onTap: () {
                    setState(() {
                      passwordfield = !passwordfield;
                    });
                  },
                )
              : null,
          fillColor: widget.fillColor,
        ),
        style: TextStyle(
            fontFamily: AppStrings.fontFamily,
            fontWeight: FontWeight.w400,
            fontSize: Dimens.fifteen,
            background: null,
            color: widget.color),
        onChanged: widget.onChange,
        onFieldSubmitted: widget.onSubmit,
        // The validator receives the text that the user has entered.
      ),
    ]);
    ;
  }
}
