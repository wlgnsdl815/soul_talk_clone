import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:soul_talk_clone/utils/styles/app_text_styles.dart';

class PostTextField extends HookWidget {
  final String labelText;
  final String hintText;
  final void Function(String)? onChanged;
  final int? maxLines;

  const PostTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.onChanged,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    return TextField(
      controller: controller,
      cursorColor: Colors.white,
      maxLines: maxLines,
      style: AppTextStyle.body14R(),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        labelText: labelText,
        hintText: hintText,
        hintStyle: AppTextStyle.body12R(),
        labelStyle: AppTextStyle.body14R(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white54),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
