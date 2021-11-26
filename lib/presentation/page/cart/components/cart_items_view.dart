import 'package:flutter/material.dart';
import 'package:flutter_custom_animation/domain/entity/cart.dart';
import 'package:flutter_custom_animation/presentation/page/cart/components/cart_item.dart';

class CartItemsView extends StatefulWidget {
  final Cart cart;

  const CartItemsView({required this.cart, Key? key}) : super(key: key);

  @override
  State<CartItemsView> createState() => _CartItemsViewState();
}

class _CartItemsViewState extends State<CartItemsView>
    with TickerProviderStateMixin {
  late final List<AnimationController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = <AnimationController>[];
    for (int i = 0; i < widget.cart.products.length; i++) {
      _controllers.add(
        AnimationController(
          vsync: this,
          duration: Duration(milliseconds: 300 + (i * 100)),
        )..forward(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 28, right: 28, top: 10),
      itemCount: widget.cart.products.length,
      itemBuilder: (_, int index) {
        return SlideTransition(
          position: _controllers[index].drive(
            Tween<Offset>(
              begin: const Offset(1, 0),
              end: const Offset(0, 0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 46),
            child: CartItemWidget(
              product: widget.cart.products[index],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controllers.forEach((AnimationController controller) {
      controller.dispose();
    });
    super.dispose();
  }
}
