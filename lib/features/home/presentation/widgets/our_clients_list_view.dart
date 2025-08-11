import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shark_mobile/features/home/logic/cubit/home_cubit.dart';

class OurClientsListView extends StatelessWidget {
  const OurClientsListView({super.key, required this.homeCubit});
  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: homeCubit.clients.length,
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          final client = homeCubit.clients[index];
          return Column(
            children: [
              CircleAvatar(
                radius: 35.r,
                backgroundImage: NetworkImage(client['logo']!),
              ),
              SizedBox(height: 6.h),
              Text(
                client['name']!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          );
        },
      ),
    );
  }
}
