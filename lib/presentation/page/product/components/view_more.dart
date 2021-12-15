import 'package:flutter/material.dart';
import 'package:flutter_custom_animation/presentation/theme/text_styles.dart';

class ViewMoreButton extends StatelessWidget {
  const ViewMoreButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          Text(
            'View More',
            style: AppTextStyles.display16RegularWhite,
          ),
          Divider(
            thickness: 2,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
