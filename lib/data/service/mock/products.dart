import 'package:flutter_custom_animation/domain/entity/product.dart';
import 'package:flutter_custom_animation/domain/service/products.dart';
import 'package:flutter_custom_animation/presentation/theme/images.dart';

class MockProductService implements ProductService {
  @override
  Future<List<Product>> getAllProducts() async => <Product>[
        Product(
          id: 'id1',
          name: 'Gentle Skin Cleaner',
          volume: 300,
          price: 12.29,
          images: <String>[
            AppImages.skinCleaner,
            AppImages.skinCleaner,
          ],
          description: 'Formulated with pure fermented green tea extract in'
              ' lieu of distilled water, TonyMoly Chok Chok Green '
              'Tea Watery Cream plovides intense hydration'
              'without being sticky or too heavy on skin.',
        ),
        Product(
          id: 'id2',
          name: 'Gentle Skin Cleaner',
          volume: 300,
          price: 12.29,
          images: <String>[
            AppImages.skinCleaner,
            AppImages.skinCleaner,
          ],
          description: 'Formulated with pure fermented green tea extract in'
              ' lieu of distilled water, TonyMoly Chok Chok Green '
              'Tea Watery Cream plovides intense hydration'
              'without being sticky or too heavy on skin.',
        ),
        Product(
          id: 'id3',
          name: 'Gentle Skin Cleaner',
          volume: 300,
          price: 12.29,
          images: <String>[
            AppImages.skinCleaner,
            AppImages.skinCleaner,
          ],
          description: 'Formulated with pure fermented green tea extract in'
              ' lieu of distilled water, TonyMoly Chok Chok Green '
              'Tea Watery Cream plovides intense hydration'
              'without being sticky or too heavy on skin.',
        ),
      ];
}
