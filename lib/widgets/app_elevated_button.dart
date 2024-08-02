import 'package:flutter/material.dart';

import 'package:soul_talk_clone/utils/styles/app_colors.dart';
import 'package:soul_talk_clone/utils/styles/app_text_styles.dart';

class AppElevatedButton extends StatelessWidget {
  final ButtonType buttonType;
  final String title;
  final double? height;
  final double? width;
  final GestureTapCallback? onTap;

  const AppElevatedButton({
    super.key,
    required this.buttonType,
    required this.title,
    this.height,
    this.width,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 40,
        width: width,
        decoration: BoxDecoration(
          color: switch (buttonType) {
            ButtonType.blue => AppColors.deepBlue,
            ButtonType.white => Colors.white,
            ButtonType.home => Colors.transparent,
          },
          borderRadius: BorderRadius.circular(16),
          border: buttonType == ButtonType.home
              ? Border.all(color: Colors.white)
              : null,
        ),
        child: Center(
          child: Text(title,
              style: switch (buttonType) {
                ButtonType.blue => AppTextStyle.body16B(color: Colors.white),
                ButtonType.white =>
                  AppTextStyle.body16B(color: AppColors.deepBlue),
                ButtonType.home => AppTextStyle.body12R(color: Colors.white),
              }),
        ),
      ),
    );
  }
}

enum ButtonType {
  blue,
  white,
  home,
}
