import 'package:flutter/material.dart';
import 'package:flutter_custom_animation/domain/entity/category.dart';
import 'package:flutter_custom_animation/domain/entity/product.dart';
import 'package:flutter_custom_animation/domain/entity/sub_category.dart';
import 'package:flutter_custom_animation/presentation/page/home/components/categories_view.dart';
import 'package:flutter_custom_animation/presentation/page/home/components/logo_circle.dart';
import 'package:flutter_custom_animation/presentation/page/home/components/product_list.dart';
import 'package:flutter_custom_animation/presentation/page/home/components/search_bar.dart';
import 'package:flutter_custom_animation/presentation/page/home/components/sub_category_list.dart';
import 'package:flutter_custom_animation/presentation/page/home/components/top_animation.dart';
import 'package:flutter_custom_animation/presentation/theme/icons.dart';
import 'package:flutter_custom_animation/presentation/theme/images.dart';
import 'package:flutter_custom_animation/presentation/theme/palette.dart';

import 'components/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isTopInfoAnimationFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.litePink,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Center(
                child: LogoCircle(),
              ),
              const SizedBox(
                height: 27,
              ),
              TopInfoAnimation(
                child: SearchBar(),
              ),
              const SizedBox(
                height: 27,
              ),
              TopInfoAnimation(
                onAnimationFinish: () {
                  setState(() {
                    _isTopInfoAnimationFinished = true;
                  });
                },
                child: CategoriesView(
                  categories: <Category>[
                    Category(
                      id: 'id1',
                      name: 'name',
                      iconPath: AppIcons.earTips,
                    ),
                    Category(
                      id: 'id2',
                      name: 'name',
                      iconPath: AppIcons.pills,
                    ),
                    Category(
                      id: 'id3',
                      name: 'name',
                      iconPath: AppIcons.scissors,
                    ),
                    Category(
                      id: 'id4',
                      name: 'name',
                      iconPath: AppIcons.pomade,
                    ),
                    Category(
                      id: 'id5',
                      name: 'name',
                      iconPath: AppIcons.cream,
                    ),
                    Category(
                      id: 'id6',
                      name: 'name',
                      iconPath: AppIcons.shampoo,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              if (_isTopInfoAnimationFinished)
                TopInfoAnimation(
                  curve: Curves.linear,
                  child: SubCategoryList(
                    subCategories: <SubCategory>[
                      SubCategory(
                        id: 'id',
                        text: 'Skin',
                      ),
                      SubCategory(
                        id: 'id',
                        text: 'Hair',
                      ),
                      SubCategory(
                        id: 'id',
                        text: 'Personal care',
                      ),
                      SubCategory(
                        id: 'id',
                        text: 'Others',
                      ),
                      SubCategory(
                        id: 'id',
                        text: 'test',
                      ),
                    ],
                  ),
                ),
              if (_isTopInfoAnimationFinished)
                ProductList(
                  products: <Product>[
                    Product(
                      id: 'id1',
                      name: 'Gentle Skin Cleaner',
                      volume: 300,
                      price: 12.29,
                      images: <String>[
                        AppImages.skinCleaner,
                        AppImages.skinCleaner,
                      ],
                    ),
                    Product(
                      id: 'id2',
                      name: 'Gentle Skin Cleaner',
                      volume: 300,
                      price: 12.29,
                      images: <String>[
                        AppImages.skinCleaner,
                        AppImages.skinCleaner,
                      ],
                    ),
                    Product(
                      id: 'id3',
                      name: 'Gentle Skin Cleaner',
                      volume: 300,
                      price: 12.29,
                      images: <String>[
                        AppImages.skinCleaner,
                        AppImages.skinCleaner,
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(),
    );
  }
}
