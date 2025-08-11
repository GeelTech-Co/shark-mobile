import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shark_mobile/core/helpers/space_vector.dart';
import 'package:shark_mobile/core/themes/colors.dart';
import 'package:shark_mobile/core/themes/styles.dart';
import 'package:shark_mobile/features/home/data/model/service_model.dart';

class ServiceDetailsView extends StatelessWidget {
  final ServiceModel service;

  const ServiceDetailsView({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(service.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(
                service.imageUrl,
                width: double.infinity,
                height: 250.h,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 250.h,
                  color: Colors.grey[200],
                  child: const Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(height: 20.h),

            // Service Title
            Text(service.title, style: TextStyles.font24BlackBold),
            SizedBox(height: 10.h),

            // Service Description
            Text(service.description, style: TextStyles.font13GrayRegular),
            SizedBox(height: 20.h),

            // Additional Details Section
            Text('Service Features', style: TextStyles.font18DarkBlueBold),
            verticalSpace(10),

            // Feature List
            Column(
              children: [
                _buildFeatureItem('24/7 Availability'),
                _buildFeatureItem('Professional Staff'),
                _buildFeatureItem('Advanced Equipment'),
                _buildFeatureItem('Custom Solutions'),
              ],
            ),
            SizedBox(height: 40.h),

            Container(
              height: 48.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: ColorsManager.primary,
                borderRadius: BorderRadius.circular(8.r),
              ),

              child: Center(
                child: Text('Contact us', style: TextStyles.font16WhiteSemiBold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String feature) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 20.w),
          SizedBox(width: 8.w),
          Expanded(child: Text(feature, style: TextStyles.font18DarkBlueBold)),
        ],
      ),
    );
  }
}
