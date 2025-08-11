import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shark_mobile/core/helpers/space_vector.dart';
import 'package:shark_mobile/core/themes/styles.dart';
import 'package:shark_mobile/features/home/data/model/service_model.dart';
import 'package:shark_mobile/features/home/presentation/views/service_details_view.dart';
import 'package:shark_mobile/features/home/presentation/widgets/service_card.dart';

class ServicesListView extends StatelessWidget {
  const ServicesListView({
    super.key,
    required this.services,
    required this.title,
  });
  final List<ServiceModel> services;
  final String title;
  @override
  Widget build(BuildContext context) {
    return services.isEmpty
        ? Center(
            child: Text(
              'no_services_available'.tr(),
              style: TextStyles.font15DarkBlueMedium,
            ),
          )
        : CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return ServiceCard(
                    description: services[index].description,
                    imageUrl: services[index].imageUrl,
                    title: services[index].title,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ServiceDetailsView(service: services[index]),
                        ),
                      );
                    },
                  );
                }, childCount: services.length),
              ),
              SliverToBoxAdapter(child: verticalSpace(24)),
            ],
          );
  }
}
