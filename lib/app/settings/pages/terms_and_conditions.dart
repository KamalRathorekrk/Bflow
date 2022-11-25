import 'package:bflow/app/common_widget/common_app_bar.dart';
import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class TermsAndConditions extends StatefulWidget {
  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  // var url = "https://www.bflowdmebillingsoftware.com/bsi-subscription-terms-of-service/";
  var url = "assets/PDF/TermsAndConditionsBFlow.pdf";

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: CommonAppBar(
        color: AppColor.whiteColor,
        text: AppStrings.terms_and_conditions,
      ),
      body: Container(
          color: AppColor.whiteColor,
          child: SfPdfViewer.asset(
            url,
            enableDoubleTapZooming: false,
          )),
    );
  }
}
