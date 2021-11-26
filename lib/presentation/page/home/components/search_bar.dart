import 'package:flutter/material.dart';
import 'package:flutter_custom_animation/presentation/theme/icons.dart';
import 'package:flutter_custom_animation/presentation/theme/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      margin: const EdgeInsets.symmetric(horizontal: 17),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(AppIcons.searchPeach),
          const SizedBox(
            width: 18,
          ),
          const Expanded(
            child: TextField(
              minLines: 1,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 10),
                border: InputBorder.none,
                hintText: 'Search products',
                hintStyle: AppTextStyles.playfairDisplay22RegularGray,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
