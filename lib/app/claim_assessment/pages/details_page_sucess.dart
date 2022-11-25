import 'package:bflow/app/claim_assessment/bloc/getCheckListBlock.dart';
import 'package:bflow/app/claim_assessment/models/get_check_list_model.dart';
import 'package:bflow/app/common_widget/common_app_bar.dart';
import 'package:bflow/app/common_widget/common_text_field_simple.dart';
import 'package:bflow/app/common_widget/common_text_widget.dart';
import 'package:bflow/app/common_widget/custom_progress_indicator.dart';
import 'package:bflow/app/routes_activity_list/model/get_routes_list.dart';
import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppImages.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsPageSucess extends StatefulWidget {
  ResponseRoutes responseRoutes;

  DetailsPageSucess({required this.responseRoutes});

  @override
  _DetailsPageSucessState createState() => _DetailsPageSucessState();
}

class _DetailsPageSucessState extends State<DetailsPageSucess> {
  var _nameController = TextEditingController(text: "");
  var _titleController = TextEditingController(text: '');
  var _reasonSignedController = TextEditingController(text: '');
  var _phoneNumberController = TextEditingController(text: '');
  var _whoReceviedController = TextEditingController(text: '');
  CheckListBlock? _checkListBlock;

  @override
  void initState() {
    _checkListBlock = CheckListBlock();
    _whoReceviedController = TextEditingController(
        text:
            "${whorecived[int.parse(widget.responseRoutes.careGiverId ?? "3") - 1] ?? ""}");
    _nameController = TextEditingController(
        text: "${widget.responseRoutes.careGiverName ?? ""}");
    _phoneNumberController = TextEditingController(
        text: "${widget.responseRoutes.careGiverSignedPhone ?? ""}");
    _titleController = TextEditingController(
        text: "${widget.responseRoutes.careGiverTitle ?? ""}");
    _reasonSignedController = TextEditingController(
        text: "${widget.responseRoutes.careGiverReasonSigned ?? ""}");
    _checkListBlock!.getCheckList(widget.responseRoutes.orderId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColor.offWhiteColor));
    return Scaffold(
      appBar: CommonAppBar(
        text: "Claim: #${widget.responseRoutes.orderId}",
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: ScrollController(),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimens.twenty, vertical: Dimens.ten),
              color: AppColor.offWhiteColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CenterContainer(widget.responseRoutes),
                  reviewedServices(),
                  // SizedBox(
                  //   height: Dimens.fifteen,
                  // ),
                  ReciverDetailsConatiner(context, widget.responseRoutes),
                  photoContainer(widget.responseRoutes)
                ],
              ),
            ),
          ),
          StreamBuilder<bool>(
            stream: _checkListBlock!.progressStream,
            builder: (context, snapshot) {
              return Center(
                  child: CommmonProgressIndicator(
                      snapshot.hasData ? snapshot.data! : false));
            },
          ),
        ],
      ),
    );
  }

  Widget CenterContainer(ResponseRoutes data) {
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
              value: data.items!.isNotEmpty
                  ? data.items![0].description ?? ""
                  : "",
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
          RowElement(
              title: AppStrings.patient_name, value: data.patientFullName),
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
              value: "${data.address}, ${data.city}, ${data.state}"),
          SizedBox(height: Dimens.twenty),
          Divider(
            thickness: 1,
            height: Dimens.two,
            color: AppColor.offWhite17Color,
          ),
          SizedBox(
            height: Dimens.twenty,
          ),
          RowElement(title: AppStrings.zip_code, value: "${data.zipcode}"),
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
          RowElement(
              title: AppStrings.phone_number,
              value: "${data.phoneNumber ?? ""}".replaceAllMapped(
                  RegExp(r'(\d{3})(\d{3})(\d+)'),
                  (Match m) => "(${m[1]}) ${m[2]}-${m[3]}")),
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
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  Visibility(
                      visible: icon ?? false,
                      child: Padding(
                        padding: EdgeInsets.only(right: Dimens.four),
                        child: SvgPicture.asset(AppImages.location),
                      )),
                  Expanded(
                    child: CommonTextWidget(
                      text: "${value}",
                      fontSize: Dimens.forteen,
                      fontColor: AppColor.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Visibility(
                visible: show ?? false,
                child: Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: SvgPicture.asset(AppImages.tick),
                ),
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
  List whorecived = ["POA", "Relative", "Other"];

  Widget ListReviewed(data) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: data.length,
        itemBuilder: (context, position) {
          return CheckListWidget(valueString: data[position].name);
        });
  }

  // Widget ListClamedCheckList(data) {
  //   return ListView.builder(
  //       shrinkWrap: true,
  //       physics: NeverScrollableScrollPhysics(),
  //       padding: EdgeInsets.zero,
  //       itemCount: data.length,
  //       itemBuilder: (context, position) {
  //         return CheckListWidget(valueString: data[position].name);
  //       });
  // }

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
    return StreamBuilder<CheckList>(
        stream: _checkListBlock!.checkListStream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            print(snapshot.data!.claimAssessmentCheckListDetails!.length);
            if (snapshot.data!.claimAssessmentCheckListDetails != null) {
              var data = snapshot.data!;
              return Container(
                padding: EdgeInsets.symmetric(
                    vertical: Dimens.twenty, horizontal: Dimens.fifteen),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        // scrollDirection: Axis.horizontal,
                        itemCount: data.claimAssessmentCheckListDetails!.length,
                        itemBuilder: (context, position) {
                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonTextWidget(
                                  text: data
                                      .claimAssessmentCheckListDetails![
                                          position]
                                      .header
                                      .toString(),
                                  fontSize: Dimens.forteen,
                                  fontWeight: FontWeight.w600,
                                  fontColor: AppColor.blackColor,
                                ),
                                ListReviewed(data
                                    .claimAssessmentCheckListDetails![position]
                                    .options),
                              ]);
                        }),
                  ],
                ),
              );
            } else
              return Container();
          } else {
            return Container();
          }
        });
  }

  Widget ReciverDetailsConatiner(BuildContext context, ResponseRoutes data) {
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
            labelText: "",
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
            labelText: "",
          ),
          CommonTextFieldSimple(
            readOnly: true,
            textEditingController: _titleController,
            borderColor: AppColor.offWhite97Color,
            labelText: "",
          ),
          CommonTextFieldSimple(
            readOnly: true,
            textEditingController: _reasonSignedController,
            borderColor: AppColor.offWhite97Color,
            labelText: "",
          ),
          CommonTextFieldSimple(
            readOnly: true,
            textEditingController: _phoneNumberController,
            borderColor: AppColor.offWhite97Color,
            labelText: "",
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

  Widget photoContainer(ResponseRoutes data) {
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
          imageContainer(data.attachments),
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
            text: data.notes?[0] ?? "",
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
          signatureContainer(data.signature),
          SizedBox(
            height: Dimens.thirty,
          ),
          // Center(child: imageContainer(data.signature)),
        ],
      ),
    );
  }

  Widget imageContainer(imageList) {
    if (imageList.length == 0) return Container();
    return Container(
      height: Dimens.oneForty,
      child: ListView.builder(
          shrinkWrap: true,
          // physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: imageList.length,
          itemBuilder: (context, position) {
            return Container(
                // color: Colors.red,
                height: 115,
                width: 115,
                margin: EdgeInsets.only(
                  left: Dimens.ten,
                ),
                child: Container(
                  margin: EdgeInsets.only(top: Dimens.ten),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColor.hintColor, width: Dimens.one)),
                  height: Dimens.hundred,
                  width: Dimens.hundred,
                  child: Image.network(
                    imageList[position].url,
                    fit: BoxFit.fill,
                    errorBuilder: (c, s, e) {
                      return SizedBox();
                    },
                  ),
                ));
          }),
    );
  }

  Widget signatureContainer(imageList) {
    if (imageList.length == 0)
      return Container();
    else
      return Container(
          color: Colors.white,
          height: 200,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(
            left: Dimens.ten,
          ),
          padding: EdgeInsets.only(
            left: Dimens.ten,
          ),
          child: Image.network(
            imageList[0].url,
            fit: BoxFit.contain,
            errorBuilder: (c, s, e) {
              return SizedBox();
            },
          ));
  }
}
