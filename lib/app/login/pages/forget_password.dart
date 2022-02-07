import 'package:bflow/app/common_widget/common_action_button.dart';
import 'package:bflow/app/common_widget/common_text_widget.dart';
import 'package:bflow/app/common_widget/common_textfield.dart';
import 'package:bflow/app/common_widget/custom_progress_indicator.dart';
import 'package:bflow/app/common_widget/snackbar/utils.dart';
import 'package:bflow/app/login/bloc/login_bloc.dart';
import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppImages.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/CommonUtils.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final corporateIdController = TextEditingController();
  final userNameController = TextEditingController();
  final userNameFocusNode = FocusNode();
  final corporateIdFocusNode = FocusNode();
  LoginBlock? loginblock;

  void initState() {
    super.initState();
    loginblock = LoginBlock();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColor.backgroundColor,
          body: SingleChildScrollView(
            controller: ScrollController(),
            child: Container(
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
                      text: AppStrings.forget_password,
                      fontSize: Dimens.twentyNine,
                      fontWeight: FontWeight.w700,
                      fontColor: AppColor.whiteColor,
                    ),
                    SizedBox(
                      height: Dimens.ten,
                    ),
                    CommonTextWidget(
                      height: 1.5,
                      text: AppStrings.enter_username,
                      fontSize: Dimens.forteen,
                      fontWeight: FontWeight.w500,
                      fontColor: AppColor.whiteColor,
                    ),
                    SizedBox(
                      height: Dimens.thirty,
                    ),
                    CommonTextField(
                      textEditingController: userNameController,
                      borderColor: AppColor.whiteColor,
                      labelText: AppStrings.username,
                      prefixIcon: AppImages.profile,
                      color: AppColor.whiteColor,
                      focusNode: userNameFocusNode,
                      onSubmit: (val) => FocusScope.of(context)
                          .requestFocus(corporateIdFocusNode),
                    ),
                    CommonTextField(
                      textEditingController: corporateIdController,
                      borderColor: AppColor.whiteColor,
                      labelText: AppStrings.corporate_id,
                      prefixIcon: AppImages.coperate_id,
                      color: AppColor.whiteColor,
                      focusNode: corporateIdFocusNode,
                    ),
                    SizedBox(
                      height: Dimens.thirty,
                    ),
                    CommonActionButton(
                      title: AppStrings.reset_password,
                      onPressed: () {
                        if (formValidation(context)) {
                          loginblock!.forgetPassword(
                              userName: userNameController.text,
                              corporateId: corporateIdController.text,
                              context: context);
                        }
                      },
                      borderRadius: Dimens.ten,
                      backgroundColor: AppColor.primaryColor,
                      width: double.maxFinite,
                      shadowColor: AppColor.backgroundColor,
                    )
                  ],
                )),
          ),
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
    if (Utils.checkNullOrEmpty(userNameController.text)) {
      FocusScope.of(context).requestFocus(userNameFocusNode);
      SnackBarUtils.showErrorSnackBar(
          AppStrings.please_enter_valid_username, context);
      return false;
    } else if (Utils.checkNullOrEmpty(corporateIdController.text)) {
      FocusScope.of(context).requestFocus(corporateIdFocusNode);
      SnackBarUtils.showErrorSnackBar(
          AppStrings.please_enter_valid_corporate_id, context);
      return false;
    }
    return true;
  }
}
