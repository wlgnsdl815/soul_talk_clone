import 'package:flutter/material.dart';

import 'package:soul_talk_clone/utils/styles/app_colors.dart';
import 'package:soul_talk_clone/utils/styles/app_text_styles.dart';

class AppElevatedButton extends StatelessWidget {
  final ButtonType buttonType;
  final String title;
  const AppElevatedButton({
    super.key,
    required this.buttonType,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: switch (buttonType) {
          ButtonType.blue => AppColors.deepBlue,
          ButtonType.white => Colors.white,
        },
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          title,
          style: AppTextStyle.body16B(
            color: switch (buttonType) {
              ButtonType.blue => Colors.white,
              ButtonType.white => AppColors.deepBlue,
            },
          ),
        ),
      ),
    );
  }
}

enum ButtonType {
  blue,
  white,
}
