import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:soul_talk_clone/utils/navigation/app_routes.dart';
import 'package:soul_talk_clone/utils/styles/app_colors.dart';
import 'package:soul_talk_clone/utils/styles/app_text_styles.dart';
import 'package:soul_talk_clone/view_models/login_view_model.dart';
import 'package:soul_talk_clone/widgets/auth_text_field.dart';

import 'package:soul_talk_clone/widgets/default_layout.dart';

class LoginPage extends GetView<LoginViewModel> {
  const LoginPage({super.key});

  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Gap(20),
              const CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.orange,
              ),
              const Gap(10),
              Text(
                'SOUL TALK',
                style: AppTextStyle.body14Eb(
                  color: AppColors.orange,
                ),
                textAlign: TextAlign.center,
              ),
              const Gap(40),
              const AuthTextField(hintText: '이메일 입력'),
              const Gap(10),
              const AuthTextField(hintText: '비밀번호 입력'),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      '핸드폰 번호로 이메일 찾기',
                      style: AppTextStyle.body12R(),
                    ),
                  ),
                  const Text('/'),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      '비밀번호를 잊으셨나요?',
                      style: AppTextStyle.body12R(),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('로그인 정보 저장'),
                  Obx(
                    () => Checkbox(
                      value: controller.saveLoginInfo.value,
                      onChanged: (value) =>
                          controller.saveLoginInfo.value = value!,
                      activeColor: Colors.white,
                    ),
                  ),
                ],
              ),
              const Gap(10),
              _buildElevatedButton(
                title: '로그인',
                isLogin: true,
                onTap: () {},
              ),
              const Gap(15),
              _buildElevatedButton(
                title: '이메일로 회원가입하기',
                isLogin: false,
                onTap: () => Get.toNamed(AppRoutes.signUp),
              ),
              const Gap(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                      height: 0.5,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'SNS 계정으로 시작하기',
                      style: AppTextStyle.body12R(),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 0.5,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => controller.signInWithKakao(),
                    child: SvgPicture.asset('assets/kakao.svg'),
                  ),
                  GestureDetector(
                    onTap: () => controller.signInWithGoogle(),
                    child: SvgPicture.asset('assets/google.svg'),
                  ),
                  SvgPicture.asset('assets/apple.svg'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildElevatedButton({
  required String title,
  required bool isLogin,
  required GestureTapCallback? onTap,
}) {
  return InkWell(
    overlayColor: WidgetStateProperty.all(Colors.transparent),
    onTap: onTap,
    child: Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          12,
        ),
        gradient: !isLogin
            ? LinearGradient(
                colors: [
                  Colors.deepPurple.shade600,
                  Colors.purple,
                ],
              )
            : null,
      ),
      child: Center(
        child: Text(
          title,
          style: AppTextStyle.body14B(
            color: !isLogin ? Colors.white : Colors.black87,
          ),
        ),
      ),
    ),
  );
}
