import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_talk_clone/utils/navigation/app_routes.dart';
import 'package:soul_talk_clone/utils/styles/app_colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const route = '/splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  bool _isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeApp();
    });
  }

  Future<void> _initializeApp() async {
    await Future.wait([
      _checkAuthState(),
      Future.delayed(const Duration(seconds: 2)),
    ]);

    if (_isAuthenticated) {
      Get.offAndToNamed(AppRoutes.main);
    } else {
      Get.offAndToNamed(AppRoutes.login);
    }
  }

  Future<void> _checkAuthState() async {
    final session = _supabaseClient.auth.currentSession;
    if (session != null) {
      _isAuthenticated = true;
    } else {
      _isAuthenticated = false;
    }
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
