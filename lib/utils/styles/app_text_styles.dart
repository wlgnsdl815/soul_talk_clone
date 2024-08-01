import 'package:flutter/material.dart';

class AppTextStyle {
  static const regular = TextStyle(fontWeight: FontWeight.w400);
  static const bold = TextStyle(fontWeight: FontWeight.w700);
  static const extrabold = TextStyle(fontWeight: FontWeight.w800);

  static TextStyle body12R({Color color = Colors.white}) => regular.copyWith(
        fontSize: 12,
        color: color,
      );

  static TextStyle body14R({Color color = Colors.white}) => regular.copyWith(
        fontSize: 14,
        color: color,
      );
  static TextStyle body14B({Color color = Colors.white}) => bold.copyWith(
        fontSize: 14,
        color: color,
      );
  static TextStyle body14Eb({Color color = Colors.white}) => extrabold.copyWith(
        fontSize: 14,
        color: color,
      );
  static TextStyle body16B({Color color = Colors.white}) => bold.copyWith(
        fontSize: 16,
        color: color,
      );
}
