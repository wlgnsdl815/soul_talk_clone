import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:soul_talk_clone/data_source/remote/post_data_source.dart';
import 'package:soul_talk_clone/models/post_model.dart';
import 'package:soul_talk_clone/widgets/community_tile.dart';

class CommunityViewModel extends GetxController {
  final PostDataSource _postDataSource = Get.find<PostDataSource>();
  RxList<PostModel> postList = <PostModel>[].obs;
  RxList<PostModel> filteredPostList = <PostModel>[].obs;
  RxBool isLoading = false.obs;
  CommunityCategory selectedCategory = CommunityCategory.all;

  void onRefresh({
    required RefreshController refreshController,
  }) async {
    await getPosts();
    if (selectedCategory != CommunityCategory.all) {
      getPostsByCategory(selectedCategory);
    }
    // await Future.delayed(const Duration(milliseconds: 1000));
    refreshController.refreshCompleted();
  }

  Future<void> getPosts() async {
    try {
      postList.value = await _postDataSource.getPosts();
      filteredPostList.value = postList;
    } finally {
      isLoading.value = false;
    }
  }

  void getPostsByCategory(CommunityCategory category) {
    filteredPostList.value =
        postList.where((post) => post.category == category.category).toList();
  }

  void onTabBarTap({required int index}) {
    if (index == 0) {
      filteredPostList.value = postList;
    }
  }

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    getPosts();
  }
}
