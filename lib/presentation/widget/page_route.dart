import 'package:flutter/material.dart';

class AppPageRoute<T> extends PageRouteBuilder<T> {
  final Widget Function(BuildContext context) builder;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 600);

  AppPageRoute({required this.builder})
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
                builder(context),
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              return AnimatedBuilder(
                  animation: animation,
                  builder: (_, __) {
                    return Stack(
                      children: <Widget>[
                        if (animation.isCompleted) child,
                        if (!animation.isCompleted)
                          _build(
                              animation
                                  .drive(Tween<double>(begin: 0, end: 200)),
                              Alignment.bottomLeft),
                      ],
                    );
                  });
            });

  static Widget _build(Animation<double> animation, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: ScaleTransition(
        scale: animation,
        child: Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
