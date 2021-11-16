import 'package:flutter_custom_animation/domain/entity/category.dart';

abstract class CategoriesService {
  Future<List<Category>> getAllCategories();
}
