import 'package:bflow/app/bottom_nav_bar/bottom_navigation_pages.dart';
import 'package:bflow/app/claim_assessment/pages/details_page_cancelation.dart';
import 'package:bflow/app/claim_assessment/pages/details_page_sucess.dart';
import 'package:bflow/app/common_widget/common_action_button.dart';
import 'package:bflow/app/common_widget/common_text_widget.dart';
import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppImages.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoutesActivityList extends StatefulWidget {
  @override
  _RoutesActivityListState createState() => _RoutesActivityListState();
}

class _RoutesActivityListState extends State<RoutesActivityList> {
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
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: Dimens.twentyFive, horizontal: Dimens.twentyFive),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              detailCardSucessWidget(),
              SizedBox(
                height: Dimens.fifteen,
              ),
              DetailCardCancelWidget(),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationPage(),
    );
  }

  Widget detailCardSucessWidget() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => DetailsPageSucess()));
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
                            text: "Claim: #53434",
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
                                vertical: Dimens.five, horizontal: Dimens.eight),
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
                        text: "Mary Beth",
                        fontSize: Dimens.forteen,
                        fontColor: AppColor.blackColor,
                        fontWeight: FontWeight.w500,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage(AppImages.signature),
                            width: 166,
                            height: 103,
                          )
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
                            text: AppStrings.signed,
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
    );
  }

  Widget DetailCardCancelWidget() {
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => DetailsCancelation(reasonOfCancealation: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",)));
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
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonTextWidget(
                  text: "Claim: #53434",
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
              text: "Mary Beth",
              fontSize: Dimens.forteen,
              fontColor: AppColor.blackColor,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: Dimens.twenty,
            ),
            CommonTextWidget(
              text:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              fontSize: Dimens.forteen,
              fontColor: AppColor.blackColor,
              fontWeight: FontWeight.w400,
              maxLines: 5,
              height: 1.4,
            ),
          ])),
    );
  }
}
