part of 'bloc.dart';

@immutable
class CartState extends AppBlocState {
  final Cart? cart;

  CartState({required BlocStatus status, required this.cart, Object? error})
      : super(status: status, error: error);
}
