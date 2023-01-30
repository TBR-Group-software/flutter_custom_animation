import 'package:flutter/material.dart';
import 'package:flutter_custom_animation/presentation/utils/material_color_from_color.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Color to Material Color test', () async {
    // ARRANGE
    const Color color = Color(0xFFFFFFFF);

    // ACT
    final MaterialColor materialColor = color.createMaterialColor();

    // ASSERT
    expect(materialColor.value, 4294967295);
  });
}
