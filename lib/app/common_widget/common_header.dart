
import 'package:bflow/app/claim_assessment/models/post_complete_delivery.dart';
import 'package:bflow/app/common_widget/common_text_widget.dart';
import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppImages.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonHeader extends StatelessWidget{
  final int? step;
   final PostCompleteDelivery? postCompleteDelivery;


  const CommonHeader({ this.postCompleteDelivery,this.step}) ;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Dimens.twenty, horizontal: Dimens.twenty),
      decoration: BoxDecoration(
          color: AppColor.offWhitef3Color,
          border: Border.all(
              color: AppColor.offWhite66Color, width: 0.2)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonTextWidget(
                text: "Claim: #${postCompleteDelivery!.claimId}",
                fontSize: Dimens.fifteen,
                fontWeight: FontWeight.w600,
                fontColor: AppColor.blackColor,
              ),
              CommonTextWidget(
                text: "Step ${step} of 4",
                fontSize: Dimens.thrteen,
                fontWeight: FontWeight.w600,
                fontColor: AppColor.primaryColor,
              ),
            ],
          ),
          SizedBox(height: Dimens.eleven,),
          Row(
            children: [
              CommonTextWidget(
                text: "Patient’s Name : ",
                fontSize: Dimens.fifteen,
                fontWeight: FontWeight.w400,
                fontColor: AppColor.blackColor,
              ),
              CommonTextWidget(
                text: postCompleteDelivery!.patientFullName.toString(),
                fontSize: Dimens.thrteen,
                fontWeight: FontWeight.w500,
                fontColor: AppColor.blackColor,
              ),
            ],
          ),
          SizedBox(height: Dimens.eight,),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: Dimens.four),
                child: SvgPicture.asset(AppImages.location),
              ),
              CommonTextWidget(
                text: "${postCompleteDelivery!.deliveryAddress!.address.toString()}, ${postCompleteDelivery!.deliveryAddress!.city.toString()}, ${postCompleteDelivery!.deliveryAddress!.state.toString()}",
                fontSize: Dimens.forteen,
                fontColor: AppColor.blackColor,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ],
      ),

    );


  }
}