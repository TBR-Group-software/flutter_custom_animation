part of 'bloc.dart';

@immutable
class HomePageState extends AppBlocState {
  final List<Category> categories;
  final List<SubCategory> subcategories;
  final List<Product> products;

  HomePageState({
    required BlocStatus status,
    required this.categories,
    required this.subcategories,
    required this.products,
    Object? error,
  }) : super(error: error, status: status);
}
