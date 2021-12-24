import 'dart:ui' as ui;

import 'package:bflow/app/claim_assessment/models/patient_detail_model.dart';
import 'package:bflow/app/claim_assessment/pages/claim_assessment_step_four.dart';
import 'package:bflow/app/common_widget/common_action_button.dart';
import 'package:bflow/app/common_widget/common_app_bar.dart';
import 'package:bflow/app/common_widget/common_header.dart';
import 'package:bflow/app/common_widget/common_text_widget.dart';
import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class ClaimAssementStepThree extends StatefulWidget {
  PatientDetailsModel? patientDetailsModel;

  ClaimAssementStepThree(this.patientDetailsModel);

  @override
  _ClaimAssementStepThreeState createState() => _ClaimAssementStepThreeState();
}

class _ClaimAssementStepThreeState extends State<ClaimAssementStepThree> {
  GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
          text: AppStrings.claim_assessment,
        ),
        body: SingleChildScrollView(
          controller: ScrollController(),
          child: Container(
            child: Column(children: [
              CommonHeader(
                step: 3,
                patientDetailsModel: widget.patientDetailsModel,
              ),
              SizedBox(
                height: Dimens.twenty,
              ),
              InnerConatiner(context),
            ]),
          ),
        ));
  }

  Widget InnerConatiner(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Dimens.twenty, horizontal: Dimens.thirty),
      color: AppColor.offWhiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextWidget(
            text: AppStrings.signed_receivers_signature,
            fontSize: Dimens.sixteen,
            fontWeight: FontWeight.w600,
            fontColor: AppColor.blackColor,
          ),
          SizedBox(
            height: Dimens.ten,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonTextWidget(
                text: AppStrings.please_sign_here,
                fontSize: Dimens.forteen,
                fontWeight: FontWeight.w500,
                fontColor: AppColor.offWhite3BColor,
              ),
              GestureDetector(
                onTap: () {
                  _signaturePadKey.currentState!.clear();
                },
                child: CommonTextWidget(
                  text: AppStrings.clear.toUpperCase(),
                  fontSize: Dimens.forteen,
                  fontWeight: FontWeight.w700,
                  fontColor: AppColor.blueColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: Dimens.twenty,
          ),
          Container(
            padding: EdgeInsets.all(Dimens.five),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.offWhiteC8Color),
              borderRadius: BorderRadius.circular(Dimens.ten),
              // boxShadow: [BoxShadow(color: AppColor.offWhite3BColor,
              //   blurRadius: 5.0,)],
              color: AppColor.whiteColor,
            ),
            child: SfSignaturePad(
              key: _signaturePadKey,
              minimumStrokeWidth: 1,
              maximumStrokeWidth: 3,
              strokeColor: AppColor.blackColor,
              backgroundColor: AppColor.whiteColor,
            ),
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.maxFinite,
          ),
          SizedBox(
            height: Dimens.ten,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Dimens.twenty),
            child: CommonActionButton(
              title: AppStrings.next,
              onPressed: () {
                // _handleSaveButtonPressed();

                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) =>
                            ClaimAssementStepFour(widget.patientDetailsModel)));
              },
              borderRadius: Dimens.seven,
              backgroundColor: AppColor.primaryColor,
              width: double.maxFinite,
            ),
          ),
        ],
      ),
    );
  }

  void _handleSaveButtonPressed() async {
    final data = await _signaturePadKey.currentState!.toImage(pixelRatio: 3.0);
    final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Container(
                color: Colors.grey[300],
                child: Image.memory(bytes!.buffer.asUint8List()),
              ),
            ),
          );
        },
      ),
    );
  }
}
