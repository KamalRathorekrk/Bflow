import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class CommonTextFieldSimple extends StatefulWidget {
  final Color? color, borderColor;

  final String labelText;
  final TextStyle labelStyle;

  final EdgeInsetsGeometry contentpadding;

  TextEditingController textEditingController;
  final ValueChanged<String>? onChange;
  final ValueChanged<String>? onSubmit;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool readOnly;
  var focusNode;
  var inputFormatters;

  CommonTextFieldSimple(
      {required this.textEditingController,
      this.color,
        this.inputFormatters,
      this.borderColor,
        this.focusNode,
      this.labelText = "",
        this.onSubmit,
      this.labelStyle = const TextStyle(color: const Color(0xFF666666)),
      this.keyboardType,
      this.maxLines = 1,
      this.contentpadding =
          const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
      this.onChange,
      this.readOnly = false});

  InputBorder aa = new OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(Dimens.thirty));

  @override
  _CommonTextFieldSimpleState createState() => _CommonTextFieldSimpleState();
}

class _CommonTextFieldSimpleState extends State<CommonTextFieldSimple> {

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFormField(
        inputFormatters:widget.inputFormatters,
        cursorColor: AppColor.primaryColor,
        maxLines: widget.maxLines,
        keyboardType: widget.keyboardType,
        focusNode: widget.focusNode,
        controller: widget.textEditingController,
        readOnly: widget.readOnly,
        textAlign: TextAlign.justify,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: widget.borderColor!, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: widget.borderColor!, width: 1.0),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: widget.borderColor!, width: 1.0)),
          labelText: widget.labelText,
          labelStyle: TextStyle(
              fontFamily: AppStrings.fontFamily,
              fontWeight: FontWeight.w400,
              fontSize: Dimens.sixteen,
              color: widget.color),

        ),
        style: TextStyle(
            fontFamily: AppStrings.fontFamily,
            fontWeight: FontWeight.w400,
            fontSize: Dimens.sixteen,
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
