import 'package:flutter_custom_animation/domain/entity/product.dart';
import 'package:flutter_custom_animation/presentation/page/home/components/product_card.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({required this.products, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 385,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (_, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 26),
            child: ProductCard(
              product: products[index],
              selected: index == 0,
            ),
          );
        },
      ),
    );
  }
}
