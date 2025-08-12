import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shark_mobile/core/helpers/extensions.dart';
import 'package:shark_mobile/core/helpers/space_vector.dart';
import 'package:shark_mobile/core/themes/colors.dart';
import 'package:shark_mobile/core/themes/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    // Dimensions
    this.width,
    this.height,

    // Text
    required this.labelText,
    this.labelStyle,
    this.hintText,
    this.hintTextStyle,
    this.hintFontSize = 16,

    // Icons
    this.prefixImagePath,
    this.prefixForGroundColor = ColorsManager.lightGray,
    this.suffixImagePath,
    this.suffixIcon,
    this.prefixIcon,

    // Controller & Validation
    required this.controller,
    this.validator,

    // Appearance
    this.borderRadius = 14,
    this.enabledBorderColor = ColorsManager.lightGray,
    this.focusBorderColor = ColorsManager.primary,
    this.filled = true,
    this.filledColor = ColorsManager.white,

    // Behavior
    this.obscureText = false,
    this.isNumeric = false,
    this.onChange,
    this.onSuffixTap,

    // Text Field Properties
    this.textAlignVertical,
    this.keyboardType,
    this.minLines = 1,
    this.maxLines = 1,
    this.textDirection,

    // Title and Required mark
  });

  // Dimensions
  final double? width;
  final double? height;

  // Text
  final String labelText;
  final TextStyle? labelStyle;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final double hintFontSize;

  // Icons
  final String? prefixImagePath;
  final Color? prefixForGroundColor;
  final String? suffixImagePath;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  // Controller & Validation
  final TextEditingController controller;
  final String? Function(String?)? validator;

  // Appearance
  final double borderRadius;
  final Color enabledBorderColor;
  final Color focusBorderColor;
  final bool filled;
  final Color filledColor;

  // Behavior
  final bool obscureText;
  final bool isNumeric;
  final Function(String?)? onChange;
  final VoidCallback? onSuffixTap;

  // Text Field Properties
  final TextAlignVertical? textAlignVertical;
  final TextInputType? keyboardType;
  final int minLines;
  final int maxLines;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.width(),
      height: height,
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        keyboardType: isNumeric ? TextInputType.number : keyboardType,
        onChanged: onChange,
        minLines: minLines,
        maxLines: maxLines,
        textAlignVertical: textAlignVertical ?? TextAlignVertical.center,
        textDirection: textDirection,
        cursorColor: focusBorderColor,
        style: TextStyles.font13DarkBlueRegular,

        decoration: InputDecoration(
        
          labelText: labelText,
          labelStyle: labelStyle ?? TextStyles.font14DarkBlueBold.copyWith(
            color: ColorsManager.primary
          ),
          hintText: hintText,
          hintStyle:
              hintTextStyle ??
              TextStyles.font12GrayMedium,
          filled: filled,
          fillColor: filledColor,
          prefixIcon:
              prefixIcon ??
              (prefixImagePath != null
                  ? Padding(
                      padding: context.isArabic
                          ? EdgeInsets.only(right: 12.w)
                          : EdgeInsets.only(left: 12.w),
                      child: SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: Image.asset(
                          prefixImagePath!,
                          color: prefixForGroundColor,
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                  : null),

          suffixIcon:
              suffixIcon ??
              (suffixImagePath != null
                  ? GestureDetector(
                      onTap: onSuffixTap,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 12.h,
                        ),
                        child: SvgPicture.asset(
                          suffixImagePath!,
                          color: ColorsManager.gray,
                          height: 18.h,
                          width: 18.w,
                        ),
                      ),
                    )
                  : null),

          contentPadding: EdgeInsets.symmetric(
            vertical: 14.h,
            horizontal: 16.w,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: enabledBorderColor, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: focusBorderColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: ColorsManager.red, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: ColorsManager.red, width: 2),
          ),

          errorStyle: TextStyle(fontSize: 12.sp, height: 1),
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}
