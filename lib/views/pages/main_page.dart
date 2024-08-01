import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_talk_clone/utils/styles/app_colors.dart';
import 'package:soul_talk_clone/view_models/main_view_model.dart';
import 'package:soul_talk_clone/views/screens/community_screen.dart';
import 'package:soul_talk_clone/views/screens/home_screen.dart';
import 'package:soul_talk_clone/views/screens/my_counsel_screen.dart';
import 'package:soul_talk_clone/views/screens/my_page_screen.dart';
import 'package:soul_talk_clone/views/screens/soul_bot_screen.dart';
import 'package:soul_talk_clone/widgets/default_layout.dart';

class MainPage extends GetView<MainViewModel> {
  const MainPage({super.key});

  static const String route = '/main';

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Obx(
        () => [
          const HomeScreen(),
          const MyCounselScreen(),
          const SoulBotScreen(),
          const CommunityScreen(),
          const MyPageScreen(),
        ][controller.currentPage.value],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: const Color(0xFF9E9E9E),
          selectedItemColor: AppColors.orange,
          backgroundColor: const Color(0xFF00152F),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          currentIndex: controller.currentPage.value,
          onTap: (index) => controller.jumpToPage(index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble),
              label: '내 상담',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.smart_toy),
              label: '소울 봇',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: '커뮤니티',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '내 정보',
            ),
          ],
        ),
      ),
    );
  }
}
