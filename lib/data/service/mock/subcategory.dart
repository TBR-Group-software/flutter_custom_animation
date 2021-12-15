import 'package:flutter_custom_animation/domain/entity/sub_category.dart';
import 'package:flutter_custom_animation/domain/service/subcategory.dart';

class MockSubcategoryService implements SubcategoryService {
  @override
  Future<List<SubCategory>> getSubcategories() async => <SubCategory>[
        SubCategory(
          id: 'id',
          text: 'Skin',
        ),
        SubCategory(
          id: 'id',
          text: 'Hair',
        ),
        SubCategory(
          id: 'id',
          text: 'Personal care',
        ),
        SubCategory(
          id: 'id',
          text: 'Others',
        ),
        SubCategory(
          id: 'id',
          text: 'test',
        ),
      ];
}
