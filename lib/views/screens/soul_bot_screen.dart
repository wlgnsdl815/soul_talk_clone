import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:soul_talk_clone/utils/const/strings.dart';
import 'package:soul_talk_clone/utils/styles/app_text_styles.dart';
import 'package:soul_talk_clone/widgets/app_elevated_button.dart';

class SoulBotScreen extends StatelessWidget {
  const SoulBotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '똑똑똑! 소울봇이 찾아왔어요 💫',
            style: AppTextStyle.body20B(),
            textAlign: TextAlign.center,
          ),
          const Gap(20),
          const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white,
          ),
          const Gap(20),
          Text(
            '소울봇',
            style: AppTextStyle.body16B(),
            textAlign: TextAlign.center,
          ),
          const Gap(20),
          Text(
            Strings.soulBotExplanation,
            style: AppTextStyle.body12R(color: Colors.white),
          ),
          const Gap(20),
          Text(
            '유의사항',
            style: AppTextStyle.body20B(),
          ),
          const Gap(5),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(0.3),
            ),
            child: Column(
              children: [
                _buildNotices(content: '소울봇과 나눈 대화 내용은 매일 자정에 사라져요.'),
                _buildNotices(content: '소울봇의 타로 상담은 하루에 3번만 가능해요.'),
                _buildNotices(
                    content: '소울봇의 타로 상담 중, 같은 주제의 상담은 하루에 1번만 가능해요.'),
                _buildNotices(
                    content:
                        '컴퓨터로 학습한 소울봇의 타로 풀이는 실제 사람의 소울이 담긴 소울톡 상담사 분들의 풀이와 다소 다를 수 있어요.'),
                _buildNotices(
                    content:
                        '소울봇의 타로 상담은 지금도 발전하는 중이에요. 만족스러운 풀이가 될 수 있도록 계속 배워나갈게요.'),
              ],
            ),
          ),
          const Gap(20),
          const Row(
            children: [
              Expanded(
                child: AppElevatedButton(
                  buttonType: ButtonType.blue,
                  title: '피드백 하러 가기',
                ),
              ),
              Gap(15),
              Expanded(
                child: AppElevatedButton(
                  buttonType: ButtonType.white,
                  title: '소울봇 시작하기',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNotices({
    required String content,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.lightbulb_rounded,
            size: 20,
            color: Colors.white,
          ),
          const Gap(10),
          Expanded(
            child: Text(
              content,
              style: AppTextStyle.body12R(),
            ),
          ),
        ],
      ),
    );
  }
}
