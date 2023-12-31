import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CommmonProgressIndicator extends StatelessWidget {
  bool isLoading = false;

  CommmonProgressIndicator(this.isLoading);

  @override
  Widget build(BuildContext context) {
    final spinkit = SpinKitCircle(
      color: AppColor.primaryColor,
      size: Dimens.sixty,
    );
    return isLoading
        ? Opacity(
            opacity: isLoading ? 1.0 : 0,
            child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height,
                color: Colors.transparent,
                child: isLoading
                    ? Container(
                        child: spinkit,
                        // decoration: BoxDecoration(
                            // color: Colors.transparent.withOpacity(0.5)),
                      )
                    : Container()),
          )
        : Container(
            height: 0.0,
            width: 0.0,
          );
  }
}
