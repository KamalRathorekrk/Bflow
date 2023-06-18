import 'package:bflow/app/common_widget/common_app_bar.dart';
import 'package:bflow/app/common_widget/common_text_widget.dart';
import 'package:bflow/app/routes_activity_list/model/get_routes_list.dart';
import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppImages.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsCancelation extends StatefulWidget {
  ResponseRoutes? responseRoutes;

  DetailsCancelation(this.responseRoutes);

  @override
  _DetailsCancelationState createState() => _DetailsCancelationState();
}

class _DetailsCancelationState extends State<DetailsCancelation> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColor.offWhiteColor));
    return Scaffold(
      appBar: CommonAppBar(
        text: "Claim: #${widget.responseRoutes!.orderId}",
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(
              horizontal: Dimens.twenty, vertical: Dimens.ten),
          color: AppColor.offWhiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CenterContainer(widget.responseRoutes!),
              SizedBox(
                height: Dimens.twentyFive,
              ),
              CommonTextWidget(
                text: AppStrings.reason_for_cancellation,
                fontSize: Dimens.forteen,
                fontColor: AppColor.blackColor,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: Dimens.twenty,
              ),
              Expanded(
                child: CommonTextWidget(
                  text: "${widget.responseRoutes!.cancelReason ?? ""}",
                  fontSize: Dimens.forteen,
                  fontColor: AppColor.blackColor,
                  fontWeight: FontWeight.w400,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget CenterContainer(ResponseRoutes responseRoutes) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.fifteen, vertical: Dimens.ten),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.ten),
        boxShadow: [
          BoxShadow(color: AppColor.offWhite17Color, blurRadius: 5.0)
        ],
        color: AppColor.whiteColor,
      ),
      child: Column(
        children: [
          SizedBox(
            height: Dimens.fifteen,
          ),
          RowElement(
              title: AppStrings.description,
              value: responseRoutes.items!.isEmpty
                  ? ""
                  : responseRoutes.items?[0].description,
              show: true),
          SizedBox(
            height: Dimens.twenty,
          ),
          Divider(
            thickness: 1,
            height: Dimens.two,
            color: AppColor.offWhite17Color,
          ),
          SizedBox(
            height: Dimens.twenty,
          ),
          RowElement(
              title: AppStrings.patient_name,
              value: responseRoutes.patientFullName ?? ""),
          SizedBox(
            height: Dimens.twenty,
          ),
          Divider(
            thickness: 1,
            height: Dimens.two,
            color: AppColor.offWhite17Color,
          ),
          SizedBox(height: Dimens.twenty),
          RowElement(
              icon: true,
              title: AppStrings.delivery_address,
              value:
                  "${responseRoutes.address}, ${responseRoutes.city}, ${responseRoutes.state}"),
          SizedBox(height: Dimens.twenty),
          Divider(
            thickness: 1,
            height: Dimens.two,
            color: AppColor.offWhite17Color,
          ),
          SizedBox(
            height: Dimens.twenty,
          ),
          RowElement(title: AppStrings.zip_code, value: responseRoutes.zipcode),
          SizedBox(
            height: Dimens.twenty,
          ),
          Divider(
            thickness: 1,
            height: Dimens.two,
            color: AppColor.offWhite17Color,
          ),
          SizedBox(
            height: Dimens.twenty,
          ),
          RowElement(
              title: AppStrings.phone_number,
              value: "${responseRoutes.phoneNumber ?? ""}".replaceAllMapped(
                  RegExp(r'(\d{3})(\d{3})(\d+)'),
                  (Match m) => "(${m[1]}) ${m[2]}-${m[3]}")),
          SizedBox(
            height: Dimens.twenty,
          ),
        ],
      ),
    );
  }

  Widget RowElement({title, value, show, icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextWidget(
          text: title,
          fontSize: Dimens.thrteen,
          fontColor: AppColor.blackColor,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(
          height: Dimens.ten,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Visibility(
                      visible: icon ?? false,
                      child: Padding(
                        padding: EdgeInsets.only(right: Dimens.four),
                        child: SvgPicture.asset(AppImages.location),
                      )),
                  Expanded(
                    child: CommonTextWidget(
                      text: "${value}",
                      fontSize: Dimens.forteen,
                      fontColor: AppColor.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Visibility(
                  visible: show ?? false,
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColor.redColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    padding: EdgeInsets.symmetric(
                        vertical: Dimens.five, horizontal: Dimens.eight),
                    child: Center(
                      child: CommonTextWidget(
                        text: AppStrings.cancelled,
                        fontColor: AppColor.whiteColor,
                        fontWeight: FontWeight.w500,
                        fontSize: Dimens.eleven,
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
