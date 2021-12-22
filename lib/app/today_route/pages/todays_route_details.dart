import 'package:bflow/app/claim_assessment/pages/claim_assessment_step_one.dart';
import 'package:bflow/app/claim_assessment/pages/details_page_cancelation.dart';
import 'package:bflow/app/claim_assessment/pages/reason_for_cancellation.dart';
import 'package:bflow/app/common_widget/common_action_button.dart';
import 'package:bflow/app/common_widget/common_app_bar.dart';
import 'package:bflow/app/common_widget/common_password_textfield.dart';
import 'package:bflow/app/common_widget/common_text_widget.dart';
import 'package:bflow/app/common_widget/common_textfield.dart';
import 'package:bflow/app/common_widget/custom_progress_indicator.dart';
import 'package:bflow/app/pre_delivery/model/claim_id_response.dart';
import 'package:bflow/app/today_route/bloc/todays_route_bloc.dart';
import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppImages.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maps_launcher/maps_launcher.dart';

class TodaysRouteDetails extends StatefulWidget {
  String claimId;

  TodaysRouteDetails({required this.claimId});

  @override
  _TodaysRouteDetailsState createState() => _TodaysRouteDetailsState();
}

class _TodaysRouteDetailsState extends State<TodaysRouteDetails> {
  TodaysRouteBloc? todaysRouteBloc;
  @override
  void initState() {
    todaysRouteBloc=TodaysRouteBloc();
    callApi();
    super.initState();
  }
  callApi()async {
    // todaysRouteBloc!.getClaimDetails(
    //     context: context, claimID: widget.claimId);
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: AppColor.offWhiteColor));
    return Stack(
      children: [
        Scaffold(
          // backgroundColor: AppColor.offWhiteColor,
          appBar: CommonAppBar(
            text: "Claim:#5655",
          ),
          body: SingleChildScrollView(
            controller: ScrollController(),
            child: Container(
              // height: MediaQuery.of(context).size.height * 0.9,
              padding: EdgeInsets.symmetric(
                  horizontal: Dimens.twenty, vertical: Dimens.ten),
              color: AppColor.offWhiteColor,

              // width: double.infinity,
              child: Column(
                children: [
                  CenterContainer(zipCode:"" ,
                    phone:"",
                    deliveryAddress: "",
                    description:"",
                    patient_name:"",),
                  SizedBox(height: Dimens.thirty,),
                  CommonActionButton(
                    fontWeight: FontWeight.w600,
                    title: AppStrings.cancelled,
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) =>
                                  ReasonforCancellation()));
                    },
                    borderRadius: Dimens.seven,
                    backgroundColor: AppColor.redColor,
                    width: double.maxFinite,
                  ),
                  SizedBox(
                    height: Dimens.fifteen,
                  ),
                  CommonActionButton(
                    fontWeight: FontWeight.w600,
                    title: AppStrings.continue_,
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) =>
                                  ClaimAssementStepOne()));
                    },
                    borderRadius: Dimens.seven,
                    backgroundColor: AppColor.primaryColor,
                    width: double.maxFinite,
                  )
                ],
              ),
            ),
          ),
        ),
        StreamBuilder<bool>(
            stream: todaysRouteBloc!.progressStream,
            builder: (context, snapshot) {
              return Center(
                  child: CommmonProgressIndicator(
                      snapshot.hasData ? snapshot.data! : false));
            }),
      ],
    );
  }

  Widget CenterContainer({description,patient_name,deliveryAddress,zipCode,phone}) {
    return Container(
      // margin: EdgeInsets.only(bottom: Dimens.hundred),
      padding: EdgeInsets.symmetric(horizontal: Dimens.fifteen,vertical: Dimens.ten),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.ten),
        boxShadow: [
          BoxShadow(color: AppColor.offWhite17Color, blurRadius: 5.0)
        ],
        color: AppColor.whiteColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: Dimens.fifteen,
          ),
          RowElement(
              title: AppStrings.description,
              value: description,
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
          RowElement(title: AppStrings.patient_name, value: patient_name),
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
              value: deliveryAddress),
          SizedBox(height: Dimens.twenty),
          Divider(
            thickness: 1,
            height: Dimens.two,
            color: AppColor.offWhite17Color,
          ),
          SizedBox(
            height: Dimens.twenty,
          ),
          RowElement(title: AppStrings.zip_code, value: zipCode),
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
          RowElement(title: AppStrings.phone_number, value: phone),
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
              child: InkWell(
                onTap: () async {
                  print("----");
                  await MapsLauncher.launchCoordinates(
                      37.4220041, -122.0862462, 'Google Headquarters are here');
                },
                child: Text(AppStrings.view_on_map,
                    style: TextStyle(
                      shadows: [
                        Shadow(
                            color: AppColor.backgroundColor,
                            offset: Offset(0, -2))
                      ],
                      color: Colors.transparent,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColor.backgroundColor,
                      fontWeight: FontWeight.w600,
                      fontSize: Dimens.thrteen,
                    )),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
