import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shark_mobile/core/helpers/space_vector.dart';
import 'package:shark_mobile/core/themes/styles.dart';

class CategoryHeader extends StatelessWidget {
  final String title;

  final void Function()? onTap;

  const CategoryHeader({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title.tr(), style: TextStyles.font18DarkBlueBold),
            horizontalSpace(5),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
