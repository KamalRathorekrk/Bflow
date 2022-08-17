import 'package:bflow/app/common_widget/common_app_bar.dart';
import 'package:bflow/app/common_widget/custom_progress_indicator.dart';
import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsAndConditions extends StatefulWidget {
  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  var url = "https://www.bflowdmebillingsoftware.com/bsi-subscription-terms-of-service/";
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
        appBar: CommonAppBar(
            text: AppStrings.terms_and_conditions,
          ),
      body: Stack(
        children: <Widget>[
          Container(
              color: AppColor.whiteColor,
              child: WebView(
                initialUrl: url,
                javascriptMode: JavascriptMode.disabled,
                onPageFinished: (finish) {
                  isLoading = false;
                  setState(() {});
                },
                onPageStarted: (urls) async {
                  if (urls != url) {
                    return;
                  }
                },
              )),
          isLoading
              ? Center(child: CommmonProgressIndicator(isLoading))
              : Center(),
        ],
      ),
    );
  }
}
