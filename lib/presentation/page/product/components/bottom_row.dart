import 'package:flutter/material.dart';
import 'package:flutter_custom_animation/presentation/page/product/components/count_chooser.dart';
import 'package:flutter_custom_animation/presentation/theme/text_styles.dart';

class ProductBottomRow extends StatefulWidget {
  final void Function(int)? onAddToBag;

  const ProductBottomRow({this.onAddToBag, Key? key}) : super(key: key);

  @override
  State<ProductBottomRow> createState() => _ProductBottomRowState();
}

class _ProductBottomRowState extends State<ProductBottomRow> {
  int _selectedCount = 0;

  EdgeInsets _calculatePadding(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    if (bottomPadding < 5) {
      return const EdgeInsets.only(left: 23, right: 23, bottom: 20);
    } else {
      return const EdgeInsets.symmetric(horizontal: 23);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: _calculatePadding(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CountChooser(
                onValueChanged: (int newValue) {
                  _selectedCount = newValue;
                },
              ),
              GestureDetector(
                onTap: () {
                  if (widget.onAddToBag != null) {
                    widget.onAddToBag!(_selectedCount);
                  }
                },
                child: const Text(
                  'Add To Bag',
                  style: AppTextStyles.playfairDisplayRegular24Black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
