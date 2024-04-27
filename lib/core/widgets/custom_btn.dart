import 'package:flutter/material.dart';
import 'package:se7tey/core/utils/colors.dart';
import 'package:se7tey/core/utils/text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.radius,
    this.color,
    this.textColor,
  });
  final String text;
  final Function() onPressed;
  final double? width;
  final double? radius;
  final double? height;
  final Color? color;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: color ?? AppColors.blue,
              foregroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius ?? 15))),
          onPressed: onPressed,
          child: Text(
            text,
            style: getTitleStyle(color: textColor ?? AppColors.white),
          )),
    );
  }
}
