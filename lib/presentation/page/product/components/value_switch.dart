import 'package:flutter/material.dart';
import 'package:flutter_custom_animation/presentation/page/home/components/product_swipe_detector.dart';
import 'package:flutter_custom_animation/presentation/theme/palette.dart';
import 'package:flutter_custom_animation/presentation/theme/text_styles.dart';

class ValueSwitch extends StatefulWidget {
  final double fistValue, secondValue;
  final AnimationController controller;

  const ValueSwitch({
    required this.fistValue,
    required this.secondValue,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  State<ValueSwitch> createState() => _ValueSwitchState();
}

class _ValueSwitchState extends State<ValueSwitch> {
  bool _state = false;

  void _controllerListener() {
    if (mounted) {
      if (widget.controller.value == widget.controller.upperBound) {
        setState(() {
          _state = true;
        });
      } else if (_state) {
        setState(() {
          _state = false;
        });
      }
    }
  }

  Widget _buildText(String text, VoidCallback onTap) => GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.transparent,
          child: Text(
            '$text Ml',
            style: AppTextStyles.display10RegularWhite,
          ),
        ),
      );

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_controllerListener);
  }

  @override
  Widget build(BuildContext context) {
    return ProductSwipeGesture(
      reversed: true,
      controller: widget.controller,
      child: Container(
        width: 110,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          color: AppPalette.teal,
        ),
        child: LayoutBuilder(
          builder: (_, BoxConstraints constraints) {
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                PositionedTransition(
                  rect: widget.controller.drive(RelativeRectTween(
                      begin: RelativeRect.fromLTRB(
                          0, 0, constraints.maxWidth * 0.5, 0),
                      end: RelativeRect.fromLTRB(
                          constraints.maxWidth * 0.5, 0, 0, 0))),
                  child: GestureDetector(
                    child: Container(
                      width: 55,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: AppPalette.liteRed,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _buildText(widget.fistValue.toStringAsFixed(0), () {
                      widget.controller.reverse();
                    }),
                    _buildText(widget.secondValue.toStringAsFixed(0), () {
                      widget.controller.forward();
                    }),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
