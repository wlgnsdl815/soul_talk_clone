import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:soul_talk_clone/utils/navigation/app_routes.dart';
import 'package:soul_talk_clone/utils/styles/app_text_styles.dart';
import 'package:soul_talk_clone/widgets/community_tile.dart';

class CommunityScreen extends HookWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController =
        useTabController(initialLength: CommunityCategory.values.length);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '소울 커뮤니티',
                style: AppTextStyle.body12R(color: Colors.white),
              ),
              InkWell(
                onTap: () => Get.toNamed(AppRoutes.createPost),
                child: Row(
                  children: [
                    const Icon(Icons.edit, color: Colors.white),
                    const Gap(10),
                    Text(
                      '글쓰기',
                      style: AppTextStyle.body12B(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Gap(20),
        Text(
          '앱 오류, 결제, 상담 품질 관련 문의는 소울톡 고객센터로 연락 바랍니다.',
          style: AppTextStyle.body12R(color: Colors.white54),
          textAlign: TextAlign.start,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 40),
          child: TabBar(
            controller: tabController,
            tabs: CommunityCategory.values
                .map((e) => Tab(
                      text: e.category,
                    ))
                .toList(),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 0.1,
            labelStyle: AppTextStyle.body14B(color: Colors.white),
            unselectedLabelColor: Colors.white,
            dividerColor: Colors.transparent,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(
                color: Colors.white,
                width: 1,
              ),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: CommunityCategory.values.map((category) {
              return Center(
                child: Text(
                  '${category.category} 화면',
                  style: AppTextStyle.body14R(color: Colors.white),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
