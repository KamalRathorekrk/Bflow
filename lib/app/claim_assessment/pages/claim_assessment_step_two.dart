import 'dart:convert';
import 'dart:io';

import 'package:bflow/app/claim_assessment/bloc/claims_assessment_bloc.dart';
import 'package:bflow/app/claim_assessment/models/post_complete_delivery.dart';
import 'package:bflow/app/claim_assessment/models/who_received_model.dart';
import 'package:bflow/app/claim_assessment/pages/claim_assessment_step_three.dart';
import 'package:bflow/app/common_widget/common_action_button.dart';
import 'package:bflow/app/common_widget/common_app_bar.dart';
import 'package:bflow/app/common_widget/common_header.dart';
import 'package:bflow/app/common_widget/common_text_field_simple.dart';
import 'package:bflow/app/common_widget/common_text_widget.dart';
import 'package:bflow/app/common_widget/common_textfiled_multiline.dart';
import 'package:bflow/app/common_widget/snackbar/utils.dart';
import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppImages.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/CommonUtils.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ClaimAssementStepTwo extends StatefulWidget {
  PostCompleteDelivery? postCompleteDelivery;

  ClaimAssementStepTwo(this.postCompleteDelivery);

  @override
  _ClaimAssementStepTwoState createState() => _ClaimAssementStepTwoState();
}

class _ClaimAssementStepTwoState extends State<ClaimAssementStepTwo> {
  final ImagePicker _picker = ImagePicker();
  List<File> imageList = [];
  ReceiverData? whoRecived;
  String whoRecivedString = "";
  final _nameController = TextEditingController();
  final _titleController = TextEditingController();
  final _reasonSignedController = TextEditingController();
  final _signedPhoneController = TextEditingController();
  final _addClaimNotesController = TextEditingController();
  final _nameFocusNode = FocusNode();
  final _titleFocusNode = FocusNode();
  final _reasonSignedFocusNode = FocusNode();
  final _signedPhoneFocusNode = FocusNode();
  final _addClaimNotesFocusNode = FocusNode();
  ClaimAssementsBloc? _claimAssementsBloc;
  CompleteClaimAssessment? completeClaimAssessment;

  PhoneCountryData? _countryData;

  @override
  void initState() {
    _claimAssementsBloc = ClaimAssementsBloc();
    _claimAssementsBloc!.whoReceived(context: context);
    permissionAccess();
    super.initState();
  }

  void _onCountrySelected(PhoneCountryData? countryData) {
    setState(() {
      _countryData = countryData;
    });
  }

  Future<void> permissionAccess() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.storage,
      Permission.photos
    ].request();
    print(statuses[Permission.camera]);
    print(statuses[Permission.storage]);
    if (await Permission.camera.request().isGranted) {
      print("Camera permission granted");
    }
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
                step: 2,
                postCompleteDelivery: widget.postCompleteDelivery,
              ),
              SizedBox(
                height: Dimens.twenty,
              ),
              innerConatiner(context),
            ]),
          ),
        ));
  }

  Widget innerConatiner(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Dimens.twenty, horizontal: Dimens.twenty),
      color: AppColor.offWhiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder<List<ReceiverData>>(
              stream: _claimAssementsBloc!.whoReceviedStream,
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.data != null &&
                    snapshot.data!.length > 0) {
                  return dropDownWidget(receiverData: snapshot.data);
                } else {
                  return dropDownWidget(receiverData: []);
                }
              }),
          SizedBox(
            height: Dimens.thirty,
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
            textEditingController: _nameController,
            borderColor: AppColor.offWhite97Color,
            labelText: AppStrings.name,
            color: AppColor.hintTextColor,
            focusNode: _nameFocusNode,
            onSubmit: (val) =>
                FocusScope.of(context).requestFocus(_titleFocusNode),
          ),
          CommonTextFieldSimple(
            textEditingController: _titleController,
            borderColor: AppColor.offWhite97Color,
            labelText: AppStrings.title,
            color: AppColor.hintTextColor,
            focusNode: _titleFocusNode,
            onSubmit: (val) =>
                FocusScope.of(context).requestFocus(_reasonSignedFocusNode),
          ),
          CommonTextFieldSimple(
            textEditingController: _reasonSignedController,
            borderColor: AppColor.offWhite97Color,
            labelText: AppStrings.reason_signed,
            color: AppColor.hintTextColor,
            focusNode: _reasonSignedFocusNode,
            onSubmit: (val) =>
                FocusScope.of(context).requestFocus(_signedPhoneFocusNode),
          ),
          CommonTextFieldSimple(
            textEditingController: _signedPhoneController,
            borderColor: AppColor.offWhite97Color,
            labelText: AppStrings.signed_phone,
            color: AppColor.hintTextColor,
            focusNode: _signedPhoneFocusNode,
            keyboardType: TextInputType.phone,
            inputFormatters: [
              // MaskedInputFormatter('+# (###) ### ####')
              PhoneInputFormatter(
                allowEndlessPhone: true,
                onCountrySelected: _onCountrySelected,
              )
            ],
          ),
          SizedBox(
            height: Dimens.ten,
          ),
          AttachPhotoWidget(),
          SizedBox(
            height: Dimens.twenty,
          ),
          imageContainer(),
          CommonTextFieldMultiLine(
            textEditingController: _addClaimNotesController,
            borderColor: AppColor.hintTextColor,
            color: AppColor.hintTextColor,
            hintText: AppStrings.add_claim_notes,
            maxLines: 8,
            minLines: 7,
            focusNode: _addClaimNotesFocusNode,
          ),
          SizedBox(
            height: Dimens.ten,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Dimens.twenty),
            child: CommonActionButton(
              title: AppStrings.next,
              onPressed: () async {
                var postCompleteDelivery = PostCompleteDelivery(
                    address: widget.postCompleteDelivery!.address,
                    patientFullName:
                        widget.postCompleteDelivery!.patientFullName,
                    claimId: widget.postCompleteDelivery!.claimId,
                    careGiverSignedPhone: _signedPhoneController.text,
                    careGiverReasonSigned: _reasonSignedController.text,
                    careGiverName: _nameController.text,
                    careGiverTitle: _titleController.text,
                    checkListDetails:
                        widget.postCompleteDelivery!.checkListDetails,
                    notes: _addClaimNotesController.text,
                    paymentDetails: null,
                    whoReceived: WhoReceived(
                        id: whoRecived!.id,
                        name: whoRecived!.value.toString()));
                // var postCompleteDelivery = PostCompleteDelivery(
                //     item: widget.postCompleteDelivery!.item.toString(),
                //     claimId: widget.postCompleteDelivery!.claimId,
                //     phoneNumber: widget.postCompleteDelivery!.phoneNumber,
                //     patientFullName:
                //         widget.postCompleteDelivery!.patientFullName,
                //     deliveryAddress:
                //         widget.postCompleteDelivery!.deliveryAddress,
                //     claimAssessmentCheckList:
                //         widget.postCompleteDelivery!.claimAssessmentCheckList,
                //     orderReceiverOptions: [
                //       OrderReceiverOptions(
                //           title: _titleController.text,
                //           name: _nameController.text,
                //           claimNotes: _addClaimNotesController.text,
                //           reasonSigned: _reasonSignedController.text,
                //           signedPhone: _signedPhoneController.text,
                //           whoReceived: whoRecived)
                //     ]);
                print(jsonEncode(postCompleteDelivery));
                completeClaimAssessment = CompleteClaimAssessment(
                    attachments: imageList,
                    postCompleteDelivery: postCompleteDelivery);
                if (validate(context)) {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              ClaimAssementStepThree(completeClaimAssessment)));
                }
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

  Widget dropDownWidget({List<ReceiverData>? receiverData}) {
    // List<String> datalist = [];
    // for (int i = 0; i < data!.length; i++) {
    //   datalist.add(data[i].value.toString());
    // }

    return Container(
      child: DropdownButtonFormField(
        hint: CommonTextWidget(
          text: AppStrings.who_received,
          fontSize: Dimens.fifteen,
          fontWeight: FontWeight.w600,
          fontColor: AppColor.blackColor,
        ),
        items: receiverData!.map((label) {
          return DropdownMenuItem(
              child: Container(
                child: CommonTextWidget(
                  text: label.value.toString(),
                  fontSize: Dimens.forteen,
                  fontColor: AppColor.blackColor,
                  fontWeight: FontWeight.w500,
                  textAlignment: TextAlign.left,
                ),
              ),
              value: label);
        }).toList(),
        dropdownColor: AppColor.whiteColor,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide:
                BorderSide(color: AppColor.offWhite97Color, width: Dimens.one),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide:
                BorderSide(color: AppColor.offWhite97Color, width: Dimens.one),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                  color: AppColor.offWhite97Color, width: Dimens.one)),
        ),
        onChanged: (ReceiverData? value) {
          setState(() {
            whoRecived = value;
            whoRecivedString = value!.value.toString();
          });
        },
      ),
    );
  }

  Widget AttachPhotoWidget() {
    return InkWell(
      onTap: () async {
        showSelectionDialog(context);
      },
      child: Container(
        padding: EdgeInsets.all(Dimens.sixteen),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(Dimens.ten),
          color: AppColor.offWhiteColor,
        ),
        width: double.maxFinite,
        child: Center(
          child: Text(
            AppStrings.attach_photo.toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Dimens.sixteen,
                fontFamily: AppStrings.fontFamily,
                color: AppColor.primaryColor),
          ),
        ),
      ),
    );
  }

  void showSelectionDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text(
                "From where do you want to take the photo?",
                style: TextStyle(fontSize: Dimens.forteen),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text(
                        "Gallery",
                        style: TextStyle(fontSize: Dimens.twelve),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        _openGallery(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text(
                        "Camera",
                        style: TextStyle(fontSize: Dimens.twelve),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        _openCamera(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }

  _openGallery(BuildContext context) async {
    XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 480,
      maxWidth: 640,
    );

    setState(() {
      if (image != null) {
        imageList.add(File(image.path));
      }
    });
    setState(() {});
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    print(image!.path);
    setState(() {
      if (image != null) {
        imageList.add(File(image.path));
      }
    });
    Navigator.of(context).pop();
  }

  Widget imageContainer() {
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
                child: Stack(children: [
                  Container(
                    margin: EdgeInsets.only(top: Dimens.ten),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColor.hintColor, width: Dimens.one)),
                    height: Dimens.hundred,
                    width: Dimens.hundred,
                    child: Image.file(
                      File(imageList[position].path),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                      top: 3,
                      right: 5,
                      child: InkWell(
                          onTap: () {
                            imageList.removeAt(position);
                            setState(() {});
                          },
                          child: SvgPicture.asset(AppImages.cross))),
                ]));
          }),
    );
  }

  bool validate(context) {
    if (Utils.checkNullOrEmpty(whoRecivedString)) {
      SnackBarUtils.showErrorSnackBar(
          AppStrings.please_select_who_recived, context);
      return false;
    } else if (Utils.checkNullOrEmpty(_nameController.text)) {
      FocusScope.of(context).requestFocus(_nameFocusNode);
      SnackBarUtils.showErrorSnackBar(
          AppStrings.please_enter_valid_name, context);
      return false;
    } else if (Utils.checkNullOrEmpty(_titleController.text)) {
      FocusScope.of(context).requestFocus(_titleFocusNode);
      SnackBarUtils.showErrorSnackBar(
          AppStrings.please_enter_valid_title, context);
      return false;
    } else if (Utils.checkNullOrEmpty(_reasonSignedController.text)) {
      FocusScope.of(context).requestFocus(_reasonSignedFocusNode);
      SnackBarUtils.showErrorSnackBar(
          AppStrings.please_enter_valid_reason_signed, context);
      return false;
    } else if (Utils.checkNullOrEmpty(_signedPhoneController.text)) {
      FocusScope.of(context).requestFocus(_signedPhoneFocusNode);
      SnackBarUtils.showErrorSnackBar(
          AppStrings.please_enter_valid_signed_phone, context);
      return false;
    } else if (Utils.checkNullOrEmpty(_addClaimNotesController.text)) {
      FocusScope.of(context).requestFocus(_addClaimNotesFocusNode);
      SnackBarUtils.showErrorSnackBar(
          AppStrings.please_add_claim_note, context);
      return false;
    }
    return true;
  }
}

class NumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = new StringBuffer();
    if (newTextLength >= 1) {
      newText.write('+');
      if (newValue.selection.end >= 1) selectionIndex++;
    }
    if (newTextLength >= 3) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 2) + ' ');
      if (newValue.selection.end >= 2) selectionIndex += 1;
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));
    return new TextEditingValue(
      text: newText.toString(),
      selection: new TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
