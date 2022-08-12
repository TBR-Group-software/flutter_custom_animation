import 'package:flutter_custom_animation/domain/entity/cart.dart';
import 'package:flutter_custom_animation/domain/service/cart.dart';
import 'package:flutter_custom_animation/domain/usecase/cart/get.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks(<Type>[CartService, Cart])
import 'get_test.mocks.dart';

void main() {
  test('Testing call() of the ServiceGetCartUseCase', () async {
    // ARRANGE
    final Cart mockCart = MockCart();
    final MockCartService cartServiceMock = MockCartService();
    when(cartServiceMock.getCart()).thenAnswer((_) async => mockCart);

    final GetCartUseCase useCase = ServiceGetCartUseCase(cartServiceMock);

    // ACT
    final Cart resultCart = await useCase();

    // ASSERT
    verify(cartServiceMock.getCart());
    expect(resultCart, mockCart);
  });
}
