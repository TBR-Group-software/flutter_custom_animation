import 'package:flutter_custom_animation/domain/entity/sub_category.dart';
import 'package:flutter_custom_animation/presentation/page/home/components/sub_catogory_item.dart';
import 'package:flutter/material.dart';

class SubCategoryList extends StatelessWidget {
  final List<SubCategory> subCategories;

  const SubCategoryList({required this.subCategories, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 25),
        scrollDirection: Axis.horizontal,
        itemCount: subCategories.length,
        itemBuilder: (_, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 54),
            child: SubCategoryItem(
              selected: index == 0,
              subCategory: subCategories[index],
            ),
          );
        },
      ),
    );
  }
}
