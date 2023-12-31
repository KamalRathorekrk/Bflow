import 'package:bflow/app/common_widget/common_text_widget.dart';
import 'package:bflow/app/common_widget/custom_progress_indicator.dart';
import 'package:bflow/app/pre_delivery/bloc/pre_delivery_block.dart';
import 'package:bflow/app/pre_delivery/model/PreDeliveryListModel.dart';
import 'package:bflow/app/pre_delivery/pages/add_claim.dart';
import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppImages.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PreDelivery extends StatefulWidget {
  @override
  _PreDeliveryState createState() => _PreDeliveryState();
}

class _PreDeliveryState extends State<PreDelivery> {
  PreDeliveryBloc? preDeliveryBloc;

  @override
  void initState() {
    preDeliveryBloc = PreDeliveryBloc();
    preDeliveryBloc!.getPreClaims();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: AppColor.backgroundColor,
            title: CommonTextWidget(
              text: AppStrings.pre_delivery,
              fontSize: Dimens.eighteen,
              fontColor: AppColor.whiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          body: StreamBuilder<List<PreDeliveryobject>>(
              stream: preDeliveryBloc!.claimspreStream,
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.data != null &&
                    snapshot.data!.length > 0) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.symmetric(
                        // vertical: Dimens.thirty,
                        horizontal: Dimens.twentyFive),
                    child: SingleChildScrollView(
                      controller: ScrollController(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Dimens.ten,
                          ),
                          ListData(context: context, obj: snapshot.data!),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Container(
                    child: Center(child: SvgPicture.asset(AppImages.list)),
                  );
                }
              }),
        ),
        StreamBuilder<bool>(
            stream: preDeliveryBloc!.progressStream,
            builder: (context, snapshot) {
              return Center(
                  child: CommmonProgressIndicator(
                      snapshot.hasData ? snapshot.data! : false));
            }),
      ],
    );
  }

  Widget CommonItemWidget({
    index,
    String? id,
    String? location,
    String? name,
  }) {
    return Container(
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
              padding: const EdgeInsets.only(left: 18.0),
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
        ],
      ),
    );
  }

  Widget ListData(
      {required BuildContext context, required List<PreDeliveryobject> obj}) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: obj.length,
        itemBuilder: (context, position) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => AddClaim(
                            claimId: obj[position].claimId.toString(),
                          ))).then((value) => preDeliveryBloc!.getPreClaims());
            },
            child: CommonItemWidget(
              index: position + 1,
              id: obj[position].claimId.toString(),
              location:
                  "${obj[position].address},${obj[position].city},${obj[position].state},${obj[position].zipcode}",
              name: obj[position].patientFullName.toString(),
            ),
          );
        });
  }
}
