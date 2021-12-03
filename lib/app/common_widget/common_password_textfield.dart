import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppImages.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonPasswordField extends StatefulWidget {
  //Can be changed according to user.. made dynamic so that user can made their own text field
  final IconData visibleIcon, visibleoffIcon;
  final String prefixIcon;
  final Color visibleColor, visibleoffColor;
  final bool suffixicon;
  final String counterText;
  final String hintText, labelText, emptyPassword, weakPassword;
  final TextStyle hintStyle, labelStyle;
  final InputBorder border, enabledborder, focusedborder;
  final EdgeInsetsGeometry contentpadding;
  final spacebetween;
  var focusNode;
  TextEditingController textEditingController;
  final fillColor;
  final LinearGradient weakGradient, fairGradient, strongGradient;
  final Color unselectedColor;
  final ValueChanged<String>? onChange;
  final ValueChanged<String>? onSubmit;


  CommonPasswordField(
      {required this.textEditingController,
      this.visibleIcon = Icons.visibility_off,
      this.visibleoffIcon = Icons.visibility_off_outlined,
        this.prefixIcon="",
        this.onSubmit,
      this.visibleColor = Colors.grey,
      this.visibleoffColor = Colors.grey,
      this.suffixicon = true,
      this.counterText = "",
        this.focusNode,
      this.hintText = "Enter Password",
      this.labelText = "Password",
      this.emptyPassword = "Password is empty",
      this.weakPassword = "Password is too weak",
      this.hintStyle = const TextStyle(color: Colors.grey),
      this.labelStyle = const TextStyle(color: Colors.black),
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
      this.spacebetween = 10.0,
      this.weakGradient = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: const [
            const Color(0xffff3346),
            const Color(0xFFFFCDD2),
          ]),
      this.fairGradient = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: const [
            const Color(0xFFFFCDD2),
            const Color(0xfffff633),
          ]),
      this.strongGradient = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: const [
            const Color(0xFFFFCDD2),
            const Color(0xfffff633),
            const Color(0xff39ff33),
          ]),
      this.fillColor = Colors.red,
      this.unselectedColor = const Color(0xFFD6D6D6),
      this.onChange});

  InputBorder aa = new OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(4.0));

  @override
  _CommonPasswordFieldState createState() => _CommonPasswordFieldState();
}

class _CommonPasswordFieldState extends State<CommonPasswordField> {
  String check = "weak";
  bool passwordfield = false;




  @override
  Widget build(BuildContext context) {
    if (widget.suffixicon == false) {
      passwordfield = false;
    }
    return Column(children: [
      TextFormField(
          focusNode: widget.focusNode,
          controller: widget.textEditingController,
          obscureText: passwordfield,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.twelve),
              borderSide: BorderSide(color: AppColor.primaryColor, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.twelve),
              borderSide: BorderSide(color: AppColor.hintColor, width: 1.0),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimens.twelve),
                borderSide: BorderSide(color: AppColor.hintColor, width: 1.0)),
            labelText: widget.hintText,
            labelStyle: TextStyle(
                fontFamily: AppStrings.fontFamily,
                fontWeight: FontWeight.w400,
                fontSize: Dimens.sixteen,
                color: widget.focusNode.hasFocus
                    ? AppColor.primaryColor
                    : AppColor.hintColor),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child:SvgPicture.asset(widget.prefixIcon),
              ),
            ),
            prefixIconConstraints: BoxConstraints(minHeight: Dimens.thirtyTwo,minWidth: Dimens.thirtyEight),

            suffixIconConstraints: BoxConstraints(minHeight: Dimens.forty,minWidth: Dimens.forty),
      suffixIcon: Padding(
        padding: const EdgeInsets.all(10.0),
        child: widget.suffixicon
                  ? InkWell(
                      child: passwordfield==true
                          ? SvgPicture.asset(AppImages.eye)
                          : SvgPicture.asset(AppImages.eye_closed),
                      onTap: () {
                        setState(() {
                          passwordfield = !passwordfield;
                        });
                      },
                    )
                  : null,
      ),
            counterText: widget.counterText,
            hintText: widget.hintText,
            fillColor: widget.fillColor,
            hintStyle: TextStyle(
                fontFamily: AppStrings.fontFamily,
                fontWeight: FontWeight.w400,
                fontSize: Dimens.sixteen,
                color: AppColor.hintColor),
          ),
          style: TextStyle(
              fontFamily: AppStrings.fontFamily,
              fontWeight: FontWeight.w500,
              fontSize: Dimens.eighteen,
              background: null,
              color: AppColor.hintColor),
          onChanged: widget.onChange,
          onFieldSubmitted: widget.onSubmit,
          // The validator receives the text that the user has entered.
          validator: (value) {
            if (value!.isEmpty) {
              return widget.emptyPassword;
            } else if (check == "weak") {
              return widget.weakPassword;
            }
            return null;
          }),
    ]);
    ;
  }
}
