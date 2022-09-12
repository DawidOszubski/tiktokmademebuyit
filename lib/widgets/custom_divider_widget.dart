import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: const Offset(-3, -1),
          child: const Divider(
            thickness: 2,
            color: AppColors.blue,
          ),
        ),
        Transform.translate(
          offset: const Offset(3, 1),
          child: const Divider(
            thickness: 2,
            color: AppColors.red,
          ),
        ),
        const Divider(
          thickness: 2,
          color: AppColors.white,
        ),
      ],
    );
  }
}
