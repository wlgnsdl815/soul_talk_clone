import 'package:get/get.dart';

class MainViewModel extends GetxController {
  RxInt currentPage = 0.obs;

  void jumpToPage(int index) => currentPage(index);
}
