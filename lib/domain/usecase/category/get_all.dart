import 'package:flutter_custom_animation/domain/entity/category.dart';
import 'package:flutter_custom_animation/domain/service/catagories.dart';

abstract class GetAllCategoriesUseCase {
  Future<List<Category>> call();
}

class ServiceGetAllCategoriesUseCase implements GetAllCategoriesUseCase {
  final CategoriesService _service;

  ServiceGetAllCategoriesUseCase(this._service);

  @override
  Future<List<Category>> call() => _service.getAllCategories();
}
