import 'package:flutter/material.dart';

class TopInfoAnimation extends StatefulWidget {
  final Widget child;
  final Curve curve;
  final VoidCallback? onAnimationFinish;

  const TopInfoAnimation({
    required this.child,
    this.curve = Curves.easeInOutBack,
    this.onAnimationFinish,
    Key? key,
  }) : super(key: key);

  @override
  State<TopInfoAnimation> createState() => _TopInfoAnimationState();
}

class _TopInfoAnimationState extends State<TopInfoAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _slideController;
  late final CurvedAnimation _curvedSlide;
  late final AnimationController _scaleController;
  late final AnimationController _opacityController;

  void _callCallback(void _) {
    if (widget.onAnimationFinish != null) {
      widget.onAnimationFinish!();
    }
  }

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700))
      ..forward().then(_callCallback);
    _curvedSlide =
        CurvedAnimation(curve: widget.curve, parent: _slideController);
    _scaleController = AnimationController(
        lowerBound: 0.85,
        vsync: this,
        duration: const Duration(milliseconds: 500))
      ..forward();
    _opacityController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SlideTransition(
        position: _curvedSlide.drive(
          Tween<Offset>(
            begin: const Offset(0.1, 0),
            end: const Offset(0, 0),
          ),
        ),
        child: ScaleTransition(
          scale: _scaleController,
          child: FadeTransition(
            opacity: _opacityController,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
