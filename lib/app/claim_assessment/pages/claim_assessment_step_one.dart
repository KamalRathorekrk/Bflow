import 'dart:ui';

import 'package:bflow/app/claim_assessment/models/claim_assements_model.dart';
import 'package:bflow/app/claim_assessment/models/post_complete_delivery.dart';
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
  // PatientDetailsModel? patientDetailsModel;
  PostCompleteDelivery? postCompleteDelivery;

  ClaimAssementStepOne({this.postCompleteDelivery});

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
                postCompleteDelivery: widget.postCompleteDelivery,
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
                    // CommonTextWidget(
                    //   text: AppStrings.print_existing_notes_on_delivery_ticket,
                    //   fontSize: Dimens.forteen,
                    //   fontWeight: FontWeight.w600,
                    //   fontColor: AppColor.blackColor,
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(vertical: 8.0),
                    //   child: ListDileveryTicket(),
                    // ),
                    // SizedBox(
                    //   height: Dimens.ten,
                    // ),
                    // CommonTextWidget(
                    //   text: AppStrings.insurance_verification,
                    //   fontSize: Dimens.forteen,
                    //   fontWeight: FontWeight.w600,
                    //   fontColor: AppColor.blackColor,
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(vertical: 8.0),
                    //   child: listInsuranceVerification(),
                    // ),
                    SizedBox(
                      height: Dimens.ten,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: Dimens.twenty),
                      child: CommonActionButton(
                        title: AppStrings.next,
                        onPressed: () {
                          var postCompleteDelivery = PostCompleteDelivery(
                              item:
                              widget.postCompleteDelivery!.item.toString(),
                              claimId: widget.postCompleteDelivery!.claimId,
                              phoneNumber:
                              widget.postCompleteDelivery!.phoneNumber,
                              patientFullName:
                              widget.postCompleteDelivery!.patientFullName,
                              deliveryAddress:
                              widget.postCompleteDelivery!.deliveryAddress,
                              claimAssessmentCheckList:
                              ClaimAssessmentCheckList(
                                  claimAssessmentCheckListDetails:
                                  [
                                    ClaimAssessmentCheckListDetails(
                                        options:itemlistreviewed, header:AppStrings.reviewed_patient),
                                    ClaimAssessmentCheckListDetails(
                                        options:claimCheckList, header:AppStrings.claim_check_list)
                                  ]));
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      ClaimAssementStepTwo(
                                          postCompleteDelivery)));
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

  List<OptionsClaim> itemlistreviewed = [
    OptionsClaim(
        id: 201, name: AppStrings.equipment_use_instructions, isSelected: false),
    OptionsClaim(
        id: 202, name: AppStrings.costs_and_reimbursement, isSelected: false),
    OptionsClaim(
        id: 203,
        name: AppStrings.home_safety_home_fire_safety,
        isSelected: false),
    OptionsClaim(
        id: 204, name: AppStrings.complaint_process, isSelected: false),
    OptionsClaim(
        id: 205, name: AppStrings.patient_rights_research, isSelected: false),
    OptionsClaim(
        id: 206, name: AppStrings.notice_of_privacy_practices, isSelected: false),
    OptionsClaim(
        id: 207,
        name: AppStrings.infection_prevention_and_control,
        isSelected: false),
    OptionsClaim(
        id: 208, name: AppStrings.cms_standards, isSelected: false),
    OptionsClaim(
        id: 209, name: AppStrings.patient_satisfaction, isSelected: false),
    OptionsClaim(
        id: 210, name: AppStrings.patient_falls_education, isSelected: false),
    OptionsClaim(
        id: 211, name: AppStrings.policy_notification, isSelected: false),
    OptionsClaim(
        id: 212, name: AppStrings.victim_abuse, isSelected: false),
  ];
  List<OptionsClaim> claimCheckList = [
    OptionsClaim(
        id: 220, name: AppStrings.equipment_delivered, isSelected: false),
    OptionsClaim(
        id: 221,
        name: AppStrings.patient_training_and_home_evaluation_completed,
        isSelected: false),
    OptionsClaim(
        id: 222,
        name: AppStrings.vehicle_inspection_completed_for_delivery_date,
        isSelected: false),
  ];
  List<ClaimAssementsModel> itemDeliveryTicket = [
    ClaimAssementsModel(
        name: AppStrings.patient_refused_supplies, isSelected: false),
  ];
  List<ClaimAssementsModel> itemInsuranceVerification = [
    ClaimAssementsModel(name: AppStrings.date, isSelected: false),
    ClaimAssementsModel(name: AppStrings.time, isSelected: false),
    ClaimAssementsModel(name: AppStrings.insurance, isSelected: false),
    ClaimAssementsModel(name: AppStrings.spoke_with, isSelected: false),
    ClaimAssementsModel(name: AppStrings.hcpc_description, isSelected: false),
    ClaimAssementsModel(name: AppStrings.in_out_of_network, isSelected: false),
    ClaimAssementsModel(name: AppStrings.deductible, isSelected: false),
    ClaimAssementsModel(name: AppStrings.coinsurance, isSelected: false),
    ClaimAssementsModel(name: AppStrings.oop, isSelected: false),
  ];

  Widget listReviewed() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: itemlistreviewed.length,
        itemBuilder: (context, position) {
          return checkListWidget(
            valueString: itemlistreviewed[position].name,
            isChecked: itemlistreviewed[position].isSelected,
            onTap: () {
              setState(() {
                if (itemlistreviewed[position].isSelected == false) {
                  itemlistreviewed[position].setIsSelected = true;
                } else
                  itemlistreviewed[position].setIsSelected = false;
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
              valueString: claimCheckList[position].name,
              isChecked: claimCheckList[position].isSelected,
              onTap: () {
                setState(() {
                  if (claimCheckList[position].isSelected == false) {
                    claimCheckList[position].setIsSelected = true;
                  } else
                    claimCheckList[position].setIsSelected = false;
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
            valueString: itemInsuranceVerification[position].name,
            isChecked: itemInsuranceVerification[position].isSelected,
            onTap: () {
              setState(() {
                if (itemInsuranceVerification[position].isSelected == false) {
                  itemInsuranceVerification[position].setIsSelected = true;
                } else
                  itemInsuranceVerification[position].setIsSelected = false;
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
              valueString: itemDeliveryTicket[position].name,
              isChecked: itemDeliveryTicket[position].isSelected,
              onTap: () {
                setState(() {
                  if (itemDeliveryTicket[position].isSelected == false) {
                    itemDeliveryTicket[position].setIsSelected = true;
                  } else
                    itemDeliveryTicket[position].setIsSelected = false;
                });
              },
            ),
          );
        });
  }
}
