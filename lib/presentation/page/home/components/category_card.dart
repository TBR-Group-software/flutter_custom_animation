import 'package:flutter_custom_animation/domain/entity/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CategoryCard extends StatefulWidget {
  final Category category;

  const CategoryCard({required this.category, Key? key}) : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      value: 1,
    );
    _animation = _animationController.drive(Tween<double>(begin: 0.5, end: 1));
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey<String>(widget.category.id),
      onVisibilityChanged: (VisibilityInfo visibilityInfo) {
        _animationController.animateTo(visibilityInfo.visibleFraction);
      },
      child: ScaleTransition(
        scale: _animation,
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: SvgPicture.asset(
              widget.category.iconPath,
              fit: BoxFit.scaleDown,
              width: 32,
              height: 42.5,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
