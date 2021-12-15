import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_animation/presentation/bloc/home_page/bloc.dart';
import 'package:flutter_custom_animation/presentation/bloc/status.dart';
import 'package:flutter_custom_animation/presentation/page/home/components/categories_view.dart';
import 'package:flutter_custom_animation/presentation/page/home/components/logo_circle.dart';
import 'package:flutter_custom_animation/presentation/page/home/components/product_list.dart';
import 'package:flutter_custom_animation/presentation/page/home/components/search_bar.dart';
import 'package:flutter_custom_animation/presentation/page/home/components/sub_category_list.dart';
import 'package:flutter_custom_animation/presentation/page/home/components/top_animation.dart';
import 'package:flutter_custom_animation/presentation/theme/palette.dart';

import 'components/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  final HomePageBloc bloc;

  const HomePage({required this.bloc, Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isTopInfoAnimationFinished = false;

  @override
  void initState() {
    super.initState();
    widget.bloc.add(HomePageEvent.getInitialData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.litePink,
      body: BlocBuilder<HomePageBloc, HomePageState>(
        bloc: widget.bloc,
        builder: (_, HomePageState state) {
          if (state.status == BlocStatus.Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SafeArea(
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
                      const TopInfoAnimation(
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
                          categories: state.categories,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      if (_isTopInfoAnimationFinished)
                        TopInfoAnimation(
                          curve: Curves.linear,
                          child: SubCategoryList(
                            subCategories: state.subcategories,
                          ),
                        ),
                      if (_isTopInfoAnimationFinished)
                        ProductList(
                          products: state.products,
                        ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: const AppBottomNavBar(),
    );
  }
}
