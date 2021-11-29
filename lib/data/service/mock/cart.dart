import 'package:flutter_custom_animation/domain/entity/cart.dart';
import 'package:flutter_custom_animation/domain/entity/product.dart';
import 'package:flutter_custom_animation/domain/service/cart.dart';
import 'package:flutter_custom_animation/presentation/theme/images.dart';

class MockCartService implements CartService {
  @override
  Future<Cart> getCart() async => Cart(
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
      );
}
