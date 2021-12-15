import 'package:flutter_custom_animation/presentation/theme/palette.dart';
import 'package:flutter_custom_animation/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LogoAnimation extends StatefulWidget {
  final VoidCallback? onAnimationFinish;
  final Widget? child;

  const LogoAnimation({this.onAnimationFinish, this.child, Key? key})
      : super(key: key);

  @override
  State<LogoAnimation> createState() => _LogoAnimationState();
}

class _LogoAnimationState extends State<LogoAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _mainController, _secondController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _secondController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..animateTo(3).then(
        (_) {
          _mainController.reverse();
          _secondController.animateTo(1).then((_) {
            if (widget.onAnimationFinish != null) {
              widget.onAnimationFinish!();
            }
          });
        },
      );
    _animation =
        CurvedAnimation(parent: _mainController, curve: Curves.easeInQuad);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: <Widget>[
        if (widget.child != null) widget.child!,
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SlideTransition(
            position: _secondController.drive(
              Tween<Offset>(
                begin: const Offset(0, 0),
                end: const Offset(0, -0.4),
              ),
            ),
            child: ScaleTransition(
              scale: _animation.drive(Tween<double>(begin: 0.19, end: 3)),
              child: Container(
                width: 75,
                height: 75,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppPalette.liteRed,
                ),
              ),
            ),
          ),
        ),
        SlideTransition(
          position: _secondController.drive(
            Tween<Offset>(
              begin: const Offset(0, 0),
              end: const Offset(0, -0.4),
            ),
          ),
          child: const Center(
            child: Text(
              'N8',
              style: AppTextStyles.playfairDisplay22RegularWhite,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _secondController.dispose();
    _mainController.dispose();
    super.dispose();
  }
}
