import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:soul_talk_clone/models/post_model.dart';
import 'package:soul_talk_clone/utils/styles/app_colors.dart';
import 'package:soul_talk_clone/utils/styles/app_text_styles.dart';
import 'package:soul_talk_clone/widgets/image_loader.dart';

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
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (post.category == '예약')
                    Text(
                      '[${post.category}]',
                      style: AppTextStyle.body14B(),
                    ),
                  const Gap(5),
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
                  if (post.category != '예약')
                    Row(
                      children: [
                        _buildCreatedAt(),
                        Text(
                          ' ﹒ ${post.author?.name ?? 'Unknown'}',
                          style: AppTextStyle.body12R(),
                        ),
                        const Gap(8),
                        const Icon(
                          Icons.favorite,
                          color: AppColors.orange,
                          size: 12,
                        ),
                        const Gap(3),
                        Text(
                          post.likesCount.toString(),
                          style: AppTextStyle.body12R(
                            color: AppColors.orange,
                          ),
                        ),
                        const Gap(8),
                        const Icon(
                          Icons.chat_bubble,
                          color: AppColors.orange,
                          size: 12,
                        ),
                        const Gap(3),
                        Text(
                          post.commentCount.toString(),
                          style: AppTextStyle.body12R(
                            color: AppColors.orange,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            if (post.imageUrls != null && post.imageUrls!.isNotEmpty)
              Container(
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.only(left: 8.0),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ImageLoader(
                  imagePath: post.imageUrls!.first,
                  fit: BoxFit.cover,
                ),
              ),
          ],
        ),
        const Divider(
          color: Colors.white70,
          thickness: 0.5,
        ),
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
