import 'package:bflow/app/claim_assessment/pages/details_page_cancelation.dart';
import 'package:bflow/app/common_widget/common_action_button.dart';
import 'package:bflow/app/common_widget/common_app_bar.dart';
import 'package:bflow/app/common_widget/common_textfiled_multiline.dart';
import 'package:bflow/app/common_widget/snackbar/utils.dart';
import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/CommonUtils.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReasonforCancellation extends StatefulWidget {
  @override
  _ReasonforCancellationState createState() => _ReasonforCancellationState();
}

class _ReasonforCancellationState extends State<ReasonforCancellation> {
  final _addReasonController = TextEditingController();
  final _addReasonFocusNode=FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(text: AppStrings.reason_for_cancellation),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: Dimens.twenty,horizontal: Dimens.twentyFive),
          child: Column(
            children: [
              CommonTextFieldMultiLine(
                textEditingController: _addReasonController,
                borderColor: AppColor.hintTextColor,
                color: AppColor.hintTextColor,
                hintText: AppStrings.add_reason,
                maxLines: 30,
                minLines: 20,
                focusNode: _addReasonFocusNode,
              ),
              SizedBox(height: Dimens.thirty,),
              CommonActionButton(
                title: AppStrings.submit,
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => DetailsCancelation(reasonOfCancealation: _addReasonController.text,)));
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
  bool validate(){
    if(Utils.checkNullOrEmpty(_addReasonController.text)){
      _addReasonFocusNode.requestFocus();
      SnackBarUtils.showErrorSnackBar('Please enter reason of cancellation', context);
      return false;
    }
    return true;
  }
}
