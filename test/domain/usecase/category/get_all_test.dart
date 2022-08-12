import 'package:flutter_custom_animation/domain/entity/category.dart';
import 'package:flutter_custom_animation/domain/service/catagories.dart';
import 'package:flutter_custom_animation/domain/usecase/category/get_all.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks(<Type>[CategoriesService])
import 'get_all_test.mocks.dart';

void main() {
  test('Testing call() of the ServiceGetAllCategoriesUseCase', () async {
    // ARRANGE
    final List<Category> mockData = <Category>[];
    final MockCategoriesService categoriesServiceMock = MockCategoriesService();
    when(categoriesServiceMock.getAllCategories()).thenAnswer((_) async => mockData);

    final GetAllCategoriesUseCase useCase = ServiceGetAllCategoriesUseCase(categoriesServiceMock);

    // ACT
    final List<Category> resultData = await useCase();

    // ASSERT
    verify(categoriesServiceMock.getAllCategories());
    expect(resultData, mockData);
  });
}
