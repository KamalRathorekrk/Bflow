import 'package:bflow/app/common_widget/common_app_bar.dart';
import 'package:bflow/app/common_widget/common_text_widget.dart';
import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatefulWidget {
  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        text: AppStrings.terms_and_conditions,
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Container(
          color: AppColor.offWhiteColor,
          padding: EdgeInsets.symmetric(
              vertical: Dimens.twenty, horizontal: Dimens.twentyFive),
          child: CommonTextWidget(
            text:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            fontSize: Dimens.fifteen,
            fontWeight: FontWeight.w400,
            fontColor: AppColor.blackColor,height: 1.5,
          ),
        ),
      ),
    );
  }
}