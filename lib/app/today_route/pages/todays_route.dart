import 'package:bflow/app/bottom_nav_bar/bottom_navigation_pages.dart';
import 'package:bflow/app/claim_assessment/pages/details_page_sucess.dart';
import 'package:bflow/app/common_widget/common_text_widget.dart';
import 'package:bflow/app/common_widget/custom_progress_indicator.dart';
import 'package:bflow/app/today_route/bloc/todays_route_bloc.dart';
import 'package:bflow/app/today_route/model/datamodel.dart';
import 'package:bflow/app/today_route/pages/todays_route_details.dart';
import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppImages.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TodaysRoute extends StatefulWidget {
  @override
  _TodaysRouteState createState() => _TodaysRouteState();
}

class _TodaysRouteState extends State<TodaysRoute> {
  List<DataModel> itemList = [];
  TodaysRouteBloc? todaysRouteBloc;
  void initState() {
    todaysRouteBloc=TodaysRouteBloc();
    itemList.add(DataModel(
        id: "#53434",
        location: "1700 Cheddar Ln ,TN",
        name: "Skywalker Diana",
        time: "3:10PM",
        check: true));
    itemList.add(DataModel(
        id: "#77434",
        location: "3400 Cheddar Ln ,TN",
        name: "Albert Smith",
        time: "",
        check: false));
    itemList.add(DataModel(
        id: "#88434",
        location: "4400 Cheddar Ln ,TN",
        name: "Johnson Park",
        time: "",
        check: false));
    itemList..add(DataModel(
        id: "#99434",
        location: "6700 Cheddar Ln ,TN",
        name: "Penny Rick",
        time: "",
        check: false))..add(DataModel(
        id: "#55434",
        location: "6700 Cheddar Ln ,TN",
        name: "Penny Rick",
        time: "",
        check: false))..add(DataModel(
        id: "#99434s",
        location: "6700 Cheddar Ln ,TN",
        name: "Penny Rick",
        time: "",
        check: false))..add(DataModel(
        id: "#99434s",
        location: "6700 Cheddar Ln ,TN",
        name: "Penny Rick",
        time: "",
        check: false));
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StreamBuilder<Object>(
          stream: null,
          builder: (context, snapshot) {
            return Scaffold(
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
              body: SingleChildScrollView(
                controller: ScrollController(),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: Dimens.thirty,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Dimens.twentyFive),
                        child: CommonTextWidget(
                          text: "Mon, Dec 17",
                          fontSize: Dimens.twenty,
                          fontWeight: FontWeight.w700,
                          fontColor: AppColor.backgroundColor,
                        ),
                      ),
                      SizedBox(
                        height: Dimens.ten,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Dimens.twentyFive),
                        child: CommonTextWidget(
                          text: "10 Spots",
                          fontSize: Dimens.forteen,
                          fontWeight: FontWeight.w500,
                          fontColor: AppColor.backgroundColor,
                        ),
                      ),
                      SizedBox(
                        height: Dimens.twenty,
                      ),
                      ListData(context),
                    ],
                  ),
                ),
              ),
              // bottomNavigationBar: BottomNavigationPage(),
            );
          }
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

  Widget CommonItemWidget({index,
    String? id,
    String? location,
    String? name,
    String? time,
    bool? status,
    Color? color, Color? shadowColor,}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimens.twentyFive),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: shadowColor ?? AppColor.offWhiteColor,
            blurRadius: 10.0,
              offset: Offset(0.0, 0.75)
          )
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
              padding:  EdgeInsets.only(left: Dimens.eighteen),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonTextWidget(
                    text: "Claim :$id",
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

  Widget ListData(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: itemList.length,
        itemBuilder: (context, position) {
          return GestureDetector(
            onTap: () {
              if(position==0){
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => DetailsPageSucess()));
              }
              else {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => TodaysRouteDetails(claimId: "5653",)));
              }
            },
            child: CommonItemWidget(
                index: position + 1,
                id: itemList[position].id,
                location: itemList[position].location,
                name: itemList[position].name,
                time: itemList[position].time,
                status: itemList[position].check,
                color: position != 1
                    ? AppColor.offWhiteColor
                    : AppColor.whiteColor,
            shadowColor: position != 1
                ? AppColor.offWhiteColor
                : AppColor.hintColor)
          ,
          );
        });
  }
}
