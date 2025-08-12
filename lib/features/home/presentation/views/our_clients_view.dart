// 📂 our_clients_view.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shark_mobile/core/helpers/extensions.dart';
import 'package:shark_mobile/core/helpers/space_vector.dart';
import 'package:shark_mobile/core/themes/colors.dart';
import 'package:shark_mobile/features/home/logic/cubit/home_cubit.dart';
import 'package:shark_mobile/features/home/presentation/widgets/client_card.dart';
import 'package:shark_mobile/features/home/presentation/widgets/our_clients_app_bar.dart';

class OurClientsView extends StatelessWidget {
  final HomeCubit homeCubit;
  const OurClientsView({super.key, required this.homeCubit});

  @override
  Widget build(BuildContext context) {
    final clients = homeCubit.clients;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorsManager.lightBlue,
              ColorsManager.lightBlue.withOpacity(0.8),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            OurClientsAppBar(),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              sliver: SliverMasonryGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childCount: clients.length,
                itemBuilder: (context, index) {
                  final client = clients[index];
                  final double imageHeight = (180 + (index % 3) * 40).h;

                  return TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: Duration(milliseconds: 400 + index * 100),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Transform.translate(
                          offset: Offset(0, (1 - value) * 30),
                          child: child,
                        ),
                      );
                    },
                    child: ClientCard(
                      name: client['name']!,
                      imageUrl: client['logo']!,
                      height: imageHeight,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
