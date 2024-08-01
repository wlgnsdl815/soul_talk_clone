import 'package:flutter/material.dart';
import 'package:soul_talk_clone/utils/styles/app_colors.dart';
import 'package:soul_talk_clone/views/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const route = '/splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => const LoginPage(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
      );
    });
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
