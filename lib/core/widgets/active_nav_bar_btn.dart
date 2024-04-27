import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:se7tey/core/utils/colors.dart';
import 'package:se7tey/core/utils/text_style.dart';

class ActiveButton extends StatelessWidget {
  const ActiveButton(
      {super.key, this.width, required this.icon, required this.label});
  final double? width;
  final String icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width ?? 100,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
          const Gap(7),
          Text(label, style: getbodyStyle(color: AppColors.white)),
        ],
      ),
    );
  }
}
