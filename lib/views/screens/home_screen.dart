import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:soul_talk_clone/utils/styles/app_colors.dart';
import 'package:soul_talk_clone/utils/styles/app_text_styles.dart';
import 'package:soul_talk_clone/widgets/app_elevated_button.dart';
import 'package:soul_talk_clone/widgets/community_tile.dart';

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
        margin: const EdgeInsets.symmetric(horizontal: 3),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: getRandomColor(),
        ),
      );
    });

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
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
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CarouselSlider(
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
            ),
            _buildDefaultContainer(
              context: context,
              title: '오늘의 추천 상담사',
              children: [
                _buildContentCard(
                  context: context,
                  contentHeight: 120,
                  contents: [
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('상담사', style: AppTextStyle.body14B()),
                        Text(
                          '소울토커',
                          style: AppTextStyle.body12B(color: AppColors.orange),
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
              ],
            ),
            _buildDefaultContainer(
              context: context,
              title: '오늘의 카드를 뽑아보세요!',
              children: [
                Center(
                  child: Row(
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
                ),
              ],
            ),
            _buildDefaultContainer(
              context: context,
              title: '예약 없이 지금 바로 상담하세요!',
              children: [
                _buildContentCard(
                  context: context,
                  contentHeight: 120,
                  contents: [
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('상담사', style: AppTextStyle.body14B()),
                        Text(
                          '소울토커',
                          style: AppTextStyle.body12B(color: AppColors.orange),
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
              ],
            ),
            _buildDefaultContainer(
              context: context,
              title: '나를 이해하는 소울 테스트',
              children: [
                _buildContentCard(
                  context: context,
                  contents: [
                    const Gap(5),
                    Text(
                      '나는 어떤 소울의 여신일까?',
                      style: AppTextStyle.body12R(),
                    ),
                  ],
                ),
              ],
            ),
            _buildDefaultContainer(
              context: context,
              title: '나에게 맞는 상담사 찾기',
              titleGap: 5,
              children: [
                Text(
                  '고민을 선택하시면 다음 단계로 안내해 드릴게요',
                  style: AppTextStyle.body12R(),
                ),
                const Gap(20),
                _buildContentCard(
                  context: context,
                  contentLength: 9,
                  rowCount: 3,
                  contentHeight: 100,
                  contents: [
                    const Text('싱글 연애운'),
                  ],
                ),
              ],
            ),
            _buildDefaultContainer(
              context: context,
              title: '후기별 추천 상담사',
              horizontalPadding: 0,
              children: [
                SizedBox(
                  height: 220,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Gap(10),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: index == 0 ? 20 : 0,
                          right: index == 9 ? 20 : 0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                '내공 있어요',
                                style:
                                    AppTextStyle.body14R(color: Colors.black87),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Gap(10),
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            const Gap(5),
                            Text(
                              '바이올렛타라',
                              style: AppTextStyle.body16B(),
                            ),
                            Text(
                              '소울마스터',
                              style: AppTextStyle.body14R(
                                color: AppColors.orange,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const Gap(30),
            _buildDefaultContainer(
              context: context,
              title: '소울 커뮤니티',
              children: [
                const Gap(10),
                const CommunityTile(),
                const CommunityTile(),
                const CommunityTile(),
              ],
            ),
            _buildDefaultContainer(
              context: context,
              title: '소울이 있는 만남, 소울소사이어티 도서',
              hasButton: false,
              horizontalPadding: 0,
              children: [
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Gap(10),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: index == 0 ? 20 : 0,
                          right: index == 9 ? 20 : 0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration:
                                  const BoxDecoration(color: Colors.amber),
                            ),
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
              title: '소울톡 추천 동영상',
              hasButton: false,
              horizontalPadding: 0,
              children: [
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Gap(10),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: index == 0 ? 20 : 0,
                          right: index == 9 ? 20 : 0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 160,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(12)),
                            ),
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
              title: '최근 상담 받은 상담사',
              hasButton: false,
              children: [const Text('최근 상담 내역이 없습니다')],
            ),
            _buildDefaultContainer(
              context: context,
              title: '찜한 상담사',
              hasButton: false,
              children: [const Text('"상담사 찜하기"를 통해 빠르게 상담해 보세요')],
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }

  Widget _buildDefaultContainer({
    required BuildContext context,
    required String title,
    required List<Widget> children,
    bool? hasButton = true,
    double? titleGap,
    double? horizontalPadding,
    EdgeInsetsGeometry? margin,
  }) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          horizontalPadding ?? 20, 20, horizontalPadding ?? 20, 0),
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding != null ? 20 : 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: AppTextStyle.body16B(),
                ),
                if (hasButton == true)
                  const AppElevatedButton(
                    buttonType: ButtonType.home,
                    title: '더보기',
                    width: 60,
                    height: 25,
                  ),
              ],
            ),
          ),
          Gap(titleGap ?? 15),
          ...children,
        ],
      ),
    );
  }

  // 콘텐츠 카드
  Widget _buildContentCard({
    required BuildContext context,
    int? contentLength,
    int? rowCount,
    double? contentHeight,
    required List<Widget> contents, // TODO: 실제 콘텐츠로 변경하기
  }) {
    return Center(
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: List.generate(
          contentLength ?? 4,
          (index) {
            return SizedBox(
              width: (MediaQuery.of(context).size.width - 60) / (rowCount ?? 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: contentHeight ?? 120,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const Gap(5),
                  ...contents,
                ],
              ),
            );
          },
        ),
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
