import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_talk_clone/data_source/local/user_data_source.dart';
import 'package:soul_talk_clone/data_source/remote/comment_data_source.dart';
import 'package:soul_talk_clone/models/comment_model.dart';
import 'package:soul_talk_clone/models/post_model.dart';
import 'package:soul_talk_clone/models/user_model.dart';

class PostDetailViewModel extends GetxController {
  final CommentDataSource _commentDataSource = Get.find<CommentDataSource>();
  final UserDataSource _userDataSource = Get.find<UserDataSource>();
  final PostModel currentPost = Get.arguments;

  RxList<CommentModel> comments = <CommentModel>[].obs;
  RxBool isLoading = false.obs;
  RxString content = ''.obs;

  Future<void> getComments() async {
    comments.value = await _commentDataSource.getComments(currentPost.id!);
    isLoading.value = false;
  }

  Future<void> createComment(ScrollController scrollController) async {
    UserModel? currentUser = await _userDataSource.getUserFromPreferences();
    CommentModel newComment = CommentModel(
      postId: currentPost.id!,
      authorId: currentUser!.id,
      content: content.value,
    );

    try {
      comments.add(
        newComment.copyWith(
          author: currentUser,
          createdAt: DateTime.now(),
          likesCount: 0,
        ),
      );

      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });

      await _commentDataSource.createComment(newComment);
    } catch (e) {
      comments.removeWhere((comment) => comment == newComment);
    }
  }

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    getComments();
  }
}
