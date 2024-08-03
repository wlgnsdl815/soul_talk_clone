import 'package:get/get.dart';
import 'package:soul_talk_clone/data_source/local/user_data_source.dart';
import 'package:soul_talk_clone/data_source/remote/auth_data_source.dart';
import 'package:soul_talk_clone/utils/navigation/app_routes.dart';

class LoginViewModel extends GetxController {
  final AuthDataSource _authDataSource = Get.find<AuthDataSource>();
  final UserDataSource _userDataSource = Get.find<UserDataSource>();

  RxBool saveLoginInfo = false.obs;
  RxBool isLoading = false.obs;

  Future<void> signInWithKakao() async {
    isLoading.value = true;
    await _authDataSource.signInWithKakao();
    Get.offAllNamed(AppRoutes.main);
    isLoading.value = false;
  }

  Future<void> signInWithGoogle() async {
    isLoading.value = true;
    await _authDataSource.signInWithGoogle();
    final user = await _authDataSource.getCurrentUser();
    if (user != null) {
      _userDataSource.saveUserToPreferences(user);
      Get.offAllNamed(AppRoutes.main);
    }
    isLoading.value = false;
  }
}
