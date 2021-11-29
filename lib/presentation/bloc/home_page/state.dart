part of 'bloc.dart';

@immutable
class HomePageState extends AppBlocState {
  final List<Category> categories;
  final List<SubCategory> subcategories;

  HomePageState(
      {required BlocStatus status,
      required this.categories,
      required this.subcategories,
      Object? error})
      : super(error: error, status: status);
}
