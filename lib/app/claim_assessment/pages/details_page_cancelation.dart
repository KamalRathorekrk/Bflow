import 'package:bflow/app/common_widget/common_app_bar.dart';
import 'package:bflow/app/common_widget/common_text_widget.dart';
import 'package:bflow/app/common_widget/custom_progress_indicator.dart';
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
    return Stack(
      children: [
        StreamBuilder<dynamic>(
            stream: null,
            builder: (context, snapshot) {
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

                    // width: double.infinity,
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
                            text:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
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
            }),StreamBuilder<bool>(
            stream:null,
            builder: (context, snapshot) {
              return Center(
                  child: CommmonProgressIndicator(
                      snapshot.hasData ? snapshot.data! : false));
            })
      ],
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
              value: "",
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
          RowElement(title: AppStrings.patient_name, value: responseRoutes.patientFullName),
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
              value: "${responseRoutes.address}, ${responseRoutes.city}, ${responseRoutes.state}"),
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
          RowElement(title: AppStrings.phone_number, value: ""),
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
            Row(
              children: [
                Visibility(
                    visible: icon ?? false,
                    child: Padding(
                      padding: EdgeInsets.only(right: Dimens.four),
                      child: SvgPicture.asset(AppImages.location),
                    )),
                CommonTextWidget(
                  text: "${value}",
                  fontSize: Dimens.forteen,
                  fontColor: AppColor.blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            Visibility(
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
          ],
        ),
      ],
    );
  }
}
