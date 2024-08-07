import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:soul_talk_clone/utils/styles/app_text_styles.dart';
import 'package:soul_talk_clone/view_models/post_detail_view_model.dart';
import 'package:soul_talk_clone/widgets/default_layout.dart';
import 'package:soul_talk_clone/widgets/image_loader.dart';

class PostDetailPage extends HookWidget {
  const PostDetailPage({super.key});

  static const String route = '/post/detail';

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PostDetailViewModel>();
    final textController = useTextEditingController();

    return DefaultLayout(
      hasSafeArea: false,
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        child: ImageLoader(
                          imagePath:
                              controller.currentPost.author!.profileImageUrl!,
                        ),
                      ),
                      const Gap(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.currentPost.author!.name,
                            style: AppTextStyle.body14B(),
                          ),
                          Text(
                            _buildCreatedAt(controller.currentPost.createdAt!),
                            style: AppTextStyle.body12R(),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      controller.currentPost.title,
                      style: AppTextStyle.body20B(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  if (controller.currentPost.imageUrls!.isNotEmpty)
                    Column(
                      children: [
                        const Gap(30),
                        SizedBox(
                          height: 200,
                          child: PageView.builder(
                            itemCount: controller.currentPost.imageUrls!.length,
                            itemBuilder: (context, index) {
                              return ImageLoader(
                                imagePath:
                                    controller.currentPost.imageUrls![index],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  const Gap(40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      controller.currentPost.content,
                      style: AppTextStyle.body14B(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Gap(40),
                  Text(
                    '댓글 ${controller.currentPost.commentCount}개',
                    style: AppTextStyle.body12R(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              TextField(
                controller: textController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: '댓글을 입력해주세요',
                  hintStyle: TextStyle(fontSize: 12),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  suffixIcon: Icon(
                    Icons.send,
                    color: Colors.grey,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              Container(color: Colors.white, height: 40),
            ],
          ),
        ],
      ),
    );
  }

  String _buildCreatedAt(DateTime date) {
    final formattedDate = DateFormat('yy.MM.dd HH:mm').format(date);
    return formattedDate;
  }
}
