part of 'bloc.dart';

@immutable
class CartState extends AppBlocState with EquatableMixin  {
  final Cart? cart;

  const CartState({required BlocStatus status, required this.cart, Object? error})
      : super(status: status, error: error);

  @override
  List<Object?> get props => <Object?>[
    cart,
    error,
    status,
  ];
}
