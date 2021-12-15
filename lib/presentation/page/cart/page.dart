import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_animation/presentation/bloc/cart/bloc.dart';
import 'package:flutter_custom_animation/presentation/bloc/status.dart';
import 'package:flutter_custom_animation/presentation/page/cart/components/cart_items_view.dart';
import 'package:flutter_custom_animation/presentation/page/cart/components/coupon_field.dart';
import 'package:flutter_custom_animation/presentation/page/cart/components/total_sum.dart';
import 'package:flutter_custom_animation/presentation/theme/palette.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class CartPage extends StatefulWidget {
  final CartBloc bloc;

  const CartPage({required this.bloc, Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with TickerProviderStateMixin {
  late final AnimationController _initialAnimation, _secondaryAnimation;
  bool _animationFinished = false;

  @override
  void initState() {
    super.initState();
    _initialAnimation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _secondaryAnimation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _initialAnimation.forward().then((_) {
      setState(() {
        _animationFinished = true;
      });
      _secondaryAnimation.forward();
    });
    widget.bloc.add(const CartEvent.getCart());
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (_, bool isKeyboardShown) {
        return Scaffold(
          backgroundColor: isKeyboardShown ? null : Colors.transparent,
          body: BlocBuilder<CartBloc, CartState>(
            bloc: widget.bloc,
            builder: (BuildContext context, CartState state) {
              if (state.status == BlocStatus.Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.1),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(40),
                            bottomLeft: Radius.circular(40)),
                        child: SizeTransition(
                          axis: Axis.vertical,
                          // At centre bottom
                          axisAlignment: 0.5,
                          sizeFactor: _initialAnimation,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            color: AppPalette.liteRed,
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  SafeArea(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 35),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: FadeTransition(
                                          opacity: _secondaryAnimation.drive(
                                              Tween<double>(begin: 0, end: 1)),
                                          child: TotalCartSum(
                                            cart: state.cart!,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (_animationFinished)
                                    Flexible(
                                      child: CartItemsView(
                                        cart: state.cart!,
                                      ),
                                    ),
                                  const SizedBox(
                                    height: 43,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 28, right: 28, bottom: 10),
                                    child: FadeTransition(
                                      opacity: _secondaryAnimation.drive(
                                          Tween<double>(begin: 0, end: 1)),
                                      child: const CouponField(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _initialAnimation.dispose();
    _secondaryAnimation.dispose();
    super.dispose();
  }
}
