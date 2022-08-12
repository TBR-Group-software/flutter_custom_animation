import 'package:flutter_custom_animation/domain/entity/category.dart';
import 'package:flutter_custom_animation/domain/entity/product.dart';
import 'package:flutter_custom_animation/domain/entity/sub_category.dart';
import 'package:flutter_custom_animation/domain/usecase/category/get_all.dart';
import 'package:flutter_custom_animation/domain/usecase/product/get_all.dart';
import 'package:flutter_custom_animation/domain/usecase/subcategory/get_all.dart';
import 'package:flutter_custom_animation/presentation/bloc/home_page/bloc.dart';
import 'package:flutter_custom_animation/presentation/bloc/status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks(<Type>[
  GetAllCategoriesUseCase,
  GetAllSubcategoriesUseCase,
  GetAllProductsUseCase,
])
import 'bloc_test.mocks.dart';

void main() {
  group('Home page bloc test', () {
    final List<Category> categories = <Category>[];
    final List<SubCategory> subcategories = <SubCategory>[];
    final List<Product> products = <Product>[];

    final MockGetAllCategoriesUseCase mockGetAllCategoriesUseCase =
    MockGetAllCategoriesUseCase();
    final MockGetAllSubcategoriesUseCase mockGetAllSubcategoriesUseCase =
    MockGetAllSubcategoriesUseCase();
    final MockGetAllProductsUseCase mockGetAllProductsUseCase =
    MockGetAllProductsUseCase();

    final Exception exception = Exception('test exception');

    test('Testing getCart', () {
      // ARRANGE
      when(mockGetAllCategoriesUseCase.call())
          .thenAnswer((_) async => categories);
      when(mockGetAllSubcategoriesUseCase.call())
          .thenAnswer((_) async => subcategories);
      when(mockGetAllProductsUseCase.call()).thenAnswer((_) async => products);

      final HomePageBloc bloc = HomePageBloc(
        mockGetAllCategoriesUseCase,
        mockGetAllSubcategoriesUseCase,
        mockGetAllProductsUseCase,
      );

      // ACT
      bloc.add(const HomePageEvent.getInitialData());

      // ASSERT
      expect(
        bloc.stream,
        emitsInOrder(
          <HomePageState>[
            HomePageState(
              status: BlocStatus.Loading,
              categories: categories,
              subcategories: subcategories,
              products: products,
            ),
            HomePageState(
              status: BlocStatus.Loaded,
              categories: categories,
              subcategories: subcategories,
              products: products,
            ),
          ],
        ),
      );
    });

    test('Testing error in GetAllCategoriesUseCase', () {
      // ARRANGE
      when(mockGetAllCategoriesUseCase.call()).thenThrow(exception);
      when(mockGetAllSubcategoriesUseCase.call())
          .thenAnswer((_) async => subcategories);
      when(mockGetAllProductsUseCase.call()).thenAnswer((_) async => products);

      final HomePageBloc bloc = HomePageBloc(
        mockGetAllCategoriesUseCase,
        mockGetAllSubcategoriesUseCase,
        mockGetAllProductsUseCase,
      );

      // ACT
      bloc.add(const HomePageEvent.getInitialData());

      // ASSERT
      expect(
        bloc.stream,
        emitsInOrder(
          <HomePageState>[
            HomePageState(
              status: BlocStatus.Loading,
              categories: categories,
              subcategories: subcategories,
              products: products,
            ),
            HomePageState(
              status: BlocStatus.Error,
              categories: categories,
              subcategories: subcategories,
              products: products,
              error: exception,
            ),
          ],
        ),
      );
    });

    test('Testing error in GetAllSubcategoriesUseCase', () {
      // ARRANGE
      when(mockGetAllCategoriesUseCase.call())
          .thenAnswer((_) async => categories);
      when(mockGetAllSubcategoriesUseCase.call())
          .thenThrow(exception);
      when(mockGetAllProductsUseCase.call()).thenAnswer((_) async => products);

      final HomePageBloc bloc = HomePageBloc(
        mockGetAllCategoriesUseCase,
        mockGetAllSubcategoriesUseCase,
        mockGetAllProductsUseCase,
      );

      // ACT
      bloc.add(const HomePageEvent.getInitialData());

      // ASSERT
      expect(
        bloc.stream,
        emitsInOrder(
          <HomePageState>[
            HomePageState(
              status: BlocStatus.Loading,
              categories: categories,
              subcategories: subcategories,
              products: products,
            ),
            HomePageState(
              status: BlocStatus.Error,
              categories: categories,
              subcategories: subcategories,
              products: products,
              error: exception,
            ),
          ],
        ),
      );
    });

    test('Testing error in GetAllProductsUseCase', () {
      // ARRANGE
      when(mockGetAllCategoriesUseCase.call())
          .thenAnswer((_) async => categories);
      when(mockGetAllSubcategoriesUseCase.call())
          .thenAnswer((_) async => subcategories);
      when(mockGetAllProductsUseCase.call()).thenThrow(exception);

      final HomePageBloc bloc = HomePageBloc(
        mockGetAllCategoriesUseCase,
        mockGetAllSubcategoriesUseCase,
        mockGetAllProductsUseCase,
      );

      // ACT
      bloc.add(const HomePageEvent.getInitialData());

      // ASSERT
      expect(
        bloc.stream,
        emitsInOrder(
          <HomePageState>[
            HomePageState(
              status: BlocStatus.Loading,
              categories: categories,
              subcategories: subcategories,
              products: products,
            ),
            HomePageState(
              status: BlocStatus.Error,
              categories: categories,
              subcategories: subcategories,
              products: products,
              error: exception,
            ),
          ],
        ),
      );
    });
  });
}
