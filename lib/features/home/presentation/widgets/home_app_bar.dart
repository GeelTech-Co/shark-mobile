import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shark_mobile/core/themes/colors.dart';
import 'package:shark_mobile/core/themes/styles.dart';
import 'package:shark_mobile/features/home/logic/cubit/home_cubit.dart';
import 'package:shark_mobile/features/home/presentation/widgets/rounded_underline_indicator.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;
  final String selectedLanguage;
  final ValueChanged<String> onLanguageChanged;

  const HomeAppBar({
    super.key,
    required this.tabController,
    required this.selectedLanguage,
    required this.onLanguageChanged,
  });

  @override
  Size get preferredSize => Size.fromHeight(110.h);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return AppBar(
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      backgroundColor: ColorsManager.white,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(48.h),
        child: Container(
          height: 48.h,
          decoration: BoxDecoration(
            color: ColorsManager.white, // Moved color to BoxDecoration
            border: Border.all(
              width: 0,
              color: Colors.transparent,
            ), // No border
          ),
          child: TabBar(
            isScrollable: true,
            controller: tabController,
            indicator: RoundedUnderlineIndicator(
              borderSide: BorderSide(color: ColorsManager.primary, width: 4.h),
              insets: EdgeInsets.symmetric(horizontal: 2.w),
              borderRadius: 2.r,
            ),
            indicatorWeight: 0, // Disable default underline
            indicatorSize: TabBarIndicatorSize.label,
            labelPadding: EdgeInsets.symmetric(horizontal: 16.w),
            dividerColor: Colors.transparent, // Remove divider line
            tabs: cubit.titles
                .map(
                  (title) => Tab(
                    child: Text(
                      title.tr(),
                      style: tabController.index == cubit.titles.indexOf(title)
                          ? TextStyles.font18PrimaryBold
                          : TextStyles.font14DarkBlueMedium,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
      title: Row(
        children: [
          SizedBox(width: 12.w),
          Image.asset(
            'assets/images/app_logo.png',
            height: 45.h,
            width: 45.w,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 12.w),
          Text('Shark'.tr(), style: TextStyles.font24BlueBold),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: ColorsManager.moreLightGray,
              value: selectedLanguage,
              icon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Icon(
                  Icons.language,
                  color: ColorsManager.primary,
                  size: 24.w,
                ),
              ),
              items: ['English', 'العربيه'].map((lang) {
                return DropdownMenuItem(
                  value: lang,
                  child: Text(lang, style: TextStyles.font14BlueSemiBold),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  onLanguageChanged(value);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
