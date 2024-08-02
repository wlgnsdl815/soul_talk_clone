import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:soul_talk_clone/utils/styles/app_colors.dart';
import 'package:soul_talk_clone/utils/styles/app_text_styles.dart';

class DefaultDialog extends StatelessWidget {
  final String content;
  final String? title;
  final String? confirmText;
  final VoidCallback onConfirm;
  const DefaultDialog({
    super.key,
    required this.content,
    this.title,
    this.confirmText,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(50),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title ?? '알림',
                style: AppTextStyle.body14B(
                  color: AppColors.lightBlue,
                ),
                textAlign: TextAlign.center,
              ),
              const Gap(20),
              Text(
                content,
                style: AppTextStyle.body14R(
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const Gap(20),
              ElevatedButton(
                onPressed: onConfirm,
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    AppColors.lightBlue,
                  ),
                ),
                child: Text(
                  confirmText ?? '확인',
                  style: AppTextStyle.body14R(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
