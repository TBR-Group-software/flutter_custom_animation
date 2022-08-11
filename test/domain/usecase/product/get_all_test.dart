import 'package:flutter_custom_animation/domain/entity/product.dart';
import 'package:flutter_custom_animation/domain/service/products.dart';
import 'package:flutter_custom_animation/domain/usecase/product/get_all.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks(<Type>[ProductService])
import 'get_all_test.mocks.dart';

void main() {
  test('Testing call() of the ServiceGetAllCategoriesUseCase', () async {
    // ARRANGE
    final List<Product> mockData = <Product>[];
    final MockProductService productServiceMock = MockProductService();
    when(productServiceMock.getAllProducts()).thenAnswer((_) async => mockData);

    final GetAllProductsUseCase useCase = ServiceGetAllProductsUseCase(productServiceMock);

    // ACT
    final List<Product> resultData = await useCase();

    // ASSERT
    verify(productServiceMock.getAllProducts());
    expect(resultData, mockData);
  });
}
