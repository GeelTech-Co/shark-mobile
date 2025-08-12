import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shark_mobile/core/helpers/extensions.dart';
import 'package:shark_mobile/core/helpers/space_vector.dart';
import 'package:shark_mobile/core/routing/routes.dart';
import 'package:shark_mobile/core/themes/colors.dart';
import 'package:shark_mobile/core/themes/styles.dart';
import 'package:shark_mobile/core/widgets/custom_button.dart';
import 'package:shark_mobile/features/home/presentation/widgets/our_cerificates_list_view.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key, required this.controller});
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'welcome_to_our_company'.tr(),
                  style: TextStyles.font24BlackBold.copyWith(
                    color: ColorsManager.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                verticalSpace(8),
                Text(
                  'commitment_security_services'.tr(),
                  style: TextStyles.font15DarkBlueMedium.copyWith(
                    height: 1.6,
                    color: ColorsManager.darkBlue,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          sliver: SliverToBoxAdapter(
            child: CustomButton(
              onTap: () {
                context.pushNamed(Routes.contactUsView);
              },
              text: 'contact_us',
              backgroundColor: ColorsManager.primary,
              textColor: Colors.white,
              borderColor: ColorsManager.primary,
              borderWidth: 0,
              borderRadius: 14,
              height: 52.h,
              textStyle: TextStyles.font18WhiteMedium.copyWith(
                letterSpacing: 0.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: Container(
            height: 230.h,
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.14),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24.r),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        'https://officerreports.com/wp-content/uploads/2013/04/Blog-post-cover-10.png',
                    fit: BoxFit.cover,
                    height: 230.h,
                    width: double.infinity,
                  ),
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.6),
                          ],
                          stops: const [0.5, 1.0],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 24.h,
                    left: 24.w,
                    right: 24.w,
                    child: Text(
                      'our_commitment_to_excellence'.tr(),
                      style: TextStyles.font18WhiteMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20.w),
          sliver: SliverToBoxAdapter(
            child: Text(
              'our_certificates'.tr(),
              style: TextStyles.font24BlueBold.copyWith(
                color: ColorsManager.primary,
              ),
            ),
          ),
        ),

        SliverToBoxAdapter(child: OurCerificatesListView()),

        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          sliver: SliverToBoxAdapter(
            child: CustomButton(
              borderColor: ColorsManager.gray,
              borderWidth: 1.w,
              height: 48,
              borderRadius: 8.r,
              textColor: ColorsManager.primary,
              textStyle: TextStyles.font14BlueSemiBold,
              onTap: () {
                controller.animateTo(2);
              },
              text: 'explore_our_services',
              backgroundColor: ColorsManager.white,
            ),
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 32.h)),
      ],
    );
  }
}
