import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shark_mobile/core/helpers/extensions.dart';
import 'package:shark_mobile/core/helpers/space_vector.dart';
import 'package:shark_mobile/core/themes/styles.dart';

class OurClientsAppBar extends StatelessWidget {
  const OurClientsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      expandedHeight: 200.h,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: GestureDetector(
        onTap: () => context.pop(),
        child: const Icon(Icons.arrow_back_ios, color: Colors.white),
      ),
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final percentage =
              (constraints.maxHeight - kToolbarHeight) /
              (200.h - kToolbarHeight);

          return Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFB3DDE8), Color(0xFFE6F2F8)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [Colors.black.withOpacity(0.4), Colors.transparent],
                  ),
                ),
              ),

              Positioned(
                left: 0,
                right: 0,
                bottom: 24.h,
                child: Opacity(
                  opacity: percentage.clamp(0.0, 1.0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "our_clients".tr(),
                          style: TextStyles.font32BlueBold.copyWith(
                            foreground: Paint()
                              ..shader = LinearGradient(
                                colors: [Color(0xFFD6E6F2), Colors.white],
                              ).createShader(Rect.fromLTWH(0, 0, 200, 70)),
                            fontSize: 30.sp,
                          ),
                        ),
                        verticalSpace(6),
                        Text(
                          "success_partners".tr(),
                          style: TextStyles.font14DarkBlueBold.copyWith(
                            color: Color(0xFF0F4C75),
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
