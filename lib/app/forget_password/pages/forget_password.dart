import 'package:bflow/app/common_widget/common_action_button.dart';
import 'package:bflow/app/common_widget/common_text_widget.dart';
import 'package:bflow/app/common_widget/common_textfield.dart';
import 'package:bflow/app/common_widget/snackbar/utils.dart';
import 'package:bflow/app/login/pages/login.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                SizedBox(height: Dimens.twenty,),
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
                  hintText: AppStrings.username,
                  labelText: AppStrings.username,
                  prefixIcon: AppImages.profile,
                  color: AppColor.whiteColor,
                ),
                CommonTextField(
                  textEditingController: corporateIdController,
                  hintText: AppStrings.corporate_id,
                  labelText: AppStrings.corporate_id,
                  prefixIcon: AppImages.coperate_id,
                  color: AppColor.whiteColor,
                ),
                SizedBox(
                  height: Dimens.thirty,
                ),
                CommonActionButton(
                  title: AppStrings.reset_password,
                  onPressed: () {
                    if (formValidation(context)) {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => LoginPage()));
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
    );
  }

  bool formValidation(BuildContext context) {
    if (Utils.checkNullOrEmpty(userNameController.text)) {
      SnackBarUtils.showErrorSnackBar(
          AppStrings.please_enter_valid_username, context);
      return false;
    } else if (Utils.checkNullOrEmpty(corporateIdController.text)) {
      SnackBarUtils.showErrorSnackBar(
          AppStrings.please_enter_valid_corporate_id, context);
      return false;
    }
    return true;
  }
}
