import 'package:flutter_custom_animation/domain/entity/sub_category.dart';
import 'package:flutter_custom_animation/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

class SubCategoryItem extends StatelessWidget {
  final SubCategory subCategory;
  final bool selected;

  const SubCategoryItem(
      {required this.subCategory, required this.selected, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        subCategory.text,
        style: selected
            ? AppTextStyles.playfairDisplay22RegularLiteRed
            : AppTextStyles.playfairDisplay22RegularPink,
      ),
    );
  }
}
