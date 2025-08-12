import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shark_mobile/core/themes/colors.dart';

class AnimatedJobCard extends StatefulWidget {
  final Widget child;

  const AnimatedJobCard({super.key, required this.child});

  @override
  AnimatedCardState createState() => AnimatedCardState();
}

class AnimatedCardState extends State<AnimatedJobCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Card(
        color: ColorsManager.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        elevation: 6,
        shadowColor: ColorsManager.primary.withOpacity(0.15),
        child: Padding(padding: EdgeInsets.all(20.w), child: widget.child),
      ),
    );
  }
}
