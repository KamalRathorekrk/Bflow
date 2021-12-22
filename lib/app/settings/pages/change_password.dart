import 'package:bflow/app/common_widget/common_action_button.dart';
import 'package:bflow/app/common_widget/common_app_bar.dart';
import 'package:bflow/app/common_widget/common_text_field_simple.dart';
import 'package:bflow/app/common_widget/snackbar/utils.dart';
import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/CommonUtils.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _newPasswordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();
  final _currentPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        text: AppStrings.change_password,
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Container(
          color: AppColor.offWhiteColor,
          padding: EdgeInsets.symmetric(
              vertical: Dimens.twentyNine, horizontal: Dimens.thirty),
          child: Column(
            children: [
              SizedBox(
                height: Dimens.forty,
              ),
              CommonTextFieldSimple(
                textEditingController: currentPasswordController,
                hintText: AppStrings.change_password,
                color: AppColor.offWhite66Color,
                borderColor: AppColor.offWhite97Color,
                focusNode: _currentPasswordFocusNode,
                onSubmit: (val) =>
                    FocusScope.of(context).requestFocus(_newPasswordFocusNode),
              ),
              CommonTextFieldSimple(
                textEditingController: newPasswordController,
                hintText: AppStrings.new_password,
                color: AppColor.offWhite66Color,
                borderColor: AppColor.offWhite97Color,
                focusNode: _newPasswordFocusNode,
                onSubmit: (val) => FocusScope.of(context)
                    .requestFocus(_confirmPasswordFocusNode),
              ),
              CommonTextFieldSimple(
                textEditingController: confirmPasswordController,
                hintText: AppStrings.confirm_new_password,
                color: AppColor.offWhite66Color,
                borderColor: AppColor.offWhite97Color,
                focusNode: _confirmPasswordFocusNode,
              ),
              SizedBox(
                height: Dimens.forty,
              ),
              CommonActionButton(
                title: AppStrings.submit,
                onPressed: () {
                  if(validate(context)){
                    Navigator.pop(context);
                  }
                },
                borderRadius: Dimens.seven,
                backgroundColor: AppColor.primaryColor,
                width: double.maxFinite,
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validate(context) {
    if (Utils.checkNullOrEmpty(currentPasswordController.text)) {
      SnackBarUtils.showErrorSnackBar('Please enter current password', context);
      FocusScope.of(context).requestFocus(_currentPasswordFocusNode);
      return false;
    } else if (Utils.checkNullOrEmpty(newPasswordController.text)) {
      SnackBarUtils.showErrorSnackBar('Please enter new password', context);
      FocusScope.of(context).requestFocus(_newPasswordFocusNode);
      return false;
    } else if (Utils.checkNullOrEmpty(confirmPasswordController.text)) {
      SnackBarUtils.showErrorSnackBar('Please enter confirm password', context);
      FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);
      return false;
    }else if(newPasswordController.text!=confirmPasswordController.text){
      SnackBarUtils.showErrorSnackBar('Confirm password does not match', context);
      return false;
    }
    return true;
  }
}
