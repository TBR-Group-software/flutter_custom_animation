import 'package:flutter_custom_animation/domain/entity/cart.dart';
import 'package:flutter_custom_animation/domain/usecase/cart/get.dart';
import 'package:flutter_custom_animation/presentation/bloc/cart/bloc.dart';
import 'package:flutter_custom_animation/presentation/bloc/status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks(<Type>[GetCartUseCase, Cart])
import 'bloc_test.mocks.dart';

void main() {
  group('Cart bloc test', () {
    final MockGetCartUseCase useCaseMock = MockGetCartUseCase();
    final Exception exception = Exception('test exception');
    final Cart mockCart = MockCart();

    test('Testing getCart', () {
      // ARRANGE
      when(useCaseMock.call()).thenAnswer((_) async => mockCart);
      final CartBloc bloc = CartBloc(useCaseMock);

      // ACT
      bloc.add(const CartEvent.getCart());

      // ASSERT
      expect(
        bloc.stream,
        emitsInOrder(
          <CartState>[
            const CartState(
              status: BlocStatus.Loading,
              cart: null,
            ),
            CartState(
              status: BlocStatus.Loaded,
              cart: mockCart,
            ),
          ],
        ),
      );
    });

    test('Testing error', () {
      // ARRANGE
      when(useCaseMock.call()).thenThrow(exception);
      final CartBloc bloc = CartBloc(useCaseMock);

      // ACT
      bloc.add(const CartEvent.getCart());

      // ASSERT
      expect(
        bloc.stream,
        emitsInOrder(
          <CartState>[
            const CartState(
              status: BlocStatus.Loading,
              cart: null,
            ),
            CartState(
              status: BlocStatus.Error,
              cart: null,
              error: exception,
            ),
          ],
        ),
      );
    });
  });
}
