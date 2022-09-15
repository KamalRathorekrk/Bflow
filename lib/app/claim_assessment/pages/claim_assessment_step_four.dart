import 'package:bflow/app/claim_assessment/bloc/claims_assessment_bloc.dart';
import 'package:bflow/app/claim_assessment/models/post_complete_delivery.dart';
import 'package:bflow/app/common_widget/common_action_button.dart';
import 'package:bflow/app/common_widget/common_app_bar.dart';
import 'package:bflow/app/common_widget/common_header.dart';
import 'package:bflow/app/common_widget/common_text_field_simple.dart';
import 'package:bflow/app/common_widget/common_text_widget.dart';
import 'package:bflow/app/common_widget/custom_progress_indicator.dart';
import 'package:bflow/app/common_widget/snackbar/utils.dart';
import 'package:bflow/utils/AppColors.dart';
import 'package:bflow/utils/AppImages.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/CommonUtils.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClaimAssementStepFour extends StatefulWidget {
  CompleteClaimAssessment? completeClaimAssessment;

  ClaimAssementStepFour(this.completeClaimAssessment);

  @override
  _ClaimAssementStepFourState createState() => _ClaimAssementStepFourState();
}

class _ClaimAssementStepFourState extends State<ClaimAssementStepFour> {
  final _cardHolderNameController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _cvcController = TextEditingController();
  final _expController = TextEditingController();
  final _cardHolderFocusNode = FocusNode();
  final _cardNumberFocusNode = FocusNode();
  final _cvcFocusNode = FocusNode();
  final _expFocusNode = FocusNode();
  int? month, year;
  ClaimAssementsBloc? claimAssementsBloc;

  @override
  void initState() {
    claimAssementsBloc = ClaimAssementsBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CommonAppBar(
        text: AppStrings.claim_assessment,
      ),
      body: Stack(
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  child: Column(
                    children: [
                      CommonHeader(
                        step: 4,
                        postCompleteDelivery: widget
                            .completeClaimAssessment!.postCompleteDelivery,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimens.thirtyFive,
                            vertical: Dimens.twentyEight),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonTextWidget(
                              text: AppStrings.add_payment_card,
                              fontSize: Dimens.sixteen,
                              fontWeight: FontWeight.w600,
                              fontColor: AppColor.blackColor,
                            ),
                            SizedBox(
                              height: Dimens.twentyFive,
                            ),
                            CommonTextFieldSimple(
                              keyboardType: TextInputType.text,
                              textEditingController: _cardHolderNameController,
                              borderColor: AppColor.offWhite97Color,
                              labelText: AppStrings.cardholder_name,
                              color: AppColor.hintTextColor,
                              focusNode: _cardHolderFocusNode,
                              onSubmit: (val) => FocusScope.of(context)
                                  .requestFocus(_cardNumberFocusNode),
                            ),
                            CommonTextFieldSimple(
                              keyboardType: TextInputType.number,
                              textEditingController: _cardNumberController,
                              borderColor: AppColor.offWhite97Color,
                              labelText: AppStrings.card_number,
                              color: AppColor.hintTextColor,
                              focusNode: _cardNumberFocusNode,
                              onSubmit: (val) => FocusScope.of(context)
                                  .requestFocus(_cvcFocusNode),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(16),
                                CardNumberInputFormatter()
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CommonTextFieldSimple(
                                    keyboardType: TextInputType.number,
                                    textEditingController: _cvcController,
                                    borderColor: AppColor.offWhite97Color,
                                    labelText: AppStrings.cvc,
                                    color: AppColor.hintTextColor,
                                    focusNode: _cvcFocusNode,
                                    onSubmit: (val) => FocusScope.of(context)
                                        .requestFocus(_expFocusNode),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(3),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: Dimens.ten,
                                ),
                                Expanded(
                                  child: CommonTextFieldSimple(
                                    keyboardType: TextInputType.number,
                                    textEditingController: _expController,
                                    borderColor: AppColor.offWhite97Color,
                                    labelText: AppStrings.exp,
                                    color: AppColor.hintTextColor,
                                    focusNode: _expFocusNode,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(4),
                                      CardNumberExpInputFormatter()
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: Dimens.five,
                    right: Dimens.five,
                    left: Dimens.five,
                    child: innerContainer(context))
              ],
            ),
          ),
          StreamBuilder<bool>(
              stream: claimAssementsBloc!.progressStream,
              builder: (context, snapshot) {
                return Center(
                    child: CommmonProgressIndicator(
                        snapshot.hasData ? snapshot.data! : false));
              }),
        ],
      ),
    );
  }

  Widget innerContainer(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Dimens.twenty, horizontal: Dimens.thirty),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: Dimens.eight),
                child: SvgPicture.asset(AppImages.lock_security),
              ),
              CommonTextWidget(
                text: AppStrings.your_information_is_secure_and_protected,
                fontSize: Dimens.eleven,
                fontColor: AppColor.blackColor,
                fontStyle: FontStyle.italic,
              )
            ],
          ),
          SizedBox(
            height: Dimens.five,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Dimens.twenty),
            child: CommonActionButton(
              title: AppStrings.complete_delivery,
              onPressed: () {
                if (_cardHolderNameController.text.isEmpty &&
                    _cardNumberController.text.isEmpty &&
                    _cvcController.text.isEmpty &&
                    _expController.text.isEmpty) {
                  claimAssementsBloc!.completeDelivery(
                      completeClaimAssessment: widget.completeClaimAssessment!,
                      context: context);
                } else if (validate(context)) {
                  var completeClaimAssessment = CompleteClaimAssessment(
                      signature: widget.completeClaimAssessment!.signature,
                      attachments: widget.completeClaimAssessment!.attachments,
                      postCompleteDelivery: PostCompleteDelivery(
                        paymentDetails: PaymentDetails(cardHolderName: _cardHolderNameController.text.trim(),cardNumber: _cardNumberController.text.trim(),
                          cvc:_cvcController.text.trim() ,exp:_expController.text.trim() ,
                        ),notes: widget.completeClaimAssessment!.postCompleteDelivery!.notes,checkListDetails: widget.completeClaimAssessment!.postCompleteDelivery!.checkListDetails ,careGiverTitle:  widget.completeClaimAssessment!.postCompleteDelivery!.careGiverTitle,
                          careGiverName:  widget.completeClaimAssessment!.postCompleteDelivery!.careGiverName,careGiverReasonSigned:  widget.completeClaimAssessment!.postCompleteDelivery!.careGiverReasonSigned,
                          careGiverSignedPhone: widget.completeClaimAssessment!.postCompleteDelivery!.careGiverSignedPhone ,whoReceived: widget.completeClaimAssessment!.postCompleteDelivery!.whoReceived,
                        claimId:widget.completeClaimAssessment!.postCompleteDelivery!.claimId ,patientFullName:widget.completeClaimAssessment!.postCompleteDelivery!.patientFullName ,address: widget.completeClaimAssessment!.postCompleteDelivery!.address,
                      ),
                  );
                  // postCompleteDelivery: PostCompleteDelivery(claimAssessmentCheckList: ,claimId:,phoneNumber: ,item: ,orderReceiverOptions: ,patientFullName: ,deliveryAddress: ));

                  claimAssementsBloc!.completeDelivery(
                      completeClaimAssessment: widget.completeClaimAssessment!,
                      context: context);
                }

                // print(widget.completeClaimAssessment!.postCompleteDelivery.toString());

                // Navigator.pushReplacement(
                //     context,
                //     CupertinoPageRoute(
                //         builder: (context) => BottomNavigationPage()));
              },
              borderRadius: Dimens.seven,
              backgroundColor: AppColor.primaryColor,
              width: double.maxFinite,
            ),
          ),
        ],
      ),
    );
  }

  bool validate(context) {
    if (Utils.checkNullOrEmpty(_cardHolderNameController.text)) {
      SnackBarUtils.showErrorSnackBar('Please enter cardholder name', context);
      _cardHolderFocusNode.requestFocus();
      return false;
    } else if (_cardNumberController.text.isEmpty) {
      SnackBarUtils.showErrorSnackBar('Please enter card number', context);
      _cardNumberFocusNode.requestFocus();
      return false;
    } else if (_cvcController.text.isEmpty) {
      SnackBarUtils.showErrorSnackBar('Please enter CVV', context);
      _cvcFocusNode.requestFocus();
      return false;
    } else if (_cvcController.text.length < 3 ||
        _cvcController.text.length > 4) {
      SnackBarUtils.showErrorSnackBar('CVV is invalid', context);
      _cvcFocusNode.requestFocus();
      return false;
    } else if (_expController.text.isEmpty) {
      SnackBarUtils.showErrorSnackBar('Please enter card exp date', context);
      _expFocusNode.requestFocus();
      return false;
    } else if (_expController.text.isNotEmpty) {
      // The value contains a forward slash if the month and year has been
      // entered.
      if (_expController.text.contains(RegExp(r'(\/)'))) {
        var split = _expController.text.split(RegExp(r'(\/)'));
        // The value before the slash is the month while the value to right of
        // it is the year.
        month = int.parse(split[0]);
        year = int.parse(split[1]);
      } else {
        // Only the month was entered
        month = int.parse(
            _expController.text.substring(0, (_expController.text.length)));
        year = -1; // Lets use an invalid year intentionally
      }

      if ((month! < 1) || (month! > 12)) {
        // A valid month is between 1 (January) and 12 (December)
        // return 'Expiry month is invalid';
        // Utils.showErrorSnackBar(
        //     context: context, message: 'Expiry month is invalid');
        _expFocusNode.requestFocus();
        return false;
      }

      var fourDigitsYear = convertYearTo4Digits(year!);
      if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
        // We are assuming a valid year should be between 1 and 2099.
        // Note that, it's valid doesn't mean that it has not expired.
        // return 'Expiry year is invalid';
        // Utils.showErrorSnackBar(
        //     context: context, message: 'Expiry year is invalid');
        // _expFocusNode!.requestFocus();
        return false;
      }

      if (!hasDateExpired(month!, year!)) {
        // Utils.showErrorSnackBar(context: context, message: 'Card has expired');
        // _expFocusNode!.requestFocus();
        return false;
        // return "Card has expired";
      }

      return true;
    }
    return true;
  }

  /// Convert the two-digit year to four-digit year if necessary
  static int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  static bool hasDateExpired(int month, int year) {
    return !(month == null || year == null) && isNotExpired(year, month);
  }

  static bool isNotExpired(int year, int month) {
// It has not expired if both the year and date has not passed
    return !hasYearPassed(year) && !hasMonthPassed(year, month);
  }

  static bool hasMonthPassed(int year, int month) {
    var now = DateTime.now();
// The month has passed if:
// 1. The year is in the past. In that case, we just assume that the month
// has passed
// 2. Card's month (plus another month) is less than current month.
    return hasYearPassed(year) ||
        convertYearTo4Digits(year) == now.year && (month < now.month + 1);
  }

  static bool hasYearPassed(int year) {
    int fourDigitsYear = convertYearTo4Digits(year);
    var now = DateTime.now();
// The year has passed if the year we are currently, is greater than card's
// year
    return fourDigitsYear < now.year;
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write(' '); // Add double spaces.
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class CardNumberExpInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != text.length) {
        buffer.write('/');
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
