import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shark_mobile/core/helpers/extensions.dart';
import 'package:shark_mobile/core/themes/colors.dart';
import 'package:shark_mobile/features/home/presentation/widgets/news_details_app_bar.dart';

class NewsDetailsView extends StatelessWidget {
  final Map<String, String> news;

  const NewsDetailsView({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          NewsDetailsAppBar(news: news),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text(
                  news['description'] ?? 'No description available.',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: ColorsManager.darkBlue,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 40.h),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
