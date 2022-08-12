part of 'bloc.dart';

@immutable
class HomePageState extends AppBlocState with EquatableMixin  {
  final List<Category> categories;
  final List<SubCategory> subcategories;
  final List<Product> products;

  const HomePageState({
    required BlocStatus status,
    required this.categories,
    required this.subcategories,
    required this.products,
    Object? error,
  }) : super(error: error, status: status);

  @override
  List<Object?> get props => <Object?>[
    categories,
    subcategories,
    products,
    error,
    status,
  ];
}
