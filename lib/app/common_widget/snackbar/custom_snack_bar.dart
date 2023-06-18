import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/Dimens.dart';
import 'package:flutter/material.dart';

/// Popup widget that you can use by default to show some information
class CustomSnackBar extends StatefulWidget {
  final String message;
  final Widget icon;
  final Color backgroundColor;
  final TextStyle textStyle;
  final int iconRotationAngle;

  const CustomSnackBar.success({
    Key? key,
    required this.message,
    this.icon = const Icon(Icons.sentiment_very_satisfied,
        color: const Color(0x15000000), size: 120),
    this.textStyle = const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        fontFamily: AppStrings.fontFamily,
        color: Colors.white),
    this.iconRotationAngle = 32,
    this.backgroundColor = const Color(0xff00E676),
  });

  const CustomSnackBar.info({
    Key? key,
    required this.message,
    this.icon = const Icon(Icons.sentiment_neutral,
        color: const Color(0x15000000), size: 120),
    this.textStyle = const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        fontFamily: AppStrings.fontFamily,
        color: Colors.white),
    this.iconRotationAngle = 32,
    this.backgroundColor = const Color(0xff2196F3),
  });

  const CustomSnackBar.error({
    Key? key,
    required this.message,
    this.icon = const Icon(
      Icons.error_outline,
      color: const Color(0x15000000),
      size: 120,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      fontFamily: AppStrings.fontFamily,
      color: Colors.white,
    ),
    this.iconRotationAngle = 32,
    this.backgroundColor = const Color(0xffff5252),
  });

  @override
  _CustomSnackBarState createState() => _CustomSnackBarState();
}

class _CustomSnackBarState extends State<CustomSnackBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Dimens.eighteen, horizontal: Dimens.ten),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(Dimens.five)),
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              offset: Offset(0.0, 8.0),
              spreadRadius: 1,
              blurRadius: 30),
        ],
      ),
      width: double.infinity,
      child: Text(widget.message,
          style: theme.textTheme.bodyText2?.merge(widget.textStyle),
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          maxLines: 2),
    );
  }
}
