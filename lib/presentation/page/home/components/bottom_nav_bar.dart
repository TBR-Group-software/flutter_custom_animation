import 'package:flutter/material.dart';
import 'package:flutter_custom_animation/presentation/theme/icons.dart';
import 'package:flutter_custom_animation/presentation/theme/palette.dart';
import 'package:flutter_custom_animation/presentation/theme/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({Key? key}) : super(key: key);

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  int _selectedIndex = 0;

  double _calculateBottomPadding() {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    if (bottomPadding < 10) {
      return 10;
    } else {
      return bottomPadding;
    }
  }

  SalomonBottomBarItem _buildItem({
    required String text,
    required String icon,
    required int index,
  }) =>
      SalomonBottomBarItem(
        icon: SvgPicture.asset(
          icon,
          color: index == _selectedIndex ? Colors.white : AppPalette.gray,
        ),
        title: Text(
          text,
          style: AppTextStyles.playfairDisplayRegular15White,
        ),
        selectedColor: AppPalette.liteRed,
      );

  List<SalomonBottomBarItem> _buildItems(
      {required List<String> names, required List<String> icons}) {
    final List<SalomonBottomBarItem> result = <SalomonBottomBarItem>[];

    for (int i = 0; i < names.length; i++) {
      result.add(_buildItem(text: names[i], icon: icons[i], index: i));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          bottom: _calculateBottomPadding(), left: 25, right: 25, top: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: SalomonBottomBar(
        selectedColorOpacity: 1,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        margin: EdgeInsets.zero,
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
      ),
    );
  }
}
