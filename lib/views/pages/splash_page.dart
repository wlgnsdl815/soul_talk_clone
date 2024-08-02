import 'package:flutter/material.dart';
import 'package:soul_talk_clone/utils/styles/app_colors.dart';
import 'package:soul_talk_clone/views/pages/login_page.dart';
import 'package:soul_talk_clone/views/pages/main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const route = '/splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final minWaitTime = Future.delayed(const Duration(seconds: 2));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF00152F),
      body: Center(
        child: CircleAvatar(
          radius: 60,
          backgroundColor: AppColors.orange,
        ),
      ),
    );
  }
}
