import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:soul_talk_clone/models/post_model.dart';
import 'package:soul_talk_clone/utils/styles/app_colors.dart';
import 'package:soul_talk_clone/utils/styles/app_text_styles.dart';

class PostTile extends StatelessWidget {
  final PostModel post;
  const PostTile({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (post.category == '예약')
          Text(
            '[${post.category}]',
            style: AppTextStyle.body14B(),
          ),
        const Gap(5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (post.category == '예약')
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.lock_outline,
                  color: Colors.white,
                ),
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (post.category != '예약')
                    Text(
                      '[${post.category}] ${post.title}',
                      style: post.category != '공지'
                          ? AppTextStyle.body14B()
                          : AppTextStyle.body16B(
                              color: AppColors.orange,
                            ),
                    )
                  else
                    Text(
                      post.title,
                      style: AppTextStyle.body14B(),
                    ),
                  Text(
                    post.category == '예약'
                        ? '작성자와 태그된 상담사만 확인 가능합니다.'
                        : post.content,
                    style: AppTextStyle.body12R(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
        if (post.category != '예약')
          Row(
            children: [
              _buildCreatedAt(),
              Text(
                ' ﹒ ',
                style: AppTextStyle.body12B(),
              ),
            ],
          ),
        const Divider(
          color: Colors.white70,
          thickness: 0.5,
        )
      ],
    );
  }

  Widget _buildCreatedAt() {
    final formattedDate =
        DateFormat('MM월 dd일').format(post.createdAt ?? DateTime.now());
    return Text(
      formattedDate,
      style: AppTextStyle.body12R(),
    );
  }
}

// enum CommunityCategory {
//   all('전체'),
//   notice('공지'),
//   review('후기'),
//   concern('고민'),
//   question('질문'),
//   reservation('예약');

//   final String category;

//   const CommunityCategory(this.category);
// }
