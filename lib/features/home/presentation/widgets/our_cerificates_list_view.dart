import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shark_mobile/features/home/logic/cubit/home_cubit.dart';
import 'package:shark_mobile/features/home/logic/cubit/home_state.dart';
import 'package:shark_mobile/features/home/presentation/widgets/certificate_item.dart';

class OurCerificatesListView extends StatelessWidget {
  const OurCerificatesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var homeCubit = context.read<HomeCubit>();
        return SizedBox(
          height: 140.h,
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 16.h),
            scrollDirection: Axis.horizontal,
            itemCount: homeCubit.certificates.length,
            separatorBuilder: (context, index) => SizedBox(width: 16.w),
            itemBuilder: (context, index) {
              final certificate = homeCubit.certificates[index];
              return CertificateItem(certificate: certificate);
            },
          ),
        );
      },
    );
  }
}
