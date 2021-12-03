import 'package:bflow/app/claim_assessment/pages/claim_assessment_step_one.dart';
import 'package:bflow/app/common_widget/common_action_button.dart';
import 'package:bflow/app/common_widget/common_app_bar.dart';
import 'package:bflow/app/common_widget/common_password_textfield.dart';
import 'package:bflow/app/common_widget/common_text_widget.dart';
import 'package:bflow/app/common_widget/common_textfield.dart';
import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppImages.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsCancelation extends StatefulWidget {
  String reasonOfCancealation;

  DetailsCancelation({required this.reasonOfCancealation});

  @override
  _DetailsCancelationState createState() => _DetailsCancelationState();
}

class _DetailsCancelationState extends State<DetailsCancelation> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColor.offWhiteColor));
    return Scaffold(
      appBar: CommonAppBar(
        text: "Claim: #2325",
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(
              horizontal: Dimens.twenty, vertical: Dimens.ten),
          color: AppColor.offWhiteColor,

          // width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CenterContainer(),
              SizedBox(
                height: Dimens.twentyFive,
              ),
              CommonTextWidget(
                text: AppStrings.reason_for_cancellation,
                fontSize: Dimens.forteen,
                fontColor: AppColor.blackColor,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: Dimens.twenty,
              ),
              Expanded(
                child: CommonTextWidget(
                  text: widget.reasonOfCancealation,
                  fontSize: Dimens.forteen,
                  fontColor: AppColor.blackColor,
                  fontWeight: FontWeight.w400,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget CenterContainer() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.fifteen, vertical: Dimens.ten),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.ten),
        boxShadow: [
          BoxShadow(color: AppColor.offWhite17Color, blurRadius: 5.0)
        ],
        color: AppColor.whiteColor,
      ),
      child: Column(
        children: [
          SizedBox(
            height: Dimens.fifteen,
          ),
          RowElement(
              title: AppStrings.description,
              value: "Light Wheelchair",
              show: true),
          SizedBox(
            height: Dimens.twenty,
          ),
          Divider(
            thickness: 1,
            height: Dimens.two,
            color: AppColor.offWhite17Color,
          ),
          SizedBox(
            height: Dimens.twenty,
          ),
          RowElement(title: AppStrings.patient_name, value: "Mary Beth"),
          SizedBox(
            height: Dimens.twenty,
          ),
          Divider(
            thickness: 1,
            height: Dimens.two,
            color: AppColor.offWhite17Color,
          ),
          SizedBox(height: Dimens.twenty),
          RowElement(
              icon: true,
              title: AppStrings.delivery_address,
              value: "1700 Cheddar Ln, Tullahoma, TN"),
          SizedBox(height: Dimens.twenty),
          Divider(
            thickness: 1,
            height: Dimens.two,
            color: AppColor.offWhite17Color,
          ),
          SizedBox(
            height: Dimens.twenty,
          ),
          RowElement(title: AppStrings.zip_code, value: "134402"),
          SizedBox(
            height: Dimens.twenty,
          ),
          Divider(
            thickness: 1,
            height: Dimens.two,
            color: AppColor.offWhite17Color,
          ),
          SizedBox(
            height: Dimens.twenty,
          ),
          RowElement(title: AppStrings.phone_number, value: "91-99999999"),
          SizedBox(
            height: Dimens.twenty,
          ),
        ],
      ),
    );
  }

  Widget RowElement({title, value, show, icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextWidget(
          text: title,
          fontSize: Dimens.thrteen,
          fontColor: AppColor.blackColor,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(
          height: Dimens.ten,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Visibility(
                    visible: icon ?? false,
                    child: Padding(
                      padding: EdgeInsets.only(right: Dimens.four),
                      child: SvgPicture.asset(AppImages.location),
                    )),
                CommonTextWidget(
                  text: "${value}",
                  fontSize: Dimens.forteen,
                  fontColor: AppColor.blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            Visibility(
                visible: show ?? false,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.redColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  padding: EdgeInsets.symmetric(
                      vertical: Dimens.five, horizontal: Dimens.eight),
                  child: Center(
                    child: CommonTextWidget(
                      text: AppStrings.cancelled,
                      fontColor: AppColor.whiteColor,
                      fontWeight: FontWeight.w500,
                      fontSize: Dimens.eleven,
                    ),
                  ),
                )),
          ],
        ),
      ],
    );
  }
}
