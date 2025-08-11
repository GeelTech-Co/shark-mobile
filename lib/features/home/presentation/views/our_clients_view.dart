// 📂 our_clients_list_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shark_mobile/features/home/logic/cubit/home_cubit.dart';

class OurClientsListView extends StatelessWidget {
  final HomeCubit homeCubit;
  const OurClientsListView({super.key, required this.homeCubit});

  @override
  Widget build(BuildContext context) {
    final clients = homeCubit.clients;

    return MasonryGridView.count(
      crossAxisCount: 2, // عمودين
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: clients.length,
      itemBuilder: (context, index) {
        final client = clients[index];
        final double randomHeight = (index % 2 == 0 ? 180 : 240).h;

        return GestureDetector(
          onTap: () {
            // TODO: أكشن عند الضغط
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12.r),
                  ),
                  child: Image.network(
                    client['logo']!,
                    height: randomHeight,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Text(
                    client['name']!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
