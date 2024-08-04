import 'package:get/get.dart';
import 'package:soul_talk_clone/data_source/local/user_data_source.dart';
import 'package:soul_talk_clone/data_source/remote/auth_data_source.dart';
import 'package:soul_talk_clone/data_source/remote/comment_data_source.dart';
import 'package:soul_talk_clone/data_source/remote/post_data_source.dart';

class DataSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthDataSource(), fenix: true);
    Get.lazyPut(() => UserDataSource(), fenix: true);
    Get.lazyPut(() => PostDataSource(), fenix: true);
    Get.lazyPut(() => CommentDataSource(), fenix: true);
  }
}
