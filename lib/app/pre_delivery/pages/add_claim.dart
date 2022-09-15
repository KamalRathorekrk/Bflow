import 'package:bflow/app/common_widget/common_action_button.dart';
import 'package:bflow/app/common_widget/common_app_bar.dart';
import 'package:bflow/app/common_widget/common_text_widget.dart';
import 'package:bflow/app/common_widget/common_textfiled_multiline.dart';
import 'package:bflow/app/common_widget/custom_progress_indicator.dart';
import 'package:bflow/app/common_widget/snackbar/utils.dart';
import 'package:bflow/app/pre_delivery/bloc/pre_delivery_block.dart';
import 'package:bflow/app/pre_delivery/model/PreDeliveryIdModel.dart';
import 'package:bflow/app/pre_delivery/model/PreDeliverySaveModel.dart';
import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppImages.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;


class AddClaim extends StatefulWidget {
  String claimId;

  AddClaim({required this.claimId});

  @override
  _AddClaimState createState() => _AddClaimState();
}

class _AddClaimState extends State<AddClaim> {
  final _addClaimNotesController = TextEditingController();
  PreDeliveryBloc? preDeliveryBloc;
  int serviceLineId = 0, serviceLineinventoryId = 0;
  DateTime? datetimeDelivery;
  List<String> checkListItem = [
    AppStrings.pick_equipment,
    AppStrings.complete_equipment_inspection_log,
    AppStrings.print_delivery_ticket_and_delivery_packet,
    AppStrings.verify_delivery_address_and_time,
  ];
  List<bool> _isCheckedClaim = [];
  List<InventoryOptions> _inventoryOptions = [];
  String? _description = "";

  @override
  void initState() {
    preDeliveryBloc = PreDeliveryBloc();
    _isCheckedClaim = List<bool>.filled(checkListItem.length, false);
    callApi();
    super.initState();
  }

  callApi() async {
    preDeliveryBloc!
        .getPreClaimDetails(context: context, claimID: widget.claimId);
    preDeliveryBloc!
        .getClaimPreChecklist(context: context, claimID: widget.claimId);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColor.offWhiteColor));
    return Stack(
      children: [
        StreamBuilder<PreDeliveryIdModel>(
          stream: preDeliveryBloc!.preClaimDetailsStream,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              PreDeliveryObject? preDeliveryClaimObject =
                  snapshot.data!.responseObject;
              return Scaffold(
                appBar: CommonAppBar(
                  text: "Claim: #${preDeliveryClaimObject!.claimId}",
                ),
                body: SingleChildScrollView(
                  controller: ScrollController(),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimens.twenty, vertical: Dimens.ten),
                    color: AppColor.offWhiteColor,

                    // width: double.infinity,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              PatientDetailsContainer(
                                  address:
                                      "${preDeliveryClaimObject.deliveryAddress!.address.toString()}, ${preDeliveryClaimObject.deliveryAddress!.city.toString()}, ${preDeliveryClaimObject.deliveryAddress!.state.toString()}",
                                  name: preDeliveryClaimObject.patientName
                                      .toString(),
                                  phone: preDeliveryClaimObject.phoneNumber
                                      .toString(),
                                  zipCode: preDeliveryClaimObject
                                      .deliveryAddress!.zipCode
                                      .toString()),
                              SizedBox(
                                height: Dimens.twenty,
                              ),
                              DetailsContainer(preDeliveryClaimObject.items!),
                              SizedBox(
                                height: Dimens.twenty,
                              ),
                              checkListWidget(
                                  preDeliveryClaimObject.checkListDetails!),
                              SizedBox(
                                height: Dimens.twenty,
                              ),
                              CommonTextFieldMultiLine(
                                textEditingController: _addClaimNotesController,
                                borderColor: AppColor.hintTextColor,
                                color: AppColor.hintTextColor,
                                hintText: AppStrings.add_claim_notes,
                                maxLines: 8,
                                minLines: 7,
                              ),
                              SizedBox(
                                height: Dimens.twenty,
                              ),
                              CommonActionButton(
                                title: AppStrings.submit_and_schedule_delivery,
                                onPressed: () {
                                  if(serviceLineId==null||serviceLineId==0){
                                    SnackBarUtils.showErrorSnackBar(
                                        "Please Select Equipment",context);
                                  }else if(datetimeDelivery==null||datetimeDelivery==""){
                                    SnackBarUtils.showErrorSnackBar(
                                        "Please Select Date and Time of Delivery",context);
                                  }
                                  else{
                                    PreDeliverySave _preDeliverySave =
                                        PreDeliverySave(
                                      claimId: snapshot
                                          .data!.responseObject!.claimId,
                                      checkListDetails: snapshot.data!
                                          .responseObject!.checkListDetails![0],
                                      note:
                                          _addClaimNotesController.text.trim(),
                                      deliveryDate: datetimeDelivery.toString(),
                                      serviceLines: [
                                        ServiceLines(
                                            id: serviceLineId,
                                            inventoryId: serviceLineinventoryId)
                                      ],
                                    );
                                    preDeliveryBloc!.completePreDelivery(
                                        preDeliverySave: _preDeliverySave,
                                        context: context);
                                  }
                                  // Navigator.pop(context);
                                },
                                borderRadius: Dimens.seven,
                                backgroundColor: AppColor.primaryColor,
                                width: double.maxFinite,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else
              return Container();
          },
        ),
        StreamBuilder<bool>(
          stream: preDeliveryBloc!.progressStream,
          builder: (context, snapshot) {
            return Center(
                child: CommmonProgressIndicator(
                    snapshot.hasData ? snapshot.data! : false));
          },
        ),
      ],
    );
  }

  Widget PatientDetailsContainer({name, address, zipCode, phone}) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Dimens.fifteen,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonTextWidget(
                    text: AppStrings.patient_name,
                    fontSize: Dimens.thrteen,
                    fontColor: AppColor.blackColor,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: Dimens.eight,
                  ),
                  CommonTextWidget(
                    text: name,
                    fontSize: Dimens.forteen,
                    fontColor: AppColor.blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: Dimens.ten),
                child: GestureDetector(
                  onTap: (){
                    UrlLauncher.launch("tel://$phone");
                  },
                    child: SvgPicture.asset(AppImages.call)),
              )
            ],
          ),
          SizedBox(
            height: Dimens.twenty,
          ),
          Divider(
            thickness: 1,
            height: Dimens.two,
            color: AppColor.offWhite17Color,
          ),
          SizedBox(height: Dimens.twenty),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonTextWidget(
                    text: AppStrings.delivery_address,
                    fontSize: Dimens.thrteen,
                    fontColor: AppColor.blackColor,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: Dimens.eight,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: Dimens.four),
                        child: SvgPicture.asset(AppImages.location),
                      ),
                      CommonTextWidget(
                        text: address,
                        fontSize: Dimens.forteen,
                        fontColor: AppColor.blackColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: Dimens.twenty),
          Divider(
            thickness: 1,
            height: Dimens.two,
            color: AppColor.offWhite17Color,
          ),
          SizedBox(
            height: Dimens.twenty,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonTextWidget(
                    text: AppStrings.zip_code,
                    fontSize: Dimens.thrteen,
                    fontColor: AppColor.blackColor,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: Dimens.eight,
                  ),
                  CommonTextWidget(
                    text: zipCode,
                    fontSize: Dimens.forteen,
                    fontColor: AppColor.blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              InkWell(
                onTap: () async {
                  await MapsLauncher.launchQuery(address);
                  // print("----");
                  // await MapsLauncher.launchCoordinates(
                  //     37.4220041, -122.0862462, 'Google Headquarters are here');
                },
                child: Padding(
                  padding: EdgeInsets.only(right: Dimens.ten),
                  child: Text(AppStrings.view_on_map,
                      style: TextStyle(
                        shadows: [
                          Shadow(
                              color: AppColor.backgroundColor,
                              offset: Offset(0, -2))
                        ],
                        color: Colors.transparent,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColor.backgroundColor,
                        fontWeight: FontWeight.w600,
                        fontSize: Dimens.thrteen,
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Dimens.twenty,
          ),
        ],
      ),
    );
  }

  Widget DetailsContainer(List<Items> items) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Dimens.fifteen,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonTextWidget(
                            text: AppStrings.select_equipment,
                            fontSize: Dimens.thrteen,
                            fontColor: AppColor.blackColor,
                            fontWeight: FontWeight.w400,
                          ),
                          dropDownWidget(items),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    height: Dimens.two,
                    color: AppColor.offWhite17Color,
                  ),
                  SizedBox(
                    height: Dimens.twenty,
                  ),
                  CommonTextWidget(
                    text: AppStrings.description,
                    fontSize: Dimens.thrteen,
                    fontColor: AppColor.blackColor,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: Dimens.eight,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: CommonTextWidget(
                      text: _description ?? "",
                      fontSize: Dimens.forteen,
                      fontColor: AppColor.blackColor,
                      fontWeight: FontWeight.w500,overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: Dimens.twenty,
          ),
          Divider(
            thickness: 1,
            height: Dimens.two,
            color: AppColor.offWhite17Color,
          ),
          SizedBox(height: Dimens.twenty),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonTextWidget(
                    text: AppStrings.select_model,
                    fontSize: Dimens.thrteen,
                    fontColor: AppColor.blackColor,
                    fontWeight: FontWeight.w400,
                  ),
                  dropDownModelWidget(_inventoryOptions),
                ],
              ),
            ],
          ),
          Divider(
            thickness: 1,
            height: Dimens.two,
            color: AppColor.offWhite17Color,
          ),
          SizedBox(
            height: Dimens.twenty,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonTextWidget(
                text: AppStrings.date_time_of_delivery,
                fontSize: Dimens.thrteen,
                fontColor: AppColor.blackColor,
                fontWeight: FontWeight.w400,
              ),
              InkWell(
                onTap: () {
                  twoButtonCommonDialog(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(right: Dimens.four),
                  child: SvgPicture.asset(
                    AppImages.calender,
                    width: Dimens.twentyFour,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Dimens.twenty,
          ),
        ],
      ),
    );
  }

  // Widget checkListWidget() {
  //   return StreamBuilder<CheckListObject>(
  //       stream: preDeliveryBloc!.claimChecklistStream,
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           return Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               CommonTextWidget(
  //                 text: AppStrings.complete_checklist,
  //                 fontSize: Dimens.forteen,
  //                 fontWeight: FontWeight.w600,
  //                 fontColor: AppColor.blackColor,
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.symmetric(vertical: Dimens.fifteen),
  //                 child: ListView.builder(
  //                     shrinkWrap: true,
  //                     physics: NeverScrollableScrollPhysics(),
  //                     padding: EdgeInsets.zero,
  //                     itemCount:
  //                         snapshot.data!.checkListDetails![0].options!.length,
  //                     itemBuilder: (context, position) {
  //                       return GestureDetector(
  //                           onTap: () {
  //                             setState(() {
  //                               if (snapshot.data!.checkListDetails![0]
  //                                       .options![position].isSelected ==
  //                                   true) {
  //                                 snapshot.data!.checkListDetails![0]
  //                                     .options![position].isSelectedSet = false;
  //                               } else {
  //                                 snapshot.data!.checkListDetails![0]
  //                                     .options![position].isSelectedSet = true;
  //                               }
  //                             });
  //                           },
  //                           child: rowElement(
  //                               valueString: snapshot.data!.checkListDetails![0]
  //                                   .options![position].name,
  //                               isChecked: _isCheckedClaim[position]));
  //                     }),
  //               ),
  //             ],
  //           );
  //         } else {
  //           return Container();
  //         }
  //       });
  // }
  Widget checkListWidget2({String? valueString, bool? isChecked, onTap}) {
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

  Widget checkListWidget(List<PreCheckListDetails> preCheckListDetails) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: preCheckListDetails.length,
        itemBuilder: (context, position) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextWidget(
                text: preCheckListDetails[position].header.toString(),
                fontSize: Dimens.forteen,
                fontWeight: FontWeight.w600,
                fontColor: AppColor.blackColor,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: preCheckListDetails[position].options!.length,
                      itemBuilder: (context, index) {
                        return checkListWidget2(
                            valueString: preCheckListDetails[position]
                                .options![index]
                                .name,
                            isChecked: preCheckListDetails[position]
                                .options![index]
                                .isSelected,
                            onTap: () {
                              setState(() {
                                if (preCheckListDetails[position]
                                        .options![index]
                                        .isSelected ==
                                    false) {
                                  preCheckListDetails[position]
                                      .options![index]
                                      .isSelectedSet = true;
                                } else
                                  preCheckListDetails[position]
                                      .options![index]
                                      .isSelectedSet = false;
                              });
                            });
                      }))
            ],
          );
        });
    /* return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonTextWidget(
                  text: AppStrings.complete_checklist,
                  fontSize: Dimens.forteen,
                  fontWeight: FontWeight.w600,
                  fontColor: AppColor.blackColor,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Dimens.fifteen),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount:
                      preCheckListDetails.options!.length,
                      itemBuilder: (context, position) {
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (preCheckListDetails
                                        .options![position].isSelected ==
                                    true) {
                                  snapshot.data!.checkListDetails![0]
                                      .options![position].isSelectedSet = false;
                                } else {
                                  snapshot.data!.checkListDetails![0]
                                      .options![position].isSelectedSet = true;
                                }
                              });
                            },
                            child: rowElement(
                                valueString: snapshot.data!.checkListDetails![0]
                                    .options![position].name,
                                isChecked: _isCheckedClaim[position]));
                      }),
                ),
              ],
            );*/
  }

  Widget rowElement({String? valueString, bool? isChecked}) {
    String icon;
    if (isChecked == true)
      icon = AppImages.checkmark;
    else
      icon = AppImages.check;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: Dimens.eight, right: Dimens.twelve, bottom: Dimens.eight),
          child: SvgPicture.asset(icon),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: Dimens.five),
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

  void twoButtonCommonDialog(BuildContext context) async {
    DateTime dateTime = datetimeDelivery ?? DateTime.now();
    final DateFormat formatter = DateFormat('EE MMMM dd,yyyy');
    final DateFormat formatterTime = DateFormat.jm();
    String? tempPickedDate = formatter.format(dateTime);
    String? tempPickedTime = formatterTime.format(dateTime);
    return showDialog(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            actionsPadding: EdgeInsets.zero,
            buttonPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColor.offWhite42Color),
              borderRadius: BorderRadius.all(Radius.circular(Dimens.fifteen)),
            ),
            title: CommonTextWidget(
              text: AppStrings.set_date_and_time_of_delivery,
              fontSize: Dimens.sixteen,
              textAlignment: TextAlign.center,
              fontWeight: FontWeight.w500,
              fontColor: AppColor.blackColor,
            ),
            content: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.24,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.dateAndTime,
                      initialDateTime: datetimeDelivery ?? DateTime.now(),
                      onDateTimeChanged: (DateTime dateTime) {
                        setState(() {});
                        datetimeDelivery = dateTime;
                        tempPickedDate = formatter.format(dateTime);
                        tempPickedTime = formatterTime.format(dateTime);
                      },
                    ),
                  ),
                  SizedBox(
                    height: Dimens.twenty,
                  ),
                  CommonTextWidget(
                    text: tempPickedDate.toString(),
                    fontSize: Dimens.twenty,
                    fontWeight: FontWeight.w600,
                    fontColor: AppColor.blackColor,
                  ),
                  SizedBox(
                    height: Dimens.ten,
                  ),
                  CommonTextWidget(
                    text: tempPickedTime.toString(),
                    fontSize: Dimens.seventeen,
                    fontWeight: FontWeight.w500,
                    fontColor: AppColor.blackColor,
                  ),
                ],
              ),
            ),
            actions: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    thickness: Dimens.one,
                    height: Dimens.one,
                    color: AppColor.offWhite42Color,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: CommonTextWidget(
                              text: AppStrings.cancel.toUpperCase(),
                              fontSize: Dimens.seventeen,
                              fontWeight: FontWeight.w600,
                              fontColor: AppColor.redColor,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: Dimens.one,
                        height: Dimens.fifty,
                        color: AppColor.offWhite42Color,
                      ),
                      Expanded(
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: CommonTextWidget(
                              text: AppStrings.ok.toUpperCase(),
                              fontSize: Dimens.seventeen,
                              fontWeight: FontWeight.w600,
                              fontColor: AppColor.blueColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        });
      },
    );
  }

  Widget dropDownWidget(List<Items> item) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white))),
        hint: CommonTextWidget(
          text: "",
          fontSize: Dimens.forteen,
          fontWeight: FontWeight.w500,
          fontColor: AppColor.blackColor,
        ),
        items: item.map((label) {
          return DropdownMenuItem(
            child: Container(
              color: AppColor.whiteColor,
              child: CommonTextWidget(
                text: label.id.toString(),
                fontSize: Dimens.forteen,
                fontColor: AppColor.blackColor,
                fontWeight: FontWeight.w500,
                textAlignment: TextAlign.left,
              ),
            ),
            value: label,
          );
        }).toList(),
        dropdownColor: AppColor.whiteColor,
        onChanged: (Items? value) {
          setState(() {
            print(value!.description.toString());
            serviceLineId = value.id ?? 0;
            _description = value.description;
            _inventoryOptions = value.inventoryOptions!;
          });
        },
      ),
    );
  }

  Widget dropDownModelWidget(List<InventoryOptions> inventoryOptions) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: DropdownButtonFormField(
        isExpanded: true,
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white))),
        hint: CommonTextWidget(
          text: "",
          fontSize: Dimens.forteen,
          fontWeight: FontWeight.w500,
          fontColor: AppColor.blackColor,
        ),
        items: inventoryOptions.map((label) {
          return DropdownMenuItem(
            child: Container(
              color: AppColor.whiteColor,
              child: CommonTextWidget(
                text: label.displayText.toString(),
                fontSize: Dimens.forteen,
                fontColor: AppColor.blackColor,
                fontWeight: FontWeight.w500,
                textAlignment: TextAlign.left,
              ),
            ),
            value: label,
          );
        }).toList(),
        dropdownColor: AppColor.whiteColor,
        onChanged: (InventoryOptions? value) {
          serviceLineinventoryId = value!.id ?? 0;

          setState(() {});
        },
      ),
    );
  }
}
