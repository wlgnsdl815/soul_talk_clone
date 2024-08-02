import 'package:get/get.dart';
import 'package:soul_talk_clone/data_source/auth_data_source.dart';

class SignUpViewModel extends GetxController {
  final AuthDataSource _authDataSource = Get.find<AuthDataSource>();

  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString errorMessage = ''.obs;

  Future<void> sendVerificationEmail() async {
    try {
      await _authDataSource.sendSignUpEmailVerification(email.value);
      errorMessage.value = '인증 이메일이 전송되었습니다.';
    } catch (e) {
      errorMessage.value = '인증 이메일 전송에 실패했습니다: ${e.toString()}';
    }
  }

  Future<void> registerUser() async {
    try {
      bool isVerified = await _authDataSource.checkIfEmailVerified(email.value);
      if (isVerified) {
        await _authDataSource.registerUser(email.value, password.value);
        errorMessage.value = '회원가입에 성공했습니다.';
      } else {
        errorMessage.value = '이메일이 인증되지 않았습니다. 이메일을 먼저 인증해주세요.';
      }
    } catch (e) {
      errorMessage.value = '회원가입에 실패했습니다: ${e.toString()}';
    }
  }
}
