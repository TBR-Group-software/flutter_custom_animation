import 'package:flutter/material.dart';
import 'package:flutter_custom_animation/presentation/theme/icons.dart';
import 'package:flutter_custom_animation/presentation/theme/palette.dart';
import 'package:flutter_custom_animation/presentation/theme/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({Key? key}) : super(key: key);

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  int _selectedIndex = 0;

  PersistentBottomNavBarItem _buildItem({
    required String text,
    required String icon,
    required int index,
  }) =>
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          icon,
          color: index == _selectedIndex ? Colors.white : AppPalette.gray,
        ),
        title: text,
        iconSize: 24,
        textStyle: AppTextStyles.playfairDisplayRegular15White,
        activeColorPrimary: AppPalette.liteRed,
        activeColorSecondary: Colors.white,
      );

  List<PersistentBottomNavBarItem> _buildItems(
      {required List<String> names, required List<String> icons}) {
    final List<PersistentBottomNavBarItem> result =
        <PersistentBottomNavBarItem>[];

    for (int i = 0; i < names.length; i++) {
      result.add(_buildItem(text: names[i], icon: icons[i], index: i));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return PersistentBottomNavBar(
      margin: EdgeInsets.zero,
      navBarStyle: NavBarStyle.style7,
      navBarDecoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      navBarEssentials: NavBarEssentials(
          navBarHeight: 50,
          items: _buildItems(
            names: <String>[
              'Home',
              'Cart',
              'Navigation',
              'People',
            ],
            icons: <String>[
              AppIcons.home,
              AppIcons.shoppingCart,
              AppIcons.navigation,
              AppIcons.people,
            ],
          ),
          backgroundColor: Colors.white,
          selectedIndex: _selectedIndex,
          onItemSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }
}
