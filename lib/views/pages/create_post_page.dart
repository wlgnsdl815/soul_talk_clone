import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:soul_talk_clone/utils/styles/app_colors.dart';
import 'package:soul_talk_clone/utils/styles/app_text_styles.dart';
import 'package:soul_talk_clone/view_models/create_post_view_model.dart';
import 'package:soul_talk_clone/widgets/image_loader.dart';
import 'package:soul_talk_clone/widgets/post_dropdown_button.dart';
import 'package:soul_talk_clone/widgets/app_elevated_button.dart';
import 'package:soul_talk_clone/widgets/default_layout.dart';
import 'package:soul_talk_clone/widgets/post_text_field.dart';

class CreatePostPage extends GetView<CreatePostViewModel> {
  const CreatePostPage({super.key});

  static const String route = '/createPost';

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Column(
        children: [
          ListTile(
            leading: InkWell(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            title: Text(
              '소울게시글 작성',
              style: AppTextStyle.body14R(),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '특정 상담사님과 관련된 글이라면 상담사님을 태그해주세요!',
                      style: AppTextStyle.body12B(color: AppColors.orange),
                    ),
                    const Gap(10),
                    Obx(
                      () => Row(
                        children: [
                          Expanded(
                            child: AppElevatedButton(
                              buttonType:
                                  controller.tagStatus.value == TagStatus.tagged
                                      ? ButtonType.selected
                                      : ButtonType.blue,
                              title: '상담사님 태그하기',
                              onTap: controller.selectedCounselor,
                            ),
                          ),
                          const Gap(10),
                          Expanded(
                            child: AppElevatedButton(
                              buttonType: controller.tagStatus.value ==
                                      TagStatus.doNotTag
                                  ? ButtonType.selected
                                  : ButtonType.blue,
                              title: '태그하지 않기',
                              onTap: controller.selectedDoNotTag,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(30),
                    PostDropdownButton(
                      labelText: '카테고리',
                      hintText: '카테고리 선택하기',
                      items: const ['칭찬해요', '고민있어요', '질문있어요', '상담문의'],
                      onChanged: (String? newValue) =>
                          controller.selectedCategory.value = newValue,
                    ),
                    const Gap(30),
                    PostTextField(
                      labelText: '제목',
                      hintText: '게시글 제목을 입력해주세요.',
                      onChanged: (value) => controller.postTitle.value = value,
                    ),
                    const Gap(30),
                    Obx(
                      () {
                        if (controller.selectedCategory.value == '고민있어요') {
                          return Column(
                            children: [
                              PostDropdownButton(
                                labelText: '세부 사항',
                                hintText: '고민 세부 사항을 선택해주세요.',
                                items: const [
                                  '직장/이직',
                                  '학업/시험',
                                  '싱글 연애운',
                                  '커플 궁합',
                                  '재회/이별',
                                  '취업/진로',
                                  '금전/사업',
                                  '가족/인간관계',
                                  '기타',
                                ],
                                onChanged: (String? newValue) => controller
                                    .selectedDetailCategory.value = newValue,
                              ),
                              const Gap(30),
                            ],
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                    PostTextField(
                      labelText: '내용',
                      hintText: '상담사 태그 여부 확인후, 카테고리를 선택해주세요.',
                      onChanged: (value) =>
                          controller.postContent.value = value,
                      maxLines: 10,
                    ),
                    const Gap(20),
                    GestureDetector(
                      onTap: controller.pickImage,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.deepBlue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                            const Gap(10),
                            Text(
                              '사진 선택하기',
                              style: AppTextStyle.body12R(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(15),
                    Obx(() {
                      if (controller.imageList.isNotEmpty) {
                        return Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            ...controller.imageList.asMap().entries.map(
                                  (e) => InkWell(
                                    onTap: () {
                                      _showCupertinoDialog(index: e.key);
                                    },
                                    child: SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: ImageLoader(
                                        imagePath: controller.imageList[e.key],
                                      ),
                                    ),
                                  ),
                                ),
                          ],
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
                    const Gap(20),
                    Obx(
                      () => GestureDetector(
                        onTap: controller.buttonDisabled.value == true ||
                                controller.isLoading.value
                            ? null
                            : () => controller.createPost(),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: controller.buttonDisabled.value
                                ? Colors.black.withOpacity(0.2)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            '글쓰기',
                            style: AppTextStyle.body12B(color: Colors.black87),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showCupertinoDialog({
    required int index,
  }) {
    Get.dialog(
      CupertinoAlertDialog(
        title: Text(
          '선택한 사진을 삭제하시겠습니까?',
          style: AppTextStyle.body16B(
            color: Colors.black87,
          ),
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text('취소'),
            onPressed: () => Get.back(),
          ),
          CupertinoDialogAction(
            child: const Text('삭제'),
            onPressed: () {
              controller.deleteImage(index);
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
