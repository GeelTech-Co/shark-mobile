import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shark_mobile/core/helpers/space_vector.dart';
import 'package:shark_mobile/core/themes/colors.dart';
import 'package:shark_mobile/core/themes/styles.dart';
import 'package:shark_mobile/features/home/presentation/widgets/animated_job_card.dart';
import 'package:shark_mobile/features/home/presentation/widgets/services/job_details.dart';

class CareersTab extends StatelessWidget {
  const CareersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'join_our_team'.tr(),
              style: TextStyles.font24BlueBold.copyWith(
                fontSize: 28.sp,
                letterSpacing: 0.5,
              ),
            ),
            verticalSpace(6),
            GestureDetector(
              child: Text(
                'hr.m@shark-me.com',
                style: TextStyles.font14BlueSemiBold.copyWith(
                  fontSize: 16.sp,
                  decoration: TextDecoration.underline,
                  color: ColorsManager.primary,
                ),
              ),
            ),
            verticalSpace(6),
            Text(
              "we_will_get_back_to_you_promptly".tr(),
              style: TextStyles.font14GrayRegular.copyWith(
                fontSize: 14.sp,
                color: ColorsManager.gray.withOpacity(0.7),
              ),
            ),
            verticalSpace(32),
            Text(
              'security_officer'.tr(),
              style: TextStyles.font18DarkBlueBold.copyWith(
                fontSize: 22.sp,
                letterSpacing: 0.3,
              ),
            ),
            verticalSpace(16),
            AnimatedJobCard(
              child: Column(
                children: [
                  JobDetail(
                    title: 'age',
                    description: 'age_range',
                    icon: Icons.person_outline,
                  ),
                  JobDetail(
                    title: 'good_conduct',
                    description: 'must_have_clean_record',
                    icon: Icons.verified_user_outlined,
                  ),
                  JobDetail(
                    title: 'appearance',
                    description: 'professional_and_presentable',
                    icon: Icons.face_outlined,
                  ),
                  JobDetail(
                    title: 'experience',
                    description: 'preferably_served_in_armed_forces',
                    icon: Icons.military_tech_outlined,
                  ),
                  JobDetail(
                    title: 'location',
                    description: 'all_areas_of_amman_and_environs',
                    icon: Icons.location_on_outlined,
                  ),
                ],
              ),
            ),
            verticalSpace(40),
          ],
        ),
      ),
    );
  }
}
