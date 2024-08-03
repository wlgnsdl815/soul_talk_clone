import 'package:get/get.dart';
import 'package:soul_talk_clone/data_source/auth_data_source.dart';

class LoginViewModel extends GetxController {
  final AuthDataSource _authDataSource = Get.find<AuthDataSource>();

  RxBool saveLoginInfo = false.obs;
  RxBool isLoading = false.obs;

  Future<void> signInWithKakao() async {
    isLoading.value = true;
    await _authDataSource.signInWithKakao();
    isLoading.value = false;
  }

  Future<void> signInWithGoogle() async {
    isLoading.value = true;
    await _authDataSource.signInWithGoogle();
    isLoading.value = false;
  }
}
