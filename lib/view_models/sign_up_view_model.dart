import 'package:get/get.dart';
// import 'package:soul_talk_clone/data_source/remote/auth_data_source.dart';

class SignUpViewModel extends GetxController {
  // final AuthDataSource _authDataSource = Get.find<AuthDataSource>();

  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString errorMessage = ''.obs;
}
