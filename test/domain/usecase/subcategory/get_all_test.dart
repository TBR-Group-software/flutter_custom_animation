import 'package:flutter_custom_animation/domain/entity/sub_category.dart';
import 'package:flutter_custom_animation/domain/service/subcategory.dart';
import 'package:flutter_custom_animation/domain/usecase/subcategory/get_all.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks(<Type>[SubcategoryService])
import 'get_all_test.mocks.dart';

void main() {
  test('Testing call() of the ServiceGetAllCategoriesUseCase', () async {
    // ARRANGE
    final List<SubCategory> mockData = <SubCategory>[];
    final MockSubcategoryService subcategoryServiceMock = MockSubcategoryService();
    when(subcategoryServiceMock.getSubcategories()).thenAnswer((_) async => mockData);

    final GetAllSubcategoriesUseCase useCase = ServiceGetAllSubcategoriesUseCase(subcategoryServiceMock);

    // ACT
    final List<SubCategory> resultData = await useCase();

    // ASSERT
    verify(subcategoryServiceMock.getSubcategories());
    expect(resultData, mockData);
  });
}
