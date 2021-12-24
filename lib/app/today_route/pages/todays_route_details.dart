import 'package:bflow/app/claim_assessment/models/patient_detail_model.dart';
import 'package:bflow/app/claim_assessment/pages/claim_assessment_step_one.dart';
import 'package:bflow/app/claim_assessment/pages/reason_for_cancellation.dart';
import 'package:bflow/app/common/claims_details.dart';
import 'package:bflow/app/common_widget/common_action_button.dart';
import 'package:bflow/app/common_widget/common_app_bar.dart';
import 'package:bflow/app/common_widget/common_text_widget.dart';
import 'package:bflow/app/common_widget/custom_progress_indicator.dart';
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
  PatientDetailsModel? patientDetailsModel;

  @override
  void initState() {
    todaysRouteBloc = TodaysRouteBloc();
    callApi();
    super.initState();
  }

  callApi() async {
    todaysRouteBloc!.getClaimDetails(context: context, claimID: widget.claimId);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColor.offWhiteColor));
    return Stack(
      children: [
        StreamBuilder<ClaimDetailData>(
            stream: todaysRouteBloc!.claimDetailStream,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                patientDetailsModel = PatientDetailsModel(
                    claimId: snapshot.data!.claimId.toString(),
                    patientName: snapshot.data!.patientFullName.toString(),
                    patientAddress:
                        "${snapshot.data!.deliveryAddress!.address.toString()}, ${snapshot.data!.deliveryAddress!.city.toString()}, ${snapshot.data!.deliveryAddress!.state.toString()}");
                return Scaffold(
                  // backgroundColor: AppColor.offWhiteColor,
                  appBar: CommonAppBar(
                    text: "Claim:#${snapshot.data!.claimId}",
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
                          centerContainer(
                            zipCode: snapshot.data!.deliveryAddress!.zipCode
                                .toString(),
                            phone: snapshot.data!.phoneNumber.toString(),
                            deliveryAddress:
                                "${snapshot.data!.deliveryAddress!.address.toString()}, ${snapshot.data!.deliveryAddress!.city.toString()}, ${snapshot.data!.deliveryAddress!.state.toString()}",
                            description: snapshot.data!.items!.name.toString(),
                            patientName:
                                snapshot.data!.patientFullName.toString(),
                          ),
                          SizedBox(
                            height: Dimens.thirty,
                          ),
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
                                          ClaimAssementStepOne(
                                            patientDetailsModel:
                                                patientDetailsModel,
                                          )));
                            },
                            borderRadius: Dimens.seven,
                            backgroundColor: AppColor.primaryColor,
                            width: double.maxFinite,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Container(
                  child: Center(child: SvgPicture.asset(AppImages.list)),
                );
              }
            }),
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

  Widget centerContainer(
      {description, patientName, deliveryAddress, zipCode, phone}) {
    return Container(
      // margin: EdgeInsets.only(bottom: Dimens.hundred),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: Dimens.fifteen,
          ),
          RowElement(
              title: AppStrings.description,
              value: description,
              show: true,
              address: deliveryAddress),
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
          RowElement(title: AppStrings.patient_name, value: patientName),
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

  Widget RowElement({title, value, show, icon, address}) {
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
                  // await MapsLauncher.launchCoordinates(
                  //     37.4220041, -122.0862462, 'Google Headquarters are here');
                  await MapsLauncher.launchQuery(address);
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
