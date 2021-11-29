import 'package:flutter_custom_animation/data/service/mock/cart.dart';
import 'package:flutter_custom_animation/data/service/mock/categories.dart';
import 'package:flutter_custom_animation/data/service/mock/subcategory.dart';
import 'package:flutter_custom_animation/domain/service/cart.dart';
import 'package:flutter_custom_animation/domain/service/catagories.dart';
import 'package:flutter_custom_animation/domain/service/subcategory.dart';
import 'package:flutter_custom_animation/domain/usecase/cart/get.dart';
import 'package:flutter_custom_animation/domain/usecase/category/get_all.dart';
import 'package:flutter_custom_animation/domain/usecase/subcategory/get_all.dart';
import 'package:flutter_custom_animation/presentation/bloc/home_page/bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

void init() {
  sl.registerLazySingleton<SubcategoryService>(() => MockSubcategoryService());
  sl.registerLazySingleton<CategoriesService>(() => MockCategoriesService());
  sl.registerLazySingleton<CartService>(() => MockCartService());
  sl.registerLazySingleton<GetCartUseCase>(
      () => ServiceGetCartUseCase(sl.get()));
  sl.registerLazySingleton<GetAllCategoriesUseCase>(
      () => ServiceGetAllCategoriesUseCase(sl.get()));
  sl.registerLazySingleton<GetAllSubcategoriesUseCase>(
      () => ServiceGetAllSubcategoriesUseCase(sl.get()));
  sl.registerLazySingleton<HomePageBloc>(
      () => HomePageBloc(sl.get(), sl.get()));
}
