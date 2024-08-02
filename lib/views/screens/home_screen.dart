import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:soul_talk_clone/utils/styles/app_colors.dart';
import 'package:soul_talk_clone/utils/styles/app_text_styles.dart';
import 'package:soul_talk_clone/widgets/app_elevated_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color getRandomColor() {
      Random random = Random();
      return Color.fromARGB(
        255,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
    }

    final List<Widget> items = List.generate(30, (index) {
      return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: getRandomColor(),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              '$index / 30',
              style: AppTextStyle.body12R(color: Colors.grey),
            ),
          ),
        ),
      );
    });
    final List<Widget> cards = List.generate(10, (index) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 3),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: getRandomColor(),
        ),
      );
    });

    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.orange,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: AppColors.deepBlue.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.search, color: AppColors.orange),
                        Gap(10),
                        Text('접속 중인 상담사 보기'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.center,
                        '''OO자리 님
오늘은 마음이 통하는 분이 있어요.''',
                        style: AppTextStyle.body12B(
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const Icon(Icons.arrow_circle_right_outlined),
                  ],
                ),
              ),
            ),
            CarouselSlider(
              items: items,
              options: CarouselOptions(
                height: 150,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 300),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {},
                scrollDirection: Axis.horizontal,
              ),
            ),
            _buildDefaultContainer(
              context: context,
              title: '오늘의 추천 상담사',
              children: [
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(
                    4,
                    (index) {
                      return SizedBox(
                        width: (MediaQuery.of(context).size.width - 60) /
                            2, // 2 열로 나누기 위한 너비 계산
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            const Gap(15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('상담사', style: AppTextStyle.body14B()),
                                Text(
                                  '소울토커',
                                  style: AppTextStyle.body12B(
                                      color: AppColors.orange),
                                ),
                              ],
                            ),
                            const Gap(10),
                            const AppElevatedButton(
                              height: 25,
                              buttonType: ButtonType.home,
                              title: '지금 상담 가능',
                            ),
                            const Gap(5),
                            const Row(
                              children: [
                                _InfoRow(icon: Icons.star, text: '5.0'),
                                _InfoRow(icon: Icons.edit_note, text: '291'),
                                _InfoRow(icon: Icons.favorite, text: '??%'),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            _buildDefaultContainer(
              context: context,
              title: '오늘의 카드를 뽑아보세요!',
              children: [
                Row(
                  children: [
                    const Icon(Icons.arrow_back_ios),
                    Expanded(
                      child: CarouselSlider(
                        items: cards,
                        options: CarouselOptions(
                          height: 150,
                          viewportFraction: 0.3,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 300),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {},
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ],
            ),
            _buildDefaultContainer(
              context: context,
              title: '예약 없이 지금 바로 상담하세요!',
              children: [
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(
                    4,
                    (index) {
                      return SizedBox(
                        width: (MediaQuery.of(context).size.width - 60) /
                            2, // 2 열로 나누기 위한 너비 계산
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            const Gap(15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('상담사', style: AppTextStyle.body14B()),
                                Text(
                                  '소울토커',
                                  style: AppTextStyle.body12B(
                                      color: AppColors.orange),
                                ),
                              ],
                            ),
                            const Gap(10),
                            const AppElevatedButton(
                              height: 25,
                              buttonType: ButtonType.home,
                              title: '지금 상담 가능',
                            ),
                            const Gap(5),
                            const Row(
                              children: [
                                _InfoRow(icon: Icons.star, text: '5.0'),
                                _InfoRow(icon: Icons.edit_note, text: '291'),
                                _InfoRow(icon: Icons.favorite, text: '??%'),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDefaultContainer({
    required BuildContext context,
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyle.body16B(),
              ),
              const AppElevatedButton(
                buttonType: ButtonType.home,
                title: '더보기',
                width: 60,
                height: 25,
              ),
            ],
          ),
          const Gap(15),
          ...children,
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
          color: AppColors.orange,
        ),
        Text(
          ' $text',
          style: AppTextStyle.body12B(color: AppColors.orange),
        ),
        const Gap(5),
      ],
    );
  }
}
