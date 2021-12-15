import 'package:flutter_custom_animation/domain/entity/category.dart';
import 'package:flutter_custom_animation/domain/service/catagories.dart';
import 'package:flutter_custom_animation/presentation/theme/icons.dart';

class MockCategoriesService implements CategoriesService {
  @override
  Future<List<Category>> getAllCategories() async => <Category>[
        Category(
          id: 'id1',
          name: 'EarTips',
          iconPath: AppIcons.earTips,
        ),
        Category(
          id: 'id2',
          name: 'Pills',
          iconPath: AppIcons.pills,
        ),
        Category(
          id: 'id3',
          name: 'Scissors',
          iconPath: AppIcons.scissors,
        ),
        Category(
          id: 'id4',
          name: 'Pomade',
          iconPath: AppIcons.pomade,
        ),
        Category(
          id: 'id5',
          name: 'Cream',
          iconPath: AppIcons.cream,
        ),
        Category(
          id: 'id6',
          name: 'Shampoo',
          iconPath: AppIcons.shampoo,
        ),
      ];
}
