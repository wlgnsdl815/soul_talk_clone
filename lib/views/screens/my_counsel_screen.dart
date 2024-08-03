import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:get/get.dart';
// import 'package:soul_talk_clone/view_models/my_counsel_view_model.dart';
import 'package:gap/gap.dart';
import 'package:soul_talk_clone/utils/styles/app_colors.dart';
import 'package:soul_talk_clone/utils/styles/app_text_styles.dart';

class MyCounselScreen extends HookWidget {
  const MyCounselScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<MyCounselViewModel>();
    final tabController = useTabController(initialLength: 3);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('전체 상담 리스트',
                  style: AppTextStyle.body12B(color: Colors.white)),
              const Icon(Icons.search, color: Colors.white),
            ],
          ),
        ),
        const Gap(20),
        SizedBox(
          height: 60,
          child: TabBar(
            controller: tabController,
            tabs: const [
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('진행중 상담'),
                    Text('0', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('완료된 상담'),
                    Text('0', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('취소된 상담'),
                    Text('0', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ],
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.orange,
                width: 3,
              ),
            ),
            labelPadding: const EdgeInsets.symmetric(horizontal: 4),
            labelStyle: AppTextStyle.body14B(color: AppColors.orange),
            unselectedLabelColor: Colors.white,
            dividerColor: Colors.transparent,
          ),
        ),
        const Gap(20),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: AppColors.orange,
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.orange,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        '상담 시작하기 ➔',
                        style: AppTextStyle.body14B(
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                  child: Text('완료된 상담이 없습니다.',
                      style: AppTextStyle.body14R(color: Colors.white))),
              Center(
                  child: Text('취소된 상담이 없습니다.',
                      style: AppTextStyle.body14R(color: Colors.white))),
            ],
          ),
        ),
      ],
    );
  }
}
