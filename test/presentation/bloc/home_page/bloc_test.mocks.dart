// Mocks generated by Mockito 5.3.0 from annotations
// in flutter_custom_animation/test/presentation/bloc/home_page/bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:flutter_custom_animation/domain/entity/category.dart' as _i4;
import 'package:flutter_custom_animation/domain/entity/product.dart' as _i8;
import 'package:flutter_custom_animation/domain/entity/sub_category.dart'
    as _i6;
import 'package:flutter_custom_animation/domain/usecase/category/get_all.dart'
    as _i2;
import 'package:flutter_custom_animation/domain/usecase/product/get_all.dart'
    as _i7;
import 'package:flutter_custom_animation/domain/usecase/subcategory/get_all.dart'
    as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [GetAllCategoriesUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetAllCategoriesUseCase extends _i1.Mock
    implements _i2.GetAllCategoriesUseCase {
  MockGetAllCategoriesUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Category>> call() => (super.noSuchMethod(
          Invocation.method(#call, []),
          returnValue: _i3.Future<List<_i4.Category>>.value(<_i4.Category>[]))
      as _i3.Future<List<_i4.Category>>);
}

/// A class which mocks [GetAllSubcategoriesUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetAllSubcategoriesUseCase extends _i1.Mock
    implements _i5.GetAllSubcategoriesUseCase {
  MockGetAllSubcategoriesUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i6.SubCategory>> call() =>
      (super.noSuchMethod(Invocation.method(#call, []),
              returnValue:
                  _i3.Future<List<_i6.SubCategory>>.value(<_i6.SubCategory>[]))
          as _i3.Future<List<_i6.SubCategory>>);
}

/// A class which mocks [GetAllProductsUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetAllProductsUseCase extends _i1.Mock
    implements _i7.GetAllProductsUseCase {
  MockGetAllProductsUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i8.Product>> call() =>
      (super.noSuchMethod(Invocation.method(#call, []),
              returnValue: _i3.Future<List<_i8.Product>>.value(<_i8.Product>[]))
          as _i3.Future<List<_i8.Product>>);
}