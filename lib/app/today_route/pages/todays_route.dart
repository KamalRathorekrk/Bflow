import 'package:bflow/app/common_widget/common_text_widget.dart';
import 'package:bflow/app/common_widget/custom_progress_indicator.dart';
import 'package:bflow/app/routes_activity_list/model/get_routes_list.dart';
import 'package:bflow/app/today_route/bloc/todays_route_bloc.dart';
import 'package:bflow/app/today_route/model/claims_model.dart';
import 'package:bflow/app/today_route/model/datamodel.dart';
import 'package:bflow/app/today_route/pages/todays_route_details.dart';
import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppImages.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class TodaysRoute extends StatefulWidget {
  @override
  _TodaysRouteState createState() => _TodaysRouteState();
}

class _TodaysRouteState extends State<TodaysRoute> {
  // List<DataModel> itemList = [];
  TodaysRouteBloc? todaysRouteBloc;
  DateTime? _dateTime;
  var formatter = DateFormat('EE, MMM dd');

  void initState() {
    todaysRouteBloc = TodaysRouteBloc();
    todaysRouteBloc!.getClaims(context: context);
    _dateTime = DateTime.now();

    // itemList.add(DataModel(
    //     id: "#53434",
    //     location: "1700 Cheddar Ln ,TN",
    //     name: "Skywalker Diana",
    //     time: "3:10PM",
    //     check: true));
    // itemList.add(DataModel(
    //     id: "#77434",
    //     location: "3400 Cheddar Ln ,TN",
    //     name: "Albert Smith",
    //     time: "",
    //     check: false));
    // itemList.add(DataModel(
    //     id: "#88434",
    //     location: "4400 Cheddar Ln ,TN",
    //     name: "Johnson Park",
    //     time: "",
    //     check: false));
    // itemList
    //   ..add(DataModel(
    //       id: "#99434",
    //       location: "6700 Cheddar Ln ,TN",
    //       name: "Penny Rick",
    //       time: "",
    //       check: false))
    //   ..add(DataModel(
    //       id: "#55434",
    //       location: "6700 Cheddar Ln ,TN",
    //       name: "Penny Rick",
    //       time: "",
    //       check: false))
    //   ..add(DataModel(
    //       id: "#99434s",
    //       location: "6700 Cheddar Ln ,TN",
    //       name: "Penny Rick",
    //       time: "",
    //       check: false))
    //   ..add(DataModel(
    //       id: "#99434s",
    //       location: "6700 Cheddar Ln ,TN",
    //       name: "Penny Rick",
    //       time: "",
    //       check: false));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColor.offWhiteColor,
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: AppColor.backgroundColor,
            title: CommonTextWidget(
              text: AppStrings.today_route,
              fontSize: Dimens.eighteen,
              fontColor: AppColor.whiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          body: StreamBuilder<List<ClaimList>>(
              stream: todaysRouteBloc!.claimsStream,

              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.data != null &&
                    snapshot.data!.length > 0) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      // vertical: Dimens.thirty,
                    ),
                    child: SingleChildScrollView(
                      controller: ScrollController(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: Dimens.thirty,),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimens.twentyFive),
                            child: CommonTextWidget(
                              text: formatter.format(_dateTime!).toString(),
                              fontSize: Dimens.twenty,
                              fontWeight: FontWeight.w700,
                              fontColor: AppColor.backgroundColor,
                            ),
                          ),
                          SizedBox(
                            height: Dimens.ten,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimens.twentyFive),
                            child: CommonTextWidget(
                              text: snapshot.data!.length > 1
                                  ? "${snapshot.data!.length} Stops"
                                  : "${snapshot.data!.length} Stop",
                              fontSize: Dimens.forteen,
                              fontWeight: FontWeight.w500,
                              fontColor: AppColor.backgroundColor,
                            ),
                          ),
                          SizedBox(
                            height: Dimens.twenty,
                          ),
                          ListData(context: context, data: snapshot.data),
                        ],
                      ),
                    ),

                    // bottomNavigationBar: BottomNavigationPage(),
                  );
                } else {
                  return Container(
                    child: Center(child: SvgPicture.asset(AppImages.list)),
                  );
                }
              }),
        ),
        StreamBuilder<bool>(
          stream: todaysRouteBloc!.progressStream,
          builder: (context, snapshot) {
            return Center(
                child: CommmonProgressIndicator(
                    snapshot.hasData ? snapshot.data! : false));
          },
        ),
      ],
    );
  }

  Widget CommonItemWidget({
    index,
    String? id,
    String? location,
    String? name,
    String? time,
    bool? status,
    Color? color,
    Color? shadowColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimens.twentyFive),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: shadowColor ?? AppColor.offWhiteColor,
              blurRadius: 10.0,
              offset: Offset(0.0, 0.75))
        ],
        color: color ?? AppColor.offWhiteColor,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 2,
                margin: EdgeInsets.only(bottom: Dimens.five),
                height: Dimens.five,
                //color: AppColor.blackColor,
              ),
              CommonTextWidget(
                text: "0$index",
                fontSize: Dimens.fifteen,
                fontWeight: FontWeight.w500,
                fontColor: AppColor.backgroundColor,
              ),
              Container(
                width: 2,
                margin: EdgeInsets.only(top: Dimens.five),
                height: Dimens.fortyFive,
                color: AppColor.blackColor,
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: Dimens.eighteen),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonTextWidget(
                    text: "Claim : #$id",
                    fontSize: Dimens.fifteen,
                    fontWeight: FontWeight.w600,
                    fontColor: AppColor.blueColor,
                  ),
                  SizedBox(
                    height: Dimens.seven,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16,
                      ),
                      CommonTextWidget(
                        text: location!,
                        fontSize: Dimens.forteen,
                        fontWeight: FontWeight.w500,
                        fontColor: AppColor.blackColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimens.seven,
                  ),
                  CommonTextWidget(
                    text: name!,
                    fontSize: Dimens.thrteen,
                    fontWeight: FontWeight.w400,
                    fontColor: AppColor.blackColor,
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: status!,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CommonTextWidget(
                  text: time!,
                  fontSize: Dimens.forteen,
                  fontWeight: FontWeight.w600,
                  fontColor: AppColor.blackColor,
                ),
                SizedBox(
                  height: Dimens.seven,
                ),
                SvgPicture.asset(AppImages.tick),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget ListData({context, List<ClaimList>? data}) {
    ResponseRoutes responseRoutes = ResponseRoutes();
    return ListView.builder(
        shrinkWrap: true,
        physics:NeverScrollableScrollPhysics() ,
        padding: EdgeInsets.zero,
        itemCount: data!.length,
        itemBuilder: (context, position) {
          print(data[position].toString());
          return GestureDetector(
            onTap: () {
              if (position == 1) {
                // Navigator.push(
                //     context,
                //     CupertinoPageRoute(
                //         builder: (context) => DetailsPageSucess(responseRoutes: responseRoutes,)));
              } else {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => TodaysRouteDetails(
                              claimId: data[position].claimId.toString(),
                            )));
              }
            },
            child: CommonItemWidget(
                index: position + 1,
                id: data[position].claimId.toString(),
                location:
                    "${data[position].deliveryAddress!.address}, ${data[position].deliveryAddress!.city}, ${data[position].deliveryAddress!.state}",
                name: data[position].patientFullName ?? "",
                time: data[position].deliveryTime ?? "",
                status:
                    data[position].deliveryStatus == 'InTransit' ? false : true,
                color: position != 1
                    ? AppColor.offWhiteColor
                    : AppColor.whiteColor,
                shadowColor: position != 1
                    ? AppColor.offWhiteColor
                    : AppColor.hintColor),
          );
        });
  }
}
