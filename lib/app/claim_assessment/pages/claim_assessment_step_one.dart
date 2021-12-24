import 'dart:ui';

import 'package:bflow/app/claim_assessment/models/claim_assements_model.dart';
import 'package:bflow/app/claim_assessment/models/patient_detail_model.dart';
import 'package:bflow/app/claim_assessment/pages/claim_assessment_step_two.dart';
import 'package:bflow/app/common_widget/common_action_button.dart';
import 'package:bflow/app/common_widget/common_app_bar.dart';
import 'package:bflow/app/common_widget/common_header.dart';
import 'package:bflow/app/common_widget/common_text_widget.dart';
import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppImages.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClaimAssementStepOne extends StatefulWidget {
  PatientDetailsModel? patientDetailsModel;

  ClaimAssementStepOne({this.patientDetailsModel});

  @override
  _ClaimAssementStepOneState createState() => _ClaimAssementStepOneState();
}

class _ClaimAssementStepOneState extends State<ClaimAssementStepOne> {
  String icon = AppImages.check;

  @override
  void initState() {
    super.initState();
  }

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
                patientDetailsModel: widget.patientDetailsModel,
                step: 1,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: Dimens.twenty, horizontal: Dimens.thirty),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextWidget(
                      text: AppStrings.reviewed_patient,
                      fontSize: Dimens.forteen,
                      fontWeight: FontWeight.w600,
                      fontColor: AppColor.blackColor,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: listReviewed(),
                    ),
                    SizedBox(
                      height: Dimens.ten,
                    ),
                    CommonTextWidget(
                      text: AppStrings.claim_check_list,
                      fontSize: Dimens.forteen,
                      fontWeight: FontWeight.w600,
                      fontColor: AppColor.blackColor,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: listClamedCheckList(),
                    ),
                    SizedBox(
                      height: Dimens.ten,
                    ),
                    CommonTextWidget(
                      text: AppStrings.print_existing_notes_on_delivery_ticket,
                      fontSize: Dimens.forteen,
                      fontWeight: FontWeight.w600,
                      fontColor: AppColor.blackColor,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: ListDileveryTicket(),
                    ),
                    SizedBox(
                      height: Dimens.ten,
                    ),
                    CommonTextWidget(
                      text: AppStrings.insurance_verification,
                      fontSize: Dimens.forteen,
                      fontWeight: FontWeight.w600,
                      fontColor: AppColor.blackColor,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: listInsuranceVerification(),
                    ),
                    SizedBox(
                      height: Dimens.ten,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: Dimens.twenty),
                      child: CommonActionButton(
                        title: AppStrings.next,
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => ClaimAssementStepTwo(
                                      widget.patientDetailsModel)));
                        },
                        borderRadius: Dimens.seven,
                        backgroundColor: AppColor.primaryColor,
                        width: double.maxFinite,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }

  Widget checkListWidget({String? valueString, bool? isChecked, onTap}) {
    String icon;
    if (isChecked == true)
      icon = AppImages.checkmark;
    else
      icon = AppImages.check;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.only(
                top: Dimens.eight, right: Dimens.twelve, bottom: Dimens.eight),
            child: SvgPicture.asset(icon),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: Dimens.eight),
            child: CommonTextWidget(
                height: 1.3,
                text: valueString!,
                fontSize: Dimens.forteen,
                fontWeight: FontWeight.w400,
                fontColor: AppColor.blackColor),
          ),
        ),
      ],
    );
  }

  List<ClaimAssementsModel> itemlistreviewed = [
    ClaimAssementsModel(
        text: AppStrings.equipment_use_instructions, value: false),
    ClaimAssementsModel(
        text: AppStrings.equipment_use_instructions, value: false),
    ClaimAssementsModel(text: AppStrings.costs_and_reimbursement, value: false),
    ClaimAssementsModel(
        text: AppStrings.home_safety_home_fire_safety, value: false),
    ClaimAssementsModel(text: AppStrings.complaint_process, value: false),
    ClaimAssementsModel(text: AppStrings.patient_rights_research, value: false),
    ClaimAssementsModel(
        text: AppStrings.notice_of_privacy_practices, value: false),
    ClaimAssementsModel(
        text: AppStrings.infection_prevention_and_control, value: false),
    ClaimAssementsModel(text: AppStrings.cms_standards, value: false),
    ClaimAssementsModel(text: AppStrings.patient_satisfaction, value: false),
    ClaimAssementsModel(text: AppStrings.patient_falls_education, value: false),
    ClaimAssementsModel(text: AppStrings.policy_notification, value: false),
    ClaimAssementsModel(text: AppStrings.victim_abuse, value: false),
  ];
  List<ClaimAssementsModel> claimCheckList = [
    ClaimAssementsModel(text: AppStrings.equipment_delivered, value: false),
    ClaimAssementsModel(
        text: AppStrings.patient_training_and_home_evaluation_completed,
        value: false),
    ClaimAssementsModel(
        text: AppStrings.vehicle_inspection_completed_for_delivery_date,
        value: false),
  ];
  List<ClaimAssementsModel> itemDeliveryTicket = [
    ClaimAssementsModel(
        text: AppStrings.patient_refused_supplies, value: false),
  ];
  List<ClaimAssementsModel> itemInsuranceVerification = [
    ClaimAssementsModel(text: AppStrings.date, value: false),
    ClaimAssementsModel(text: AppStrings.time, value: false),
    ClaimAssementsModel(text: AppStrings.insurance, value: false),
    ClaimAssementsModel(text: AppStrings.spoke_with, value: false),
    ClaimAssementsModel(text: AppStrings.hcpc_description, value: false),
    ClaimAssementsModel(text: AppStrings.in_out_of_network, value: false),
    ClaimAssementsModel(text: AppStrings.deductible, value: false),
    ClaimAssementsModel(text: AppStrings.coinsurance, value: false),
    ClaimAssementsModel(text: AppStrings.oop, value: false),
  ];

  Widget listReviewed() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: itemlistreviewed.length,
        itemBuilder: (context, position) {
          return checkListWidget(
            valueString: itemlistreviewed[position].text,
            isChecked: itemlistreviewed[position].value,
            onTap: () {
              setState(() {
                if (itemlistreviewed[position].value == false) {
                  itemlistreviewed[position].setValue = true;
                } else
                  itemlistreviewed[position].setValue = false;
              });
            },
          );
        });
  }

  Widget listClamedCheckList() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: claimCheckList.length,
        itemBuilder: (context, position) {
          return checkListWidget(
              valueString: claimCheckList[position].text,
              isChecked: claimCheckList[position].value,
              onTap: () {
                setState(() {
                  if (claimCheckList[position].value == false) {
                    claimCheckList[position].setValue = true;
                  } else
                    claimCheckList[position].setValue = false;
                });
              });
        });
  }

  Widget listInsuranceVerification() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: itemInsuranceVerification.length,
        itemBuilder: (context, position) {
          return checkListWidget(
            valueString: itemInsuranceVerification[position].text,
            isChecked: itemInsuranceVerification[position].value,
            onTap: () {
              setState(() {
                if (itemInsuranceVerification[position].value == false) {
                  itemInsuranceVerification[position].setValue = true;
                } else
                  itemInsuranceVerification[position].setValue = false;
              });
            },
          );
        });
  }

  Widget ListDileveryTicket() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: itemDeliveryTicket.length,
        itemBuilder: (context, position) {
          return GestureDetector(
            child: checkListWidget(
              valueString: itemDeliveryTicket[position].text,
              isChecked: itemDeliveryTicket[position].value,
              onTap: () {
                setState(() {
                  if (itemDeliveryTicket[position].value == false) {
                    itemDeliveryTicket[position].setValue = true;
                  } else
                    itemDeliveryTicket[position].setValue = false;
                });
              },
            ),
          );
        });
  }
}
