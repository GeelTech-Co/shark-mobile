import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shark_mobile/features/home/presentation/widgets/gallery_item.dart';

class GalleryTab extends StatelessWidget {
  const GalleryTab({super.key});

  final List<String> imageUrls = const [
    'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80',
    'https://images.unsplash.com/photo-1494526585095-c41746248156?auto=format&fit=crop&w=800&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?auto=format&fit=crop&w=800&q=80',
    'https://images.unsplash.com/photo-1526045612212-70caf35c14df?auto=format&fit=crop&w=800&q=80',
    'https://images.unsplash.com/photo-1499951360447-b19be8fe80f5?auto=format&fit=crop&w=800&q=80',
    'https://images.unsplash.com/photo-1468071174046-657d9d351a40?auto=format&fit=crop&w=800&q=80',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            sliver: SliverMasonryGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childCount: imageUrls.length,
              itemBuilder: (context, index) {
                final double imageHeight = (180 + (index % 3) * 40).h;
                final imageUrl = imageUrls[index];

                return GalleryItem(
                  index: index,
                  imageHeight: imageHeight,
                  imageUrl: imageUrl,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
