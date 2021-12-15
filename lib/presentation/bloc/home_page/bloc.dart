import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_animation/domain/entity/category.dart';
import 'package:flutter_custom_animation/domain/entity/product.dart';
import 'package:flutter_custom_animation/domain/entity/sub_category.dart';
import 'package:flutter_custom_animation/domain/usecase/category/get_all.dart';
import 'package:flutter_custom_animation/domain/usecase/product/get_all.dart';
import 'package:flutter_custom_animation/domain/usecase/subcategory/get_all.dart';
import 'package:flutter_custom_animation/presentation/bloc/state.dart';
import 'package:flutter_custom_animation/presentation/bloc/status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'bloc.freezed.dart';
part 'event.dart';
part 'state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final GetAllCategoriesUseCase _getAllCategoriesUseCase;
  final GetAllSubcategoriesUseCase _getAllSubcategoriesUseCase;
  final GetAllProductsUseCase _getAllProductsUseCase;

  HomePageBloc(
    this._getAllCategoriesUseCase,
    this._getAllSubcategoriesUseCase,
    this._getAllProductsUseCase,
  ) : super(HomePageState(
          status: BlocStatus.Loading,
          categories: <Category>[],
          subcategories: <SubCategory>[],
          products: <Product>[],
        )) {
    on<_GetInitialDataEvent>(
        (_GetInitialDataEvent event, Emitter<HomePageState> emit) async {
      await _getInitialData(emit);
    });
  }

  Future<void> _getInitialData(Emitter<HomePageState> emit) async {
    emit(_loadingState());
    final List<Category> categories = await _getAllCategoriesUseCase();
    final List<SubCategory> subcategories = await _getAllSubcategoriesUseCase();
    final List<Product> products = await _getAllProductsUseCase();
    emit(HomePageState(
      status: BlocStatus.Loaded,
      subcategories: subcategories,
      categories: categories,
      products: products,
    ));
  }

  HomePageState _onError(Object? error, StackTrace _) => HomePageState(
      status: BlocStatus.Error,
      subcategories: state.subcategories,
      categories: state.categories,
      products: state.products,
      error: error);

  HomePageState _loadingState() => HomePageState(
        status: BlocStatus.Loading,
        subcategories: state.subcategories,
        categories: state.categories,
        products: state.products,
      );
}
