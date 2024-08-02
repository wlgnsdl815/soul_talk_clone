import 'package:get/get.dart';
import 'package:soul_talk_clone/data_source/auth_data_source.dart';
import 'package:soul_talk_clone/utils/navigation/app_routes.dart';

class LoginViewModel extends GetxController {
  final AuthDataSource _authDataSource = Get.find<AuthDataSource>();

  RxBool saveLoginInfo = false.obs;
  RxBool isLoading = false.obs;

  Future<void> signInWithGoogle() async {
    isLoading.value = true;
    Get.offAllNamed(AppRoutes.main);
    isLoading.value = false;
  }
}
