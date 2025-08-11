// 📂 all_tab.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shark_mobile/core/helpers/space_vector.dart';
import 'package:shark_mobile/core/widgets/category_header.dart';
import 'package:shark_mobile/features/home/logic/cubit/home_cubit.dart';
import 'package:shark_mobile/features/home/presentation/widgets/news_carousel_slider.dart';
import 'package:shark_mobile/features/home/presentation/widgets/our_clients_list_view.dart';
import 'package:shark_mobile/features/home/presentation/widgets/our_services_list_view.dart';
import 'package:shark_mobile/features/home/presentation/widgets/search.dart';

class AllTab extends StatelessWidget {
  const AllTab({super.key, required this.tabController});
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            verticalSpace(16),
            const Search(),
            verticalSpace(20),
            NewsCarouselSlider(homeCubit: cubit),
            verticalSpace(20),
            CategoryHeader(
              onTap: () => tabController.animateTo(2),
              title: 'Our Services',
            ),
            verticalSpace(12),
            OurServicesListView(homeCubit: cubit),
            verticalSpace(12),
            CategoryHeader(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Scaffold(
                      appBar: AppBar(title: const Text('Our Clients')),
                      body: Padding(
                        padding: const EdgeInsets.all(16),
                        child: OurClientsListView(homeCubit: cubit),
                      ),
                    ),
                  ),
                );
              },
              title: 'Our Clients',
            ),
            verticalSpace(12),
            OurClientsListView(homeCubit: cubit),
            verticalSpace(20),
          ]),
        ),
      ],
    );
  }
}
