import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shark_mobile/core/helpers/extensions.dart';
import 'package:shark_mobile/core/helpers/space_vector.dart';
import 'package:shark_mobile/core/themes/colors.dart';
import 'package:shark_mobile/core/themes/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    this.backgroundColor = ColorsManager.primary,
    this.borderRadius = 50,
    required this.text,
    this.height = 50,
    this.textColor = Colors.white,
    this.borderWidth = 1.0,
    this.borderColor = Colors.transparent,
    this.textStyle,
    this.width,
    this.bottonIcon,
    this.isbottonIcon = false,
    this.isClickable = true,
    this.vrticalPadding,
    this.horizontalPaddin,
    this.isLoading = false,
  });
  final bool? isClickable;
  final VoidCallback onTap;
  final Color backgroundColor;
  final double borderRadius;
  final String text;
  final Color textColor;
  final double height;
  final double? width;
  final double borderWidth;
  final Color borderColor;
  final TextStyle? textStyle;
  final Widget? bottonIcon;
  final bool isbottonIcon;
  final double? vrticalPadding;
  final double? horizontalPaddin;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: vrticalPadding?.h ?? 0,
          horizontal: horizontalPaddin?.w ?? 0,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor, width: borderWidth),
        ),
        height: height,
        width: width ?? context.width(),
        child: isLoading
            ? Center(
                child: SizedBox(
                  height: 20.h,
                  width: 20.w,
                  child: CircularProgressIndicator(
                    color: textColor,
                    strokeWidth: 2.w,
                  ),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isbottonIcon) ...[
                    bottonIcon ?? SizedBox.shrink(),
                    horizontalSpace(8),
                  ],
                  Center(
                    child: Text(
                      text.tr(),
                      style: textStyle ?? TextStyles.font16WhiteSemiBold,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
