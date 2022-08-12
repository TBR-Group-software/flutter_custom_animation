import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_custom_animation/domain/entity/cart.dart';
import 'package:flutter_custom_animation/domain/usecase/cart/get.dart';
import 'package:flutter_custom_animation/presentation/bloc/state.dart';
import 'package:flutter_custom_animation/presentation/bloc/status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc.freezed.dart';

part 'event.dart';

part 'state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartUseCase _getCartUseCase;

  CartBloc(this._getCartUseCase)
      : super(const CartState(status: BlocStatus.Loading, cart: null)) {
    on<_GetCartEvent>((_GetCartEvent event, Emitter<CartState> emit) async {
      try {
        await _getCart(emit, event);
      } on Object catch (error) {
        emit(_onError(error));
      }
    });
  }

  Future<void> _getCart(Emitter<CartState> emit, _GetCartEvent event) async {
    emit(_loadingState());
    emit(
      await _getCartUseCase().then(
        (Cart cart) => CartState(
          status: BlocStatus.Loaded,
          cart: cart,
        ),
      ),
    );
  }

  CartState _onError(Object? error) =>
      CartState(status: BlocStatus.Error, cart: state.cart, error: error);

  CartState _loadingState() => CartState(
        status: BlocStatus.Loading,
        cart: state.cart,
      );
}
