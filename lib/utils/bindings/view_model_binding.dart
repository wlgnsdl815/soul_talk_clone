import 'package:get/get.dart';
import 'package:soul_talk_clone/view_models/login_view_model.dart';
import 'package:soul_talk_clone/view_models/main_view_model.dart';
import 'package:soul_talk_clone/view_models/my_page_view_model.dart';
import 'package:soul_talk_clone/view_models/sign_up_view_model.dart';

class ViewModelBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainViewModel(), fenix: true);
    Get.lazyPut(() => LoginViewModel(), fenix: true);
    Get.lazyPut(() => SignUpViewModel(), fenix: true);
    Get.lazyPut(() => MyPageViewModel(), fenix: true);
  }
}
