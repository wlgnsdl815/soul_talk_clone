import 'package:get/get.dart';
import 'package:soul_talk_clone/data_source/remote/comment_data_source.dart';
import 'package:soul_talk_clone/models/comment_model.dart';
import 'package:soul_talk_clone/models/post_model.dart';

class PostDetailViewModel extends GetxController {
  final CommentDataSource _commentDataSource = Get.find<CommentDataSource>();
  final PostModel currentPost = Get.arguments;
  RxList<CommentModel> comments = <CommentModel>[].obs;
  RxBool isLoading = false.obs;

  Future<void> getComments() async {
    comments.value = await _commentDataSource.getComments(currentPost.id!);
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    getComments();
  }
}
