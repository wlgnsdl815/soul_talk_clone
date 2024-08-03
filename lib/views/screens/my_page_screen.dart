import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:soul_talk_clone/utils/styles/app_colors.dart';
import 'package:soul_talk_clone/utils/styles/app_text_styles.dart';
import 'package:soul_talk_clone/view_models/my_page_view_model.dart';

class MyPageScreen extends GetView<MyPageViewModel> {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Obx(
          () => controller.isLoading.value == true
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('내 정보'),
                          Icon(Icons.notifications_outlined),
                        ],
                      ),
                    ),
                    const Gap(30),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: controller.currentUser.value!.profileImageUrl !=
                              null
                          ? Image.network(
                              controller.currentUser.value!.profileImageUrl!)
                          : const CircleAvatar(),
                    ),
                    const Gap(10),
                    Obx(
                      () => Text(
                        controller.currentUser.value!.name,
                        style: AppTextStyle.body14R(),
                      ),
                    ),
                    Text(
                      '고객님의 소울톡 앱은 1.0.0 최신 버전입니다',
                      style: AppTextStyle.body14R(),
                    ),
                    const Gap(20),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.orange),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  '내 쿠키',
                                  style: AppTextStyle.body12R(),
                                ),
                                Text(
                                  '0 쿠키',
                                  style: AppTextStyle.body14B(
                                    color: AppColors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const VerticalDivider(
                            thickness: 1,
                            color: AppColors.orange,
                            indent: 10,
                            endIndent: 10,
                          ),
                          Expanded(
                            child: Text(
                              '쿠키 충전하기',
                              style: AppTextStyle.body12R(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.separated(
                      padding: const EdgeInsets.all(20),
                      separatorBuilder: (BuildContext context, int index) {
                        return const Gap(10);
                      },
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.buttonItems.length,
                      itemBuilder: (context, index) {
                        if (index == 3) {
                          return InkWell(
                            onTap: controller.buttonItems[index].onTap,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.orange, width: 2.5),
                                color: Colors.black.withOpacity(0.4),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.buttonItems[index].title,
                                    style: AppTextStyle.body12B(
                                        color: AppColors.orange),
                                  ),
                                  const Icon(Icons.navigate_next),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return InkWell(
                            onTap: controller.buttonItems[index].onTap,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.buttonItems[index].title,
                                    style: AppTextStyle.body12R(),
                                  ),
                                  const Icon(Icons.navigate_next),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
