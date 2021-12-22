import 'package:bflow/app/common_widget/common_action_button.dart';
import 'package:bflow/app/common_widget/common_text_underLine_widget.dart';
import 'package:bflow/app/common_widget/common_text_widget.dart';
import 'package:bflow/app/common_widget/custom_progress_indicator.dart';
import 'package:bflow/app/common_widget/snackbar/utils.dart';
import 'package:bflow/app/login/bloc/login_bloc.dart';
import 'package:bflow/app/login/model/login_model.dart';
import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppImages.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/CommonUtils.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class Verification extends StatefulWidget {
  LoginModel loginModel;


  Verification({required this.loginModel});

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final authCodeController = TextEditingController();
  LoginBlock? loginblock;
  bool hasError = false;

  @override
  void initState() {
    loginblock = LoginBlock();
    print(widget.loginModel.userName.toString());
    print(widget.loginModel.password.toString());
    print(widget.loginModel.corporateId.toString());

    super.initState();
  }
  @override
  void dispose() {
    authCodeController.dispose();
    super.dispose();
  }
  PinBoxDecoration pinBoxDecoration = (
    Color borderColor,
    Color pinBoxColor, {
    double borderWidth = 1.0,
    double radius = 10.0,
  }) {
    return BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
        color: pinBoxColor,
        borderRadius: BorderRadius.all(Radius.circular(Dimens.ten)));
  };

  @override
  Widget build(BuildContext context) {
    //String authcode = widget.authCode.toString();
   // authCodeController.text = authcode;
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: true,
          body: Container(
              color: AppColor.backgroundColor,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                  vertical: Dimens.thirty, horizontal: Dimens.thirty),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Dimens.twenty,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      AppImages.ic_back_small,
                      color: AppColor.whiteColor,
                    ),
                  ),
                  SizedBox(
                    height: Dimens.twenty,
                  ),
                  CommonTextWidget(
                    text: AppStrings.verification,
                    fontSize: Dimens.twentyNine,
                    fontWeight: FontWeight.w700,
                    fontColor: AppColor.whiteColor,
                  ),
                  SizedBox(
                    height: Dimens.ten,
                  ),
                  CommonTextWidget(
                    text: AppStrings.otp_send,
                    fontSize: Dimens.forteen,
                    fontWeight: FontWeight.w500,
                    fontColor: AppColor.whiteColor,
                    height: 1.5,
                  ),
                  SizedBox(
                    height: Dimens.thirty,
                  ),
                  // PinPut(
                  //   // eachFieldConstraints: BoxConstraints(
                  //   //     minHeight: Dimens.sixtyFour, minWidth: Dimens.sixtyFour),
                  //   fieldsCount: 8,
                  //   controller: authCodeController,
                  //   focusNode: FocusNode(),
                  //   submittedFieldDecoration: BoxDecoration(
                  //     border: Border.all(color: AppColor.whiteColor),
                  //     borderRadius: BorderRadius.circular(5.0),
                  //   ),
                  //   selectedFieldDecoration: BoxDecoration(
                  //     border: Border.all(color: AppColor.whiteColor),
                  //     borderRadius: BorderRadius.circular(5.0),
                  //   ),
                  //   followingFieldDecoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(5.0),
                  //     border: Border.all(
                  //       color: AppColor.whiteColor,
                  //     ),
                  //   ),inputDecoration: InputDecoration(fillColor: Colors.white) ,
                  // ),
                  PinCodeTextField(
                    autofocus: true,
                    controller: authCodeController,
                    // hideCharacter: true,
                    highlight: true,
                    pinBoxColor: Colors.transparent,
                    highlightPinBoxColor: Colors.transparent,
                    highlightColor: AppColor.whiteColor,
                    defaultBorderColor: Colors.white,
                    pinBoxBorderWidth: 1,
                    // hasError: hasError,
                    maxLength: 8,
                    hasTextBorderColor: Colors.white,
                    // maskCharacter: "*",
                    onTextChanged: (text) {
                      // setState(() {
                      //   hasError = false;
                      // });
                    },
                    onDone: (text) {
                      print("DONE $text");
                    },
                    pinBoxWidth: MediaQuery.of(context).size.width * 0.085,
                    pinBoxHeight: 50,
                    hasUnderline: false,
                    wrapAlignment: WrapAlignment.spaceAround,
                    pinBoxDecoration: pinBoxDecoration,
                    pinTextStyle:
                        TextStyle(fontSize: Dimens.sixteen, color: AppColor.whiteColor),
                    pinTextAnimatedSwitcherTransition:
                        ProvidedPinBoxTextAnimation.scalingTransition,
                    pinTextAnimatedSwitcherDuration: Duration(milliseconds: 200),
                    highlightAnimationEndColor: Colors.white12,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: Dimens.thirty,
                  ),
                  CommonActionButton(
                    title: AppStrings.submit,
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     CupertinoPageRoute(
                      //         builder: (context) => BottomNavigationPage()));
                      if (formValidation(context)) {
                        loginblock!.validateApiCall(
                            authCode: authCodeController.text,
                            password: widget.loginModel.password.toString(),
                            corporateId: widget.loginModel.corporateId.toString(),
                            userName: widget.loginModel.userName.toString(),
                            context: context);
                      }
                    },
                    borderRadius: Dimens.ten,
                    backgroundColor: AppColor.primaryColor,
                    width: double.maxFinite,
                    shadowColor: AppColor.backgroundColor,
                  ),
                  SizedBox(height: Dimens.thirty),
                  Center(
                    child: CommonTextUnderLineWidget(
                      textDecoration: TextDecoration.underline,
                      text: AppStrings.resend_otp,
                      fontSize: Dimens.fifteen,
                      fontWeight: FontWeight.w500,
                      fontColor: AppColor.whiteColor,
                    ),
                  ),
                ],
              )),
        ),
        StreamBuilder<bool>(
            stream: loginblock!.progressStream,
            builder: (context, snapshot) {
              return Center(
                  child: CommmonProgressIndicator(
                      snapshot.hasData ? snapshot.data! : false));
            }),
      ],
    );
  }

  bool formValidation(BuildContext context) {
    if (Utils.checkNullOrEmpty(authCodeController.text)) {
      SnackBarUtils.showErrorSnackBar(AppStrings.please_enter_valid_OTP, context);
      return false;
    } else if (authCodeController.text.length != 8) {
      SnackBarUtils.showErrorSnackBar(
          AppStrings.please_enter_valid_OTP, context);

      return false;
    }
    return true;
  }
}
