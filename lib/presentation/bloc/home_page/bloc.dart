import 'package:bloc/bloc.dart';
import 'package:flutter_custom_animation/domain/entity/category.dart';
import 'package:flutter_custom_animation/domain/entity/sub_category.dart';
import 'package:flutter_custom_animation/domain/usecase/category/get_all.dart';
import 'package:flutter_custom_animation/domain/usecase/subcategory/get_all.dart';
import 'package:flutter_custom_animation/presentation/bloc/state.dart';
import 'package:flutter_custom_animation/presentation/bloc/status.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final GetAllCategoriesUseCase _getAllCategoriesUseCase;
  final GetAllSubcategoriesUseCase _getAllSubcategoriesUseCase;

  HomePageBloc(this._getAllCategoriesUseCase, this._getAllSubcategoriesUseCase)
      : super(HomePageState(
          status: BlocStatus.Loading,
          categories: <Category>[],
          subcategories: <SubCategory>[],
        )) {
    on<HomePageEvent>((HomePageEvent event, Emitter<HomePageState> emit) {
      switch (event.action) {
        case HomePageAction.GetInitialData:
          _getInitialData(emit);
          break;
      }
    });
  }

  void _getInitialData(Emitter<HomePageState> emit) {
    emit(_loadingState());
    Future<void> _() async {
      final List<Category> categories = await _getAllCategoriesUseCase();
      final List<SubCategory> subcategories =
          await _getAllSubcategoriesUseCase();
      emit(HomePageState(
          status: BlocStatus.Loaded,
          subcategories: subcategories,
          categories: categories));
    }

    _();
  }

  HomePageState _onError(Object? error) => HomePageState(
      status: BlocStatus.Error,
      subcategories: state.subcategories,
      categories: state.categories,
      error: error);

  HomePageState _loadingState() => HomePageState(
        status: BlocStatus.Loading,
        subcategories: state.subcategories,
        categories: state.categories,
      );
}
