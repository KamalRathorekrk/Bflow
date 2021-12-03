import 'package:bflow/app/common_widget/common_action_button.dart';
import 'package:bflow/app/common_widget/common_password_textfield.dart';
import 'package:bflow/app/common_widget/common_text_underLine_widget.dart';
import 'package:bflow/app/common_widget/common_text_widget.dart';
import 'package:bflow/app/common_widget/common_textfield.dart';
import 'package:bflow/app/common_widget/custom_progress_indicator.dart';
import 'package:bflow/app/common_widget/snackbar/utils.dart';
import 'package:bflow/app/forget_password/pages/forget_password.dart';
import 'package:bflow/app/login/bloc/login_bloc.dart';
import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppImages.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/CommonUtils.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBlock? loginblock;

  // @override

  void initState() {
    super.initState();
    loginblock = LoginBlock();
  }

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final corporateIdController = TextEditingController();
  final userNameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final corporateIdFocusNode = FocusNode();
  double? height;

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    passwordController.dispose();
    corporateIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColor.backgroundColor,
          body: Container(
            padding: EdgeInsets.only(
                left: Dimens.twenty,
                right: Dimens.twenty,
                top: height! * 0.08,
                bottom: height! * 0.03),
            color: AppColor.backgroundColor,
            child: Stack(
              children: [
                Column(
                  children: [
                    Image.asset(AppImages.bflow_white),
                    SizedBox(
                      height: Dimens.seventy,
                    ),
                    loginInContainer(context),
                  ],
                ),
                Positioned(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => ForgetPassword()));
                      },
                      child: CommonTextUnderLineWidget(
                        textDecoration: TextDecoration.underline,
                        text: AppStrings.forget_password,
                        fontSize: Dimens.fifteen,
                        fontWeight: FontWeight.w500,
                        fontColor: AppColor.whiteColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
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

  Widget loginInContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.ten),
        color: AppColor.whiteColor,
      ),
      padding: EdgeInsets.symmetric(
          vertical: Dimens.twentyFive, horizontal: Dimens.twenty),
      child: Column(
        children: [
          CommonTextWidget(
            text: AppStrings.Sign_in,
            fontSize: Dimens.twenty,
            fontWeight: FontWeight.w500,
            fontColor: AppColor.primaryColor,
          ),
          SizedBox(height: Dimens.twentyFive),
          CommonTextField(
            textEditingController: userNameController,
            hintText: AppStrings.username,
            labelText: AppStrings.username,
            prefixIcon: AppImages.profile,
            color: AppColor.hintColor,
            focusNode: userNameFocusNode,
            onSubmit: (val)=>
                FocusScope.of(context).requestFocus(passwordFocusNode),
          ),
          CommonPasswordField(
            textEditingController: passwordController,
            hintText: AppStrings.password,
            labelText: AppStrings.password,
            prefixIcon: AppImages.lock,
            focusNode: passwordFocusNode,
            onSubmit: (val)=>
                FocusScope.of(context).requestFocus(corporateIdFocusNode),
          ),
          SizedBox(height: Dimens.ten),
          CommonTextField(
            textEditingController: corporateIdController,
            hintText: AppStrings.corporate_id,
            labelText: AppStrings.corporate_id,
            prefixIcon: AppImages.coperate_id,
            color: AppColor.hintColor,
            focusNode: corporateIdFocusNode,
          ),
          SizedBox(
            height: Dimens.twenty,
          ),
          CommonActionButton(
            title: AppStrings.login,
            onPressed: () async {
              if (formValidation(context)) {
                await loginblock!.loginUpApiCall(
                    context: context,
                    userName: userNameController.text,
                    password: passwordController.text,
                    corporateId: corporateIdController.text);
                /*  await Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => Verification()));*/
              }

              //   if(formValidation(context)){
              //   Navigator.push(context, CupertinoPageRoute(builder: (context)=>Settings()));
              // }
            },
            borderRadius: Dimens.seven,
            backgroundColor: AppColor.primaryColor,
            width: double.maxFinite,
          ),
        ],
      ),
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
    } else if (Utils.checkNullOrEmpty(passwordController.text)) {
          FocusScope.of(context).requestFocus(passwordFocusNode);
      SnackBarUtils.showErrorSnackBar(
          AppStrings.please_enter_valid_password, context);
      return false;
    }
    return true;
  }
}