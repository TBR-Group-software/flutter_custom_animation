import 'package:flutter_custom_animation/domain/entity/sub_category.dart';
import 'package:flutter_custom_animation/domain/service/subcategory.dart';

abstract class GetAllSubcategoriesUseCase {
  Future<List<SubCategory>> call();
}

class ServiceGetAllSubcategoriesUseCase implements GetAllSubcategoriesUseCase {
  final SubcategoryService _service;

  ServiceGetAllSubcategoriesUseCase(this._service);

  @override
  Future<List<SubCategory>> call() => _service.getSubcategories();
}
