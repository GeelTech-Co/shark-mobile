import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shark_mobile/core/helpers/extensions.dart';
import 'package:shark_mobile/core/themes/colors.dart';

class NewsDetailsAppBar extends StatelessWidget {
  const NewsDetailsAppBar({super.key, required this.news});
  final Map<String, String> news;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: GestureDetector(
        onTap: () => context.pop(),
        child: const Icon(Icons.arrow_back_ios, color: Colors.white),
      ),
      expandedHeight: 300.h,
      pinned: true,
      backgroundColor: ColorsManager.primary,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(left: 16.w, bottom: 16.h),
        title: Text(
          news['title'] ?? '',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.black54,
                offset: Offset(0, 1),
                blurRadius: 4,
              ),
            ],
          ),
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              news['image'] ?? '',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey[300],
                child: Icon(Icons.error, size: 60),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
