import 'package:flutter/material.dart';
import 'package:soul_talk_clone/utils/styles/app_text_styles.dart';

class CommunityTile extends StatelessWidget {
  const CommunityTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '[예약]',
          style: AppTextStyle.body14B(),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(
            Icons.lock_outline,
            color: Colors.white,
          ),
          title: Text(
            '상담사 예약 관련 문의',
            style: AppTextStyle.body14B(),
          ),
          subtitle: Text(
            '작성자와 태그된 상담사만 확인 가능합니다.',
            style: AppTextStyle.body12R(),
          ),
        ),
        const Divider(
          color: Colors.white70,
          thickness: 0.5,
        )
      ],
    );
  }
}

enum CommunityCategory {
  all('전체'),
  notice('공지'),
  review('후기'),
  concern('고민'),
  question('질문'),
  reservation('예약');

  final String category;

  const CommunityCategory(this.category);
}
