import 'package:flutter_custom_animation/domain/entity/sub_category.dart';

abstract class SubcategoryService {
  Future<List<SubCategory>> getSubcategories();
}
