import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:soul_talk_clone/utils/styles/app_text_styles.dart';
import 'package:soul_talk_clone/view_models/sign_up_view_model.dart';
import 'package:soul_talk_clone/widgets/auth_text_field.dart';
import 'package:soul_talk_clone/widgets/default_dialog.dart';
import 'package:soul_talk_clone/widgets/default_layout.dart';

class SignUpPage extends GetView<SignUpViewModel> {
  const SignUpPage({super.key});

  static const String route = '/signUp';

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    leading: IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    title: const Text('회원가입'),
                  ),
                  const Gap(30),
                  _buildTextField(
                    title: '이메일',
                    hintText: '이메일을 입력해주세요',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '이메일을 입력해주세요';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                          .hasMatch(value)) {
                        return '이메일을 올바르게 입력해주세요';
                      }
                      return null;
                    },
                    onChanged: (value) => controller.email.value = value,
                  ),
                  Obx(
                    () {
                      if (controller.email.value.isNotEmpty) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  .hasMatch(controller.email.value)) {
                                Get.dialog(
                                  DefaultDialog(
                                    content: '이메일을 올바르게 입력해주세요',
                                    onConfirm: () => Get.back(),
                                  ),
                                );
                              } else {
                                Get.dialog(
                                  DefaultDialog(
                                    content:
                                        '인증번호가 해당 이메일로 발송되었습니다.\n인증번호 확인 후 인증을 완료해주세요.\n메일 수신이 되지 않는 경우는 스팸 메일함을 확인해주세요!',
                                    onConfirm: () => Get.back(),
                                  ),
                                );
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                Colors.black.withOpacity(0.3),
                              ),
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: const BorderSide(
                                      color: Colors.white, width: 1),
                                ),
                              ),
                            ),
                            child:
                                Text('인증 메일 받기', style: AppTextStyle.body14R()),
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                  const Gap(30),
                  _buildTextField(
                    title: '비밀번호',
                    hintText: '8자 이상 영문/숫자 조합',
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '비밀번호를 입력해주세요';
                      } else if (!RegExp(
                              r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$')
                          .hasMatch(value)) {
                        return '8자 이상의 영문/숫자 조합으로 입력해주세요';
                      }
                      return null;
                    },
                    onChanged: (value) => controller.password.value = value,
                  ),
                  const Gap(30),
                  _buildTextField(
                    title: '비밀번호 확인',
                    hintText: '8자 이상 영문/숫자 조합',
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '비밀번호를 다시 입력해주세요';
                      } else if (value != controller.password.value) {
                        return '비밀번호가 일치하지 않습니다';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  Colors.black.withOpacity(0.3),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                    side: const BorderSide(color: Colors.white, width: 1),
                  ),
                ),
              ),
              child: Text('다음', style: AppTextStyle.body14R()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      {required String title,
      required String hintText,
      String? Function(String?)? validator,
      ValueChanged<String>? onChanged,
      bool? obscureText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: AppTextStyle.body16B(),
              ),
              Text(' *', style: AppTextStyle.body16B(color: Colors.red)),
            ],
          ),
          const Gap(10),
          AuthTextField(
            hintText: hintText,
            validator: validator,
            onChanged: onChanged,
            obscureText: obscureText,
          ),
        ],
      ),
    );
  }
}
