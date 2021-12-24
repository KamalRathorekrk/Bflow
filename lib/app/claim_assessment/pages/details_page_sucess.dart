import 'package:bflow/app/common_widget/common_app_bar.dart';
import 'package:bflow/app/common_widget/common_text_field_simple.dart';
import 'package:bflow/app/common_widget/common_text_widget.dart';
import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppImages.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsPageSucess extends StatefulWidget {
  @override
  _DetailsPageSucessState createState() => _DetailsPageSucessState();
}

class _DetailsPageSucessState extends State<DetailsPageSucess> {
  final _nameController = TextEditingController(text: 'Albert Smith');
  final _titleController = TextEditingController(text: 'Delivery');
  final _reasonSignedController = TextEditingController(text: 'Not Present');
  final _phoneNumberController = TextEditingController(text: '91-9991818999');
  final _whoReceviedController = TextEditingController(text: 'Care Giver');

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
          padding: EdgeInsets.symmetric(
              horizontal: Dimens.twenty, vertical: Dimens.ten),
          color: AppColor.offWhiteColor,
          child: Column(
            children: [
              CenterContainer(),
              reviewedServices(),
              ReciverDetailsConatiner(context),
              photoContainer()
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
              child: Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: SvgPicture.asset(AppImages.tick),
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<String> itemlistreviewed = [
    AppStrings.equipment_use_instructions,
    AppStrings.costs_and_reimbursement,
    AppStrings.home_safety_home_fire_safety,
    AppStrings.complaint_process,
    AppStrings.patient_rights_research,
    AppStrings.notice_of_privacy_practices,
    AppStrings.infection_prevention_and_control,
    AppStrings.cms_standards,
    AppStrings.patient_satisfaction,
    AppStrings.patient_falls_education,
    AppStrings.policy_notification,
    AppStrings.victim_abuse,
  ];
  List<String> claimCheckList = [
    AppStrings.equipment_delivered,
    AppStrings.patient_training_and_home_evaluation_completed,
    AppStrings.vehicle_inspection_completed_for_delivery_date,
  ];
  List<String> itemInsuranceVerification = [
    AppStrings.date,
    AppStrings.time,
    AppStrings.insurance,
    AppStrings.spoke_with,
    AppStrings.hcpc_description,
    AppStrings.in_out_of_network,
    AppStrings.deductible,
    AppStrings.coinsurance,
    AppStrings.oop,
  ];

  Widget ListReviewed() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: itemlistreviewed.length,
        itemBuilder: (context, position) {
          return CheckListWidget(valueString: itemlistreviewed[position]);
        });
  }

  Widget ListClamedCheckList() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: claimCheckList.length,
        itemBuilder: (context, position) {
          return CheckListWidget(valueString: claimCheckList[position]);
        });
  }

  Widget ListInsuranceVerification() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: itemInsuranceVerification.length,
        itemBuilder: (context, position) {
          return CheckListWidget(
              valueString: itemInsuranceVerification[position]);
        });
  }

  Widget CheckListWidget({String? valueString}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: Dimens.eight, right: Dimens.twelve, bottom: Dimens.eight),
          child: SvgPicture.asset(AppImages.tick_new),
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

  Widget reviewedServices() {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Dimens.twenty, horizontal: Dimens.fifteen),
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
            child: ListReviewed(),
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
            child: ListClamedCheckList(),
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
              child: CheckListWidget(
                  valueString: AppStrings.patient_refused_supplies)),
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
            child: ListInsuranceVerification(),
          ),
          SizedBox(
            height: Dimens.ten,
          ),
        ],
      ),
    );
  }

  Widget ReciverDetailsConatiner(BuildContext context) {
    return Container(
      color: AppColor.offWhiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextWidget(
            text: AppStrings.who_received,
            fontSize: Dimens.fifteen,
            fontWeight: FontWeight.w500,
            fontColor: AppColor.blackColor,
          ),
          SizedBox(
            height: Dimens.fifteen,
          ),
          CommonTextFieldSimple(
            readOnly: true,
            textEditingController: _whoReceviedController,
            borderColor: AppColor.offWhite97Color,
            hintText: "",
          ),
          SizedBox(
            height: Dimens.twenty,
          ),
          CommonTextWidget(
            text: AppStrings.if_not_the_patient,
            fontSize: Dimens.fifteen,
            fontWeight: FontWeight.w500,
            fontColor: AppColor.blackColor,
          ),
          SizedBox(
            height: Dimens.twenty,
          ),
          CommonTextFieldSimple(
            readOnly: true,
            textEditingController: _nameController,
            borderColor: AppColor.offWhite97Color,
            hintText: "",
          ),
          CommonTextFieldSimple(
            readOnly: true,
            textEditingController: _titleController,
            borderColor: AppColor.offWhite97Color,
            hintText: "",
          ),
          CommonTextFieldSimple(
            readOnly: true,
            textEditingController: _reasonSignedController,
            borderColor: AppColor.offWhite97Color,
            hintText: "",
          ),
          CommonTextFieldSimple(
            readOnly: true,
            textEditingController: _phoneNumberController,
            borderColor: AppColor.offWhite97Color,
            hintText: "",
          ),
          SizedBox(
            height: Dimens.ten,
          ),
          SizedBox(
            height: Dimens.ten,
          ),
        ],
      ),
    );
  }

  Widget photoContainer() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextWidget(
            text: AppStrings.photos,
            fontSize: Dimens.forteen,
            fontWeight: FontWeight.w600,
            fontColor: AppColor.blackColor,
          ),
          SizedBox(
            height: Dimens.ten,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                    right: Dimens.ten, top: Dimens.ten, bottom: Dimens.ten),
                height: 105,
                width: 105,
                color: AppColor.offWhite17Color,
              ),
              Container(
                margin: EdgeInsets.all(Dimens.ten),
                height: 105,
                width: 105,
                color: AppColor.offWhite17Color,
              )
            ],
          ),
          SizedBox(
            height: Dimens.twenty,
          ),
          CommonTextWidget(
            text: AppStrings.claim_notes,
            fontSize: Dimens.forteen,
            fontWeight: FontWeight.w600,
            fontColor: AppColor.blackColor,
          ),
          SizedBox(
            height: Dimens.ten,
          ),
          CommonTextWidget(
            text:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            fontSize: Dimens.forteen,
            fontWeight: FontWeight.w400,
            fontColor: AppColor.blackColor,
            maxLines: 7,
            height: 1.4,
          ),
          SizedBox(
            height: Dimens.twenty,
          ),
          CommonTextWidget(
            text: AppStrings.receivers_signature,
            fontSize: Dimens.forteen,
            fontWeight: FontWeight.w600,
            fontColor: AppColor.blackColor,
          ),
          SizedBox(
            height: Dimens.ten,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 305,
                height: 120,
                color: AppColor.offWhite17Color,
                child: Center(
                  child: Image(
                    image: AssetImage(AppImages.signature),
                    width: 166,
                    height: 103,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
