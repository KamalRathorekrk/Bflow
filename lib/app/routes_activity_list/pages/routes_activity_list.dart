import 'package:bflow/app/claim_assessment/pages/details_page_cancelation.dart';
import 'package:bflow/app/claim_assessment/pages/details_page_sucess.dart';
import 'package:bflow/app/common_widget/common_text_widget.dart';
import 'package:bflow/app/common_widget/custom_progress_indicator.dart';
import 'package:bflow/app/routes_activity_list/bloc/routes_bloc.dart';
import 'package:bflow/app/routes_activity_list/model/get_routes_list.dart';
import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppImages.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class RoutesActivityList extends StatefulWidget {
  @override
  _RoutesActivityListState createState() => _RoutesActivityListState();
}

class _RoutesActivityListState extends State<RoutesActivityList> {
  RoutesBloc? _routesBloc;
  ScrollController? listController;
  int _pagenoforApi = 1;
  var uploadProgress = false;
  List<ResponseRoutes>? routesdata = [];

  @override
  void initState() {
    _routesBloc = RoutesBloc();
    _routesBloc!.getCompletedRoutes(context: context, pageNumber: _pagenoforApi);
    listController = ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (listController!.position.maxScrollExtent == listController!.offset) {
      _pagenoforApi = _pagenoforApi + 1;
      _routesBloc!
          .getCompletedRoutes(context: context, pageNumber: _pagenoforApi);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.backgroundColor,
        title: CommonTextWidget(
          text: AppStrings.route_activity_list,
          fontSize: Dimens.eighteen,
          fontColor: AppColor.whiteColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Stack(
        children: [
          StreamBuilder<List<ResponseRoutes>>(
              stream: _routesBloc!.routesListStream,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  if (snapshot.data!.length > 0) {
                    snapshot.data!.forEach((element) {
                      routesdata!.add(element);
                    });
                  }
                  if (routesdata!.length > 0) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          // vertical: Dimens.twentyFive,
                          horizontal: Dimens.twentyFive),
                      child: listData(data: routesdata),
                    );
                  } else
                    return Container(
                      child: Center(child: SvgPicture.asset(AppImages.list)),
                    );
                } else {
                  return Container(
                    child: Center(child: SvgPicture.asset(AppImages.list)),
                  );
                }
              }),
          StreamBuilder<bool>(
              stream: _routesBloc!.progressStream,
              builder: (context, snapshot) {
                return Center(
                    child: CommmonProgressIndicator(
                        snapshot.hasData ? snapshot.data! : false));
              }),
        ],
      ),
      // bottomNavigationBar: BottomNavigationPage(),
    );
  }

  String signature = '';

  listData({List<ResponseRoutes>? data}) {
    return SingleChildScrollView(
      controller: listController,
      child: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              // controller: listController,
              padding: EdgeInsets.zero,
              itemCount: data!.length,
              itemBuilder: (context, position) {
                if (data[position].isCancelled == false) {
                  data[position].signature?.forEach((element) {
                    if (element.name!.contains("${data[position].orderId}")) {
                      print(element.url);
                      signature = element.url.toString();
                      // setState(() {});
                    }
                  });

                  return detailCardSucessWidget(data[position]);
                } else {
                  return detailCardCancelWidget(data[position]);
                }
              }),
          SizedBox(
            height: 10,
          ),
          StreamBuilder<bool>(
              stream: _routesBloc!.loadingStream,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data == true)
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SpinKitCircle(
                      color: AppColor.primaryColor,
                      size: Dimens.forty,
                    ),
                  );
                else
                  return SizedBox();
              }),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget detailCardSucessWidget(ResponseRoutes data) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimens.ten),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => DetailsPageSucess(
                        responseRoutes: data,
                      )));
        },
        child: Container(
          padding: EdgeInsets.only(top: Dimens.ten),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.ten),
            boxShadow: [
              BoxShadow(color: AppColor.offWhite17Color, blurRadius: 5.0)
            ],
            color: AppColor.whiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimens.fifteen, vertical: Dimens.ten),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonTextWidget(
                              text: "Claim: #${data.orderId}",
                              fontSize: Dimens.fifteen,
                              fontColor: AppColor.blueColor,
                              fontWeight: FontWeight.w600,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColor.greenColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              padding: EdgeInsets.symmetric(
                                  vertical: Dimens.five,
                                  horizontal: Dimens.eight),
                              child: Center(
                                child: CommonTextWidget(
                                  text: AppStrings.delivered,
                                  fontColor: AppColor.whiteColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: Dimens.eleven,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: Dimens.fifteen,
                        ),
                        CommonTextWidget(
                          text: AppStrings.patient_name,
                          fontSize: Dimens.thrteen,
                          fontColor: AppColor.blackColor,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(
                          height: Dimens.eight,
                        ),
                        CommonTextWidget(
                          text: data.patientFullName ?? "",
                          fontSize: Dimens.forteen,
                          fontColor: AppColor.blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            data.signature!.isNotEmpty
                                ? Container(
                                    // width: 166,
                                    height: 103,
                                    child: Image.network(
                                      signature,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, exception, stackTrace) {
                                        return SvgPicture.asset(
                                          AppImages.signaturePlaceHolder,
                                          width: 50,
                                          height: 50,
                                        );
                                      },
                                    ),
                                  )
                                : SizedBox(
                                    height: 103,
                                    child: SvgPicture.asset(
                                      AppImages.signaturePlaceHolder,
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),

                            // Image(
                            //         image: AssetImage(AppImages.signature),
                            //         width: 166,
                            //         height: 103,
                            //       )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonTextWidget(
                              text: AppStrings.receivers_signature,
                              fontSize: Dimens.ten,
                              fontColor: AppColor.blackColor,
                              fontWeight: FontWeight.w400,
                            ),
                            CommonTextWidget(
                              text: AppStrings.signed +
                                  "${DateFormat('dd-MM-yy').format(DateTime.parse(data.dateAdded.toString()))} ${DateFormat.jm().format(DateTime.parse(data.dateAdded.toString()))}",
                              fontSize: Dimens.ten,
                              fontColor: AppColor.blackColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ])),
              Container(
                height: Dimens.thirtyFive,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(Dimens.ten),
                      bottomRight: Radius.circular(Dimens.ten)),
                  color: AppColor.primaryColor,
                ),
                child: Center(
                    child: CommonTextWidget(
                  text: AppStrings.openpdf,
                  fontSize: Dimens.sixteen,
                  fontWeight: FontWeight.w600,
                  fontColor: AppColor.whiteColor,
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget detailCardCancelWidget(ResponseRoutes data) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimens.ten),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => DetailsCancelation(data)));
        },
        child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: Dimens.fifteen, vertical: Dimens.twenty),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimens.ten),
              boxShadow: [
                BoxShadow(color: AppColor.offWhite17Color, blurRadius: 5.0)
              ],
              color: AppColor.whiteColor,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonTextWidget(
                    text: "Claim: #${data.orderId}",
                    fontSize: Dimens.fifteen,
                    fontColor: AppColor.blueColor,
                    fontWeight: FontWeight.w600,
                  ),
                  Container(
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
                  )
                ],
              ),
              SizedBox(
                height: Dimens.fifteen,
              ),
              CommonTextWidget(
                text: AppStrings.patient_name,
                fontSize: Dimens.thrteen,
                fontColor: AppColor.blackColor,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                height: Dimens.eight,
              ),
              CommonTextWidget(
                text: data.patientFullName ?? "",
                fontSize: Dimens.forteen,
                fontColor: AppColor.blackColor,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: Dimens.twenty,
              ),
              CommonTextWidget(
                text: "${data.cancelReason ?? ""}",
                fontSize: Dimens.forteen,
                fontColor: AppColor.blackColor,
                fontWeight: FontWeight.w400,
                maxLines: 5,
                height: 1.4,
              ),
            ])),
      ),
    );
  }
}
