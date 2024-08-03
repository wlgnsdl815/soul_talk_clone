import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_talk_clone/data_source/local/user_data_source.dart';
import 'package:soul_talk_clone/data_source/remote/auth_data_source.dart';
import 'package:soul_talk_clone/models/user_model.dart';
import 'package:soul_talk_clone/utils/navigation/app_routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyPageViewModel extends GetxController {
  final UserDataSource _userDataSource = Get.find<UserDataSource>();
  final AuthDataSource _authDataSource = Get.find<AuthDataSource>();
  final SupabaseClient supabaseClient = Supabase.instance.client;

  RxBool isLoading = false.obs;

  Rxn<UserModel> currentUser = Rxn();

  void editProfile() {
    print('프로필 수정 tapped');
  }

  void manageCookies() {
    print('쿠키 관리 tapped');
  }

  void myReviews() {
    print('나의 후기 tapped');
  }

  void setCounselingPreferences() {
    print('소울 MBTI-나의 상담 선호도 설정 tapped');
  }

  void myPosts() {
    print('내가 남긴 글 tapped');
  }

  void favoriteCounselors() {
    print('찜한 상담사 tapped');
  }

  void manageBlockedUsers() {
    print('차단한 사용자 관리 tapped');
  }

  void noticesAndEvents() {
    print('공지사항 및 이벤트 tapped');
  }

  void customerSupport() {
    print('고객센터 tapped');
  }

  void accountManagement() {
    print('계정 관리 tapped');
  }

  List<ButtonItem> get buttonItems => [
        ButtonItem(
          title: '프로필 수정',
          onTap: editProfile,
        ),
        ButtonItem(
          title: '쿠키 관리',
          onTap: manageCookies,
        ),
        ButtonItem(
          title: '나의 후기',
          onTap: myReviews,
        ),
        ButtonItem(
          title: '소울 MBTI-나의 상담 선호도 설정',
          onTap: setCounselingPreferences,
        ),
        ButtonItem(
          title: '내가 남긴 글',
          onTap: myPosts,
        ),
        ButtonItem(
          title: '찜한 상담사',
          onTap: favoriteCounselors,
        ),
        ButtonItem(
          title: '차단한 사용자 관리',
          onTap: manageBlockedUsers,
        ),
        ButtonItem(
          title: '공지사항 및 이벤트',
          onTap: noticesAndEvents,
        ),
        ButtonItem(
          title: '고객센터',
          onTap: customerSupport,
        ),
        ButtonItem(
          title: '계정 관리',
          onTap: accountManagement,
        ),
        ButtonItem(
          title: '로그아웃',
          onTap: signOut,
        ),
      ];

  Future<void> getUserProfile() async {
    isLoading.value = true;
    currentUser.value = await _userDataSource.getUserFromPreferences();
    isLoading.value = false;
  }

  Future<void> signOut() async {
    isLoading.value = true;
    await _authDataSource.signOut();
    await _userDataSource.clearUserFromPreferences();
    Get.offAndToNamed(AppRoutes.login);
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    getUserProfile();
  }
}

class ButtonItem {
  final String title;
  final VoidCallback onTap;

  ButtonItem({required this.title, required this.onTap});
}
