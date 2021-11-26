import 'package:flutter/material.dart';
import 'package:flutter_custom_animation/domain/entity/cart.dart';
import 'package:flutter_custom_animation/domain/entity/product.dart';
import 'package:flutter_custom_animation/presentation/page/cart/components/bottom_bar.dart';
import 'package:flutter_custom_animation/presentation/page/cart/page.dart';
import 'package:flutter_custom_animation/presentation/page/product/components/initial_animation.dart';
import 'package:flutter_custom_animation/presentation/page/product/components/product_animation.dart';
import 'package:flutter_custom_animation/presentation/page/product/components/value_switch.dart';
import 'package:flutter_custom_animation/presentation/theme/images.dart';

import 'components/bottom_row.dart';

class ProductPage extends StatefulWidget {
  final Product product;

  const ProductPage({required this.product, Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  bool _showShoppingCart = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ValueKey<String>(widget.product.id),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          ProductAnimation(
            controller: _animationController,
            product: widget.product,
          ),
          ProductInitialAnimation(
            onAnimationFinished: () {},
          ),
          Positioned(
            top: 11,
            right: 29,
            child: SafeArea(
              child: ValueSwitch(
                controller: _animationController,
                fistValue: 300,
                secondValue: 150,
              ),
            ),
          ),
          if (_showShoppingCart)
            CartPage(
              cart: Cart(
                products: <CartProduct>[
                  CartProduct(
                      amount: 1,
                      product: Product(
                        id: 'Id1',
                        description: '',
                        volume: 300,
                        images: <String>[
                          AppImages.skinCleaner,
                        ],
                        name: 'Gentle Skin Cleaner',
                        price: 0,
                      )),
                  CartProduct(
                      amount: 1,
                      product: Product(
                        id: 'Id1',
                        description: '',
                        volume: 300,
                        images: <String>[
                          AppImages.handCreme,
                        ],
                        name: 'Hand Cream',
                        price: 0,
                      )),
                  CartProduct(
                      amount: 2,
                      product: Product(
                        id: 'Id1',
                        description: '',
                        volume: 300,
                        images: <String>[
                          AppImages.eyeCream,
                        ],
                        name: 'Eye Cream',
                        price: 0,
                      )),
                ],
                id: 'Id',
              ),
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _showShoppingCart
                ? CartBottomBar()
                : ProductBottomRow(
                    onAddToBag: (_) {
                      setState(() {
                        _showShoppingCart = true;
                      });
                    },
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
