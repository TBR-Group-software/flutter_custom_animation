import 'package:flutter/material.dart';
import 'package:flutter_custom_animation/domain/entity/category.dart';
import 'package:flutter_custom_animation/presentation/page/home/components/category_card.dart';
import 'package:widgets_visibility_provider/widgets_visibility_provider.dart';

class CategoriesView extends StatelessWidget {
  final List<Category> categories;

  const CategoriesView({required this.categories, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetsVisibilityProvider(
      child: Container(
        height: 80,
        child: ListView.builder(
          padding: const EdgeInsets.only(left: 20),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          shrinkWrap: true,
          itemBuilder: (_, int index) {
            return VisibleNotifierWidget(
              builder:
                  (_, ScrollNotification? notification, PositionData? data) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: CategoryCard(
                    category: categories[index],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
