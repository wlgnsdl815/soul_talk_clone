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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: _buildPostContent()),
            if (post.imageUrls != null && post.imageUrls!.isNotEmpty)
              _buildPostImage(),
          ],
        ),
        const Divider(
          color: Colors.white70,
          thickness: 0.5,
        ),
      ],
    );
  }

  Widget _buildPostContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCategoryTitle(),
        const Gap(5),
        if (post.category == '예약')
          _buildReservationContent()
        else
          _buildDefaultContent(),
      ],
    );
  }

  Widget _buildCategoryTitle() {
    if (post.category == '예약') {
      return Text(
        '[${post.category}]',
        style: AppTextStyle.body14B(),
      );
    }

    return Text(
      '[${post.category}] ${post.title}',
      style: post.category != '공지'
          ? AppTextStyle.body14B()
          : AppTextStyle.body16B(color: AppColors.orange),
    );
  }

  Widget _buildReservationContent() {
    return Row(
      children: [
        const Icon(Icons.lock_outline, color: Colors.white),
        const Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('상담사 예약 관련 문의', style: AppTextStyle.body14B()),
            Text(
              '작성자와 태그된 상담사만 확인 가능합니다.',
              style: AppTextStyle.body12R(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDefaultContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          post.content,
          style: AppTextStyle.body12R(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          children: [
            _buildCreatedAt(),
            Text(
              ' ﹒ ${post.author?.name ?? 'Unknown'}',
              style: AppTextStyle.body12R(),
            ),
            const Gap(8),
            const Icon(Icons.favorite, color: AppColors.orange, size: 12),
            const Gap(3),
            Text(
              post.likesCount.toString(),
              style: AppTextStyle.body12R(color: AppColors.orange),
            ),
            const Gap(8),
            const Icon(Icons.chat_bubble, color: AppColors.orange, size: 12),
            const Gap(3),
            Text(
              post.commentCount.toString(),
              style: AppTextStyle.body12R(color: AppColors.orange),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPostImage() {
    return Container(
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
