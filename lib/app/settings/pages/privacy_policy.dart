import 'package:bflow/app/common_widget/common_app_bar.dart';
import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PrivacyPolicy extends StatefulWidget {
  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  // var url = "https://www.bflowdmebillingsoftware.com/privacy-policy/";
  var url = "assets/PDF/PrivacyPoliciesBFlow.pdf";
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: CommonAppBar(
        color: AppColor.whiteColor,
        text: AppStrings.privacy_policy,
      ),
      body: Container(
          color: AppColor.whiteColor,
          child: SfPdfViewer.asset(
            url,
            enableDoubleTapZooming: false,
          )),
    );
    // return Scaffold(
    //   appBar: CommonAppBar(
    //     text: AppStrings.privacy_policy,
    //   ),
    //   body: SingleChildScrollView(
    //     controller: ScrollController(),
    //     child: Container(
    //       color: AppColor.offWhiteColor,
    //       padding: EdgeInsets.symmetric(
    //           vertical: Dimens.twenty, horizontal: Dimens.twentyFive),
    //       child: CommonTextWidget(
    //         text:
    //             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    //         fontSize: Dimens.fifteen,
    //         fontWeight: FontWeight.w400,
    //         fontColor: AppColor.blackColor,
    //         height: 1.5,
    //       ),
    //     ),
    //   ),
    // );
  }
}
